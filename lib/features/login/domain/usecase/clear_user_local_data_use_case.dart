import '../../data/datasource/local/user_local_data_source.dart';


class ClearUserLocalDataUseCase {
  final UserLocalDataSource localDataSource;

  ClearUserLocalDataUseCase(this.localDataSource);

  Future<void>  clearUserLocalData() async {
    await localDataSource.clearUser();
  }
}
