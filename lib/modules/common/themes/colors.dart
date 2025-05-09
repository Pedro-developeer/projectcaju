

import 'package:flutter/material.dart';

class AppColors {
  // Auxiliaries colors
  static const Color error = Color(0xFFEB4F4F);
  static const Color success = Color(0xFF4AC67E);
  static const Color info = Color(0xFF0000FF);
  static const Color white = Color(0xFFFFFFFF);
  static const Color disabled = Color(0xFFD8D8D8);
  static const Color black = Color(0xFF000000);

  // Grey colors
  static const Color grey = Color(0xFFA5A5A5);
  static const Color lightGrey = Color(0xFFF5F5F5);
  static const Color darkGrey = Color(0xFF343A40);

  // Blue colors
  static const Color blue = Color(0xFF0E9DFD);
  static const Color lightBlue = Color(0xFFECF8FF);
  static const Color darkBlue = Color(0xFF114B8C);

  // Yellow colors
  static const Color yellow = Color(0xFFFFCB05);
  static const Color darkYellow = Color(0xFFFCAF17);

  // Primaries colors
  static const Color primary = darkBlue;
  static const Color secondary = blue;
  static const Color tertiary = yellow;
  static const MaterialColor primarySwatch = MaterialColor(
    400,
    {
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
    },
  );
}