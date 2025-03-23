
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user_model.dart';

abstract class UserLocalDataSource {
  Future<void> cacheUser(UserModel user);
  Future<UserModel?> getLastLoggedInUser();
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
  Future<UserModel?> getLastLoggedInUser() {
    final jsonString = sharedPreferences.getString(CACHED_USER_KEY);
    if (jsonString != null) {
      return Future.value(UserModel.fromJson(jsonDecode(jsonString)));
    }
    return Future.value(null);
  }

  @override
  Future<void> clearUser() async {
    await sharedPreferences.remove(CACHED_USER_KEY);
  }
}