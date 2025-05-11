import 'package:flutter/material.dart';
import 'package:projectcaju/core/constants/styles_font_constants.dart';
import 'package:projectcaju/core/themes/colors.dart' show AppColors;

class TileCharacterInfo extends StatelessWidget {
  const TileCharacterInfo({
    super.key,
    this.icon,
    required this.info,
    required this.infoComplement,
  });

  final IconData? icon;
  final String info;
  final String infoComplement;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Container(
            height: 56,
            width: double.infinity,
            color: AppColors.colorBackground,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Icon(icon, color: AppColors.fontColor, size: 20),
                      SizedBox(width: 2),
                      Text(info, style: StylesFontConstants.subtitle),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    children: [
                      Text(
                        infoComplement,
                        style: StylesFontConstants.subtitleTile,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
