import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projectcaju/core/themes/colors.dart';
import 'package:projectcaju/core/themes/sizes.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    bottomSheetTheme: const BottomSheetThemeData(
      surfaceTintColor: AppColors.white,
      backgroundColor: AppColors.white,
    ),
    primarySwatch: AppColors.primarySwatch,
    primaryColor: AppColors.primary,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.white,
      selectionColor: AppColors.white,
      selectionHandleColor: AppColors.white,
    ),
    scaffoldBackgroundColor: AppColors.colorBackground,
    cardColor: AppColors.white,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 1,
      backgroundColor: AppColors.primary,
      titleTextStyle: TextStyle(
        color: AppColors.fontColor,
        fontSize: AppSizes.font.gigantic!,
      ),
      iconTheme: const IconThemeData(color: AppColors.fontColor),
      actionsIconTheme: const IconThemeData(color: AppColors.fontColor),
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle: const TextStyle(color: AppColors.primary),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.white),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSizes.radius.small ?? 0),
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.white),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSizes.radius.small ?? 0),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.primary),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSizes.radius.small ?? 0),
        ),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.white),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSizes.radius.small ?? 0),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.white),
        borderRadius: BorderRadius.all(
          Radius.circular(AppSizes.radius.small ?? 0),
        ),
      ),
    ),
    textTheme: GoogleFonts.titilliumWebTextTheme(),
    splashFactory: NoSplash.splashFactory,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
  );
}
