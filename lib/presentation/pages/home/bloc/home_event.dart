import 'package:flutter/material.dart';

abstract class HomeEvent {}

class ChangeColor extends HomeEvent {
  final Color color;

  ChangeColor(this.color);
}
