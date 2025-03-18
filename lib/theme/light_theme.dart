import 'package:flutter/material.dart';
import 'package:tickit/core/utils/app_colors.dart';

final ThemeData light = ThemeData(
  scaffoldBackgroundColor: white,
  appBarTheme: AppBarTheme(
    backgroundColor: white,
    surfaceTintColor: white,
  ),
  iconTheme: IconThemeData(
    color: white,
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: black,
    selectionColor: black.withAlpha(100),
    selectionHandleColor: black,
  ),
);
