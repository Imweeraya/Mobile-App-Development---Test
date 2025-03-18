import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../features/login/data/datasource/remote/login_remote_data_source.dart';
import '../features/login/data/datasource/remote/login_service.dart';
import '../features/login/data/repositories/login_repository_implementation.dart';
import '../features/login/domian/repositories/login_repository.dart';

final serviceLocator = GetIt.instance;

void init() {
  serviceLocator.registerLazySingleton<Dio>(() => Dio());

  // Services
  serviceLocator.registerLazySingleton<LoginService>(() => LoginService(serviceLocator<Dio>()));

  // Data Sources
  serviceLocator.registerLazySingleton<LoginRemoteDataSource>(
          () => LoginRemoteDataSourceImpl(service: serviceLocator<LoginService>()));

  // Repositories
  serviceLocator.registerLazySingleton<LoginRepository>(
          () => LoginRepositoryImpl(remoteDataSource: serviceLocator<LoginRemoteDataSource>()));
}