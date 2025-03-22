import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecase/login_use_case.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc({required this.loginUseCase}) : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    final Either<Failure, User> result = await loginUseCase(email: event.email,password: event.password);

    result.fold(
          (failure) => emit(LoginFailure(message: failure.message)),
          (user) => emit(LoginSuccess(user: user)),
    );
  }
}
