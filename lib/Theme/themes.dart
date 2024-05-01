import 'package:flutter/material.dart';

final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: Colors.blue.shade500,
      secondary: Colors.blue.shade300,
      background: Colors.white70,
    ));

final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: Colors.black38,
      secondary: Colors.white70,
      background: Colors.black54,
    ));
