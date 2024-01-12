import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black
  ),
  brightness: Brightness.light
);

ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
    ),
    brightness: Brightness.dark);
