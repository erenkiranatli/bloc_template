import 'package:bloc_template/core/constants/route_constant.dart';
import 'package:bloc_template/domain/usecases/check_auth_status_usecase.dart';
import 'package:bloc_template/domain/usecases/login_usecase.dart';
import 'package:bloc_template/presentation/pages/home/bloc/home_bloc.dart';
import 'package:bloc_template/presentation/pages/home/home_page.dart';
import 'package:bloc_template/presentation/pages/login/bloc/login_bloc.dart';
import 'package:bloc_template/presentation/pages/login/login_page.dart';
import 'package:bloc_template/presentation/pages/splash/bloc/splash_bloc.dart';
import 'package:bloc_template/presentation/pages/splash/bloc/splash_event.dart';
import 'package:bloc_template/presentation/pages/splash/splash_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../core/di/injection.dart';

final GoRouter router = GoRouter(
  initialLocation: RouteConstant.splash,
  routes: [
    GoRoute(
      path: RouteConstant.splash,
      builder: (context, state) {
        final checkAuthStatusUseCase = getIt<CheckAuthStatusUseCase>();

        return BlocProvider(
          create: (_) => SplashBloc(checkAuthStatusUseCase)..add(CheckAuthStatus()),
          child: const SplashPage(),
        );
      },
    ),
    GoRoute(
      path: RouteConstant.signIn,
      builder: (context, state) {
        final loginUseCase = getIt<LoginUseCase>();

        return BlocProvider(
          create: (_) => LoginBloc(loginUseCase),
          child: const LoginPage(),
        );
      },
    ),
    GoRoute(
      path: RouteConstant.home,
      builder: (context, state) {
        return BlocProvider(
          create: (_) => HomeBloc(),
          child: const HomePage(),
        );
      },
    ),
  ],
);
