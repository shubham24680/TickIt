import 'package:flutter/material.dart';

Color blue = const Color(0xFF9AD0EC);
Color darkBlue = const Color(0xFF1572A1);
Color green = const Color(0xFFA7D129);
Color darkGreen = const Color(0xFF3E432E);
Color grey = Colors.grey.shade600;
Color white = Colors.white;
Color black = Colors.grey.shade900;

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: blue,
      surfaceTintColor: blue,
    )
  );
}
