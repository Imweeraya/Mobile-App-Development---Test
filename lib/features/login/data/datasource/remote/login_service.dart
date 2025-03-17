import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/utils/constants.dart';
import '../../model/user_model.dart';

part 'login_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class LoginService {
  factory LoginService(Dio dio) = _LoginService;

  @POST("/auth/login")
  Future<HttpResponse<UserModel>> login(
      @Body() Map<String, dynamic> credentials,
      );
}
