import 'package:bloc_template/domain/usecases/login_usecase.dart';
import 'package:bloc_template/presentation/pages/login/bloc/login_event.dart';
import 'package:bloc_template/presentation/pages/login/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(LoginInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());

      try {
        final bool success = await loginUseCase.call(
          email: event.email,
          password: event.password,
        );

        if (success) {
          emit(LoginSuccess());
        } else {
          emit(LoginFailure("incorrectAuth"));
        }
      } catch (e) {
        emit(LoginFailure("errorOccurred"));
      }
    });
  }
}
