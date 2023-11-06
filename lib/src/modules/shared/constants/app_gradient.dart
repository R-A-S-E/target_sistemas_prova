import 'package:flutter/material.dart';

class AppGradient {
  static const Gradient blueGreenLinear = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromARGB(255, 4, 82, 147),
      Color.fromARGB(255, 9, 157, 28),
    ],
  );
}
