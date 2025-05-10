import 'package:flutter/material.dart';
import 'package:projectcaju/core/constants/styles_font_constants.dart';
import 'package:projectcaju/core/themes/colors.dart';

class TickerFlag extends StatelessWidget {
  const TickerFlag({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 60,
      decoration: BoxDecoration(
        color: AppColors.tickerColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          child: Text(title, style: StylesFontConstants.contentSecondaryDark),
        ),
      ),
    );
  }
}
