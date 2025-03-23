import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasource/local/user_local_data_source.dart';
import '../datasource/remote/login_remote_data_source.dart';


class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;

  LoginRepositoryImpl({required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final userModel = await remoteDataSource.login(email, password);

      await localDataSource.cacheUser(userModel);
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

  @override
  Future<Either<Failure, User?>> getLastLoggedInUser() async {
    try {
      final localResult = await localDataSource.getLastLoggedInUser();
      return localResult.fold(
            (failure) => Left(failure),
            (userModel) {
          if (userModel != null) {
            return Right(User(
              id: userModel.id,
              email: userModel.email,
              firstName: userModel.firstName,
              lastName: userModel.lastName,
              refreshToken: userModel.refreshToken,
            ));
          }
          return Right(null);
        },
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
