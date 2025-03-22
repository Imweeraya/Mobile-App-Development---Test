import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_app_test/features/login/domian/usecase/login_use_case.dart';
import 'package:mobile_app_test/features/task_board/data/datasource/remote/task_remote_data_source.dart';
import 'package:mobile_app_test/features/task_board/data/datasource/remote/task_service.dart';
import 'package:mobile_app_test/features/task_board/data/repositories/task_repository_implementation.dart';
import 'package:mobile_app_test/features/task_board/domian/repositories/task_repository.dart';

import '../features/login/data/datasource/remote/login_remote_data_source.dart';
import '../features/login/data/datasource/remote/login_service.dart';
import '../features/login/data/repositories/login_repository_implementation.dart';
import '../features/login/domian/repositories/login_repository.dart';
import '../features/login/presentation/bloc/login_bloc.dart';

final serviceLocator = GetIt.instance;

void init() {
  serviceLocator.registerLazySingleton<Dio>(() => Dio());

  // Services
  serviceLocator.registerLazySingleton<LoginService>(() => LoginService(serviceLocator<Dio>()));
  serviceLocator.registerLazySingleton<TaskService>(() => TaskService(serviceLocator<Dio>()));

  // Data Sources
  serviceLocator.registerLazySingleton<LoginRemoteDataSource>(
          () => LoginRemoteDataSourceImpl(service: serviceLocator<LoginService>()));
  serviceLocator.registerLazySingleton<TaskRemoteDataSource>(
          () => TaskRemoteDataSourceImpl(service: serviceLocator<TaskService>()));

  // Repositories
  serviceLocator.registerLazySingleton<LoginRepository>(
          () => LoginRepositoryImpl(remoteDataSource: serviceLocator<LoginRemoteDataSource>()));
  serviceLocator.registerLazySingleton<TaskRepository>(
          () => TaskRepositoryImpl(remoteDataSource: serviceLocator<TaskRemoteDataSource>()));

  //UseCase
  serviceLocator.registerFactory(() => LoginUseCase(serviceLocator()));
  
  //Bloc
  serviceLocator.registerFactory(() => LoginBloc(loginUseCase: serviceLocator()));
}