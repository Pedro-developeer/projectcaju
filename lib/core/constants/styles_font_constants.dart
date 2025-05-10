import 'package:flutter/material.dart';
import 'package:projectcaju/core/themes/colors.dart';

class StylesFontConstants {
  static final TextStyle title = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto',
    color: AppColors.colorBackground,
  );

  static final TextStyle subtitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontFamily: 'SFPro',
    color: AppColors.fontColor,
  );

  static final TextStyle titleButton = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    fontFamily: 'SFPro',
    color: AppColors.white,
  );

  static final TextStyle content = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto',
    color: AppColors.fontColor,
  );

  static final TextStyle contentSecondary = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    fontFamily: 'Roboto',
    color: AppColors.fontColorSecondary,
  );

  static final TextStyle contentTertiary = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    fontFamily: 'SFPro',
    color: const Color.fromARGB(255, 255, 255, 255),
  );

  static final TextStyle contentSecondaryDark = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    fontFamily: 'SFPro',
    color: AppColors.appBarBackground,
  );
}
