import 'package:flutter/material.dart';
import 'package:navigationandrouting/main.dart';

class AppTheme {
  static const Color primaryColorLight = Color(0xffD8D2E1);
  static const Color primaryColorDark = Color(0xff34435E);

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColorLight,
    brightness: Brightness.light,
    scaffoldBackgroundColor: primaryColorLight, // Background for the app in light mode
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: primaryColorDark,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: primaryColorDark, // Background for the app in dark mode
  );
}

