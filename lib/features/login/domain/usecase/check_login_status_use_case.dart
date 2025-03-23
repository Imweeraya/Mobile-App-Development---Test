import '../repositories/login_repository.dart';

class CheckLoginStatusUseCase {
  final LoginRepository loginRepository;

  CheckLoginStatusUseCase(this.loginRepository);

  Future<bool> execute() async {
    final result = await loginRepository.getLastLoggedInUser();

    return result.fold(
          (failure) => false,
          (user) => user != null,
    );
  }
}