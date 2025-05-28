import 'package:bloc_template/presentation/pages/splash/bloc/splash_bloc.dart';
import 'package:bloc_template/presentation/pages/splash/bloc/splash_event.dart';
import 'package:bloc_template/presentation/pages/splash/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:bloc_template/core/constants/route_constant.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    context.read<SplashBloc>().add(CheckAuthStatus());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashAuthenticated) {
            context.go(RouteConstant.home);
          } else if (state is SplashUnauthenticated) {
            context.go(RouteConstant.signIn);
          } else if (state is SplashError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
