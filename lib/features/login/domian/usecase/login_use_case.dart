import 'package:dartz/dartz.dart';
import 'package:mobile_app_test/features/login/domian/repositories/login_repository.dart';
import '../../../../core/error/failure.dart';
import '../entities/user.dart';

class LoginUseCase {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failure,User>> call({required String email,required String password}) async {
    return await repository.login(email, password);
  }
}
