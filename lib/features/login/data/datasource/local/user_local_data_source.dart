
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/error/failure.dart';
import '../../model/user_model.dart';

abstract class UserLocalDataSource {
  Future<void> cacheUser(UserModel user);
  Future<Either<Failure, UserModel?>> getLastLoggedInUser();
  Future<void> clearUser();
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final SharedPreferences sharedPreferences;
  static const String CACHED_USER_KEY = 'CACHED_USER';

  UserLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheUser(UserModel user) async {
    await sharedPreferences.setString(
      CACHED_USER_KEY,
      jsonEncode(user.toJson()),
    );
  }

  @override
  Future<Either<Failure, UserModel?>> getLastLoggedInUser() async {
    try {
      final jsonString = sharedPreferences.getString(CACHED_USER_KEY);
      if (jsonString != null) {
        return Right(UserModel.fromJson(jsonDecode(jsonString)));
      }
      return Right(null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }


  @override
  Future<void> clearUser() async {
    await sharedPreferences.remove(CACHED_USER_KEY);
  }
}