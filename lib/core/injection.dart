import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_app_test/core/utils/constants.dart';
import 'package:mobile_app_test/features/task_board/data/datasource/remote/task_remote_data_source.dart';
import 'package:mobile_app_test/features/task_board/data/datasource/remote/task_service.dart';
import 'package:mobile_app_test/features/task_board/data/repositories/task_repository_implementation.dart';
import 'package:mobile_app_test/features/task_board/domain/usecase/get_task_list_use_case.dart';
import 'package:mobile_app_test/features/task_board/presentation/bloc/task_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../features/login/data/datasource/local/user_local_data_source.dart';
import '../features/login/data/datasource/remote/login_remote_data_source.dart';
import '../features/login/data/datasource/remote/login_service.dart';
import '../features/login/data/repositories/login_repository_implementation.dart';
import '../features/login/domain/repositories/login_repository.dart';
import '../features/login/domain/usecase/check_login_status_use_case.dart';
import '../features/login/domain/usecase/login_use_case.dart';
import '../features/login/presentation/bloc/login_bloc.dart';
import '../features/task_board/domain/repositories/task_repository.dart';
import '../features/task_board/domain/usecase/get_user_data_use_case.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  // External dependencies
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences,
  );

  final appDocDir = await getApplicationDocumentsDirectory();
  final cookiePath = "${appDocDir.path}/.cookies/";
  final cookieJar = PersistCookieJar(storage: FileStorage(cookiePath));

  serviceLocator.registerLazySingleton<CookieJar>(() => cookieJar);

  serviceLocator.registerLazySingleton<Dio>(() {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        contentType: 'application/json',
        headers: {'Accept': 'application/json'},
      ),
    );

    dio.interceptors.add(CookieManager(serviceLocator<CookieJar>()));
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ),
    );

    return dio;
  });

  // Services
  serviceLocator.registerLazySingleton<LoginService>(
    () => LoginService(serviceLocator<Dio>()),
  );
  serviceLocator.registerLazySingleton<TaskService>(
    () => TaskService(serviceLocator<Dio>()),
  );

  // Data Sources
  serviceLocator.registerLazySingleton<UserLocalDataSource>(
    () => UserLocalDataSourceImpl(sharedPreferences: sharedPreferences),
  );
  serviceLocator.registerLazySingleton<LoginRemoteDataSource>(
    () => LoginRemoteDataSourceImpl(service: serviceLocator<LoginService>()),
  );
  serviceLocator.registerLazySingleton<TaskRemoteDataSource>(
    () => TaskRemoteDataSourceImpl(service: serviceLocator<TaskService>()),
  );

  // Repositories
  serviceLocator.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(
      remoteDataSource: serviceLocator<LoginRemoteDataSource>(),
      localDataSource: serviceLocator<UserLocalDataSource>(),
    ),
  );
  serviceLocator.registerLazySingleton<TaskRepository>(
    () => TaskRepositoryImpl(
      remoteDataSource: serviceLocator<TaskRemoteDataSource>(),
    ),
  );

  //UseCase
  serviceLocator.registerFactory(() => LoginUseCase(serviceLocator()));
  serviceLocator.registerFactory(() => GetTaskListUseCase(serviceLocator()));
  serviceLocator.registerFactory(() => CheckLoginStatusUseCase(serviceLocator()));
  serviceLocator.registerFactory(() => GetUserDataUseCase(serviceLocator()));

  //Bloc
  serviceLocator.registerFactory(
    () => LoginBloc(loginUseCase: serviceLocator()),
  );
  serviceLocator.registerFactory(() => TaskBloc(getTaskListUseCase: serviceLocator(), getUserDataUseCase: serviceLocator()));
}
