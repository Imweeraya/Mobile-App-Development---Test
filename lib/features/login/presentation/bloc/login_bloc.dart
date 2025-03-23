import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecase/clear_user_local_data_use_case.dart';
import '../../domain/usecase/login_use_case.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  final ClearUserLocalDataUseCase clearUserLocalDataUseCase;

  LoginBloc({required this.loginUseCase, required this.clearUserLocalDataUseCase})
    : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
    on<ClearUser>(_onClearUser);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    final Either<Failure, User> result = await loginUseCase(
      email: event.email,
      password: event.password,
    );

    result.fold(
      (failure) => emit(LoginFailure(message: failure.message)),
      (user) => emit(LoginSuccess(user: user)),
    );
  }

  Future<void> _onClearUser(
      ClearUser event,
      Emitter<LoginState> emit,
      ) async {
    emit(LoginLoading());
    clearUserLocalDataUseCase.clearUserLocalData();
  }
}
