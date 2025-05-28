import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState(backgroundColor: Colors.white)) {
    on<ChangeColor>((event, emit) {
      emit(HomeState(backgroundColor: event.color));
    });
  }
}
