// login_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';
import 'package:merchant_app/features/authentication/domain/use_cases/login_use_case.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc({required this.loginUseCase}) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      try {
        final t = await loginUseCase.execute(event.email, event.password);
        emit(LoginSuccess(token: t.token));
      } catch (e) {
        emit(LoginFailure(message: e.toString()));
      }
    });
  }
}