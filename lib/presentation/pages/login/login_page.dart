import 'package:bloc_template/core/constants/route_constant.dart';
import 'package:bloc_template/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'bloc/login_bloc.dart';
import 'bloc/login_event.dart';
import 'bloc/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginButtonPressed() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    context.read<LoginBloc>().add(LoginSubmitted(email: email, password: password));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.loc.login)),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            final translatedMessage = switch (state.errorMessage) {
              'incorrectAuth' => context.loc.incorrectAuth,
              'errorOccurred' => context.loc.errorOccurred,
              _ => context.loc.genericError,
            };

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(translatedMessage)),
            );
          } else if (state is LoginSuccess) {
            context.go(RouteConstant.home);
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.08),
          child: Column(
            children: [
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: context.loc.email),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: context.height * 0.02),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: context.loc.password),
                obscureText: true,
              ),
              SizedBox(height: context.height * 0.04),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  if (state is LoginLoading) {
                    return const CircularProgressIndicator();
                  }
                  return ElevatedButton(
                    onPressed: _onLoginButtonPressed,
                    child: Text(context.loc.login),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
