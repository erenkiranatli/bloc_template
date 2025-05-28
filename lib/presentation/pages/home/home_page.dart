import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_event.dart';
import 'bloc/home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: state.backgroundColor,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<HomeBloc>().add(ChangeColor(Colors.red));
                    },
                    child: const Text("Red"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<HomeBloc>().add(ChangeColor(Colors.green));
                    },
                    child: const Text("Green"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<HomeBloc>().add(ChangeColor(Colors.blue));
                    },
                    child: const Text("Blue"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
