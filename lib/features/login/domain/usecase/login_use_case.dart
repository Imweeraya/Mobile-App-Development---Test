import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/user.dart';
import '../repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failure,User>> call({required String email,required String password}) async {
    return await repository.login(email, password);
  }
}
