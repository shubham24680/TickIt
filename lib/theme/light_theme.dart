import 'package:flutter/material.dart';
import 'package:glare/core/utils/app_colors.dart';

final ThemeData light = ThemeData(
  // colorSchemeSeed: Colors.amber,
  iconTheme: IconThemeData(
    color: white,
  ),
  scaffoldBackgroundColor: white,
  appBarTheme: AppBarTheme(
    backgroundColor: white,
    surfaceTintColor: white,
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: black,
    selectionColor: black.withOpacity(0.4),
    selectionHandleColor: black,
  ),
);
