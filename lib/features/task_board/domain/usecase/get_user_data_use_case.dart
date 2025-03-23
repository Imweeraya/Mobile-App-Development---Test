
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../login/domain/entities/user.dart';
import '../../../login/domain/repositories/login_repository.dart';

class GetUserDataUseCase {
  final LoginRepository loginRepository;

  GetUserDataUseCase(this.loginRepository);

  Future<Either<Failure, User?>> getUserData() async {
    return await loginRepository.getLastLoggedInUser();
  }
}