import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasource/remote/login_remote_data_source.dart';


class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;

  LoginRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final userModel = await remoteDataSource.login(email, password);
      return Right(User(
        id: userModel.id,
        email: userModel.email,
        firstName: userModel.firstName,
        lastName: userModel.lastName,
        refreshToken: userModel.refreshToken
      ));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
