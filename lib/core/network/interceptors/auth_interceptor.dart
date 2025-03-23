import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../features/login/data/datasource/local/user_local_data_source.dart';
import '../../../main.dart';

class AuthInterceptor extends Interceptor {
  final UserLocalDataSource localDataSource;
  final GoRouter router;

  AuthInterceptor({required this.localDataSource, required this.router});

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      localDataSource.clearUser();
      router.go('/login');
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          content: Text('Session expired. Please log in again.'),
          duration: Duration(seconds: 3),
        ),
      );

    }
    handler.next(err);
  }
}