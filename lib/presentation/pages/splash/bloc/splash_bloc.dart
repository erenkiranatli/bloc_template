import 'package:bloc_template/domain/usecases/check_auth_status_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'splash_event.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final CheckAuthStatusUseCase checkAuthStatusUseCase;

  SplashBloc(this.checkAuthStatusUseCase) : super(SplashInitial()) {
    on<CheckAuthStatus>((event, emit) async {
      emit(SplashLoading());

      try {
        final isLoggedIn = await checkAuthStatusUseCase();
        if (isLoggedIn) {
          emit(SplashAuthenticated());
        } else {
          emit(SplashUnauthenticated());
        }
      } catch (e) {
        emit(SplashError(e.toString()));
      }
    });
  }
}
