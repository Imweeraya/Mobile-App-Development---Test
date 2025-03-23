import 'package:dio/dio.dart';

import '../../../../../core/error/exception.dart';
import '../../model/user_model.dart';
import 'login_service.dart';


abstract class LoginRemoteDataSource {
  Future<UserModel> login(String email, String password);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final LoginService service;

  LoginRemoteDataSourceImpl({required this.service});

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      final response = await service.login({"email": email, "password": password});
      return response.data;
    } on DioException catch (e) {
      throw ServerException(message: e.response?.statusMessage ?? "Something went wrong");
    }
  }
}
