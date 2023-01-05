import 'package:flutter/material.dart';
import 'package:movies/core/app_colors/app_dark_color.dart';
AppDarkColors appDarkColors =AppDarkColors();
  ThemeData buildDarkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    backgroundColor: appDarkColors.darkBackgroundColor,
    scaffoldBackgroundColor: appDarkColors.darkScaffoldColor,

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: appDarkColors.darkBottomNavigationColor,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.white,
    ),
  );
}