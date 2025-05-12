import 'package:flutter/material.dart';
import 'package:projectcaju/core/constants/styles_font_constants.dart';
import 'package:projectcaju/core/themes/colors.dart';
import 'package:projectcaju/core/themes/sizes.dart';

class TilePlayerWordSecondary extends StatelessWidget {
  const TilePlayerWordSecondary({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      height: 90,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.fontColor, width: 1.5),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppSizes.sizeComponents.large),
            Text(title, style: StylesFontConstants.subtitleWorldsSecondaryTile),
            Text(subtitle, style: StylesFontConstants.displayWorldsTileContent),
          ],
        ),
      ),
    );
  }
}
