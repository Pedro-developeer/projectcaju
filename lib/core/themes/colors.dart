import 'package:flutter/material.dart';

class AppColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color darkBlue = Color(0xFF114B8C);

  // Primaries colors
  static const Color primary = darkBlue;
  //App Tibia Colors
  static const Color colorBackground = Color(0xFFFFF1D9);
  static const Color appBarBackground = Color(0xFF182A12);
  static const Color tickerColor = Color(0xFF2fd058);
  static const Color buttonColorBackground = Color(0xFF0525D9);
  static const Color buttonColorBoundary = Color(0xFFEDCB24);
  static const Color fontColor = Color(0xFF5E4D40);
  static const Color fontColorSecondary = Color(0xFFAC9686);

  static const MaterialColor primarySwatch = MaterialColor(400, {
    50: primary,
    100: primary,
    200: primary,
    300: primary,
    400: primary,
    500: primary,
    600: primary,
    700: primary,
    800: primary,
    900: primary,
  });
}
