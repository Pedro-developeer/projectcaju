import 'package:flutter/material.dart';
import 'package:projectcaju/core/constants/padding_constants.dart';
import 'package:projectcaju/core/constants/styles_font_constants.dart';
import 'package:projectcaju/core/themes/colors.dart';

class TilePlayerWorld extends StatelessWidget {
  const TilePlayerWorld({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.fontColor, width: 1.5),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Padding(
        padding:  StylesPaddingConstants.horizontalComponent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(title, style: StylesFontConstants.subtitleWorldsSecondaryTile),
            Text(subtitle, style: StylesFontConstants.displayWorldsTile),
          ],
        ),
      ),
    );
  }
}
