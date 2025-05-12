import 'package:flutter/material.dart';
import 'package:ming_cute_icons/ming_cute_icons.dart';
import 'package:projectcaju/core/constants/image_constants.dart';
import 'package:projectcaju/core/constants/padding_constants.dart';
import 'package:projectcaju/core/constants/styles_font_constants.dart';
import 'package:projectcaju/core/themes/colors.dart';

class CardWorld extends StatelessWidget {
  const CardWorld({
    super.key,
    required this.flag,
    required this.titleServer,
    required this.serverStatusImage,
    required this.pvpType,
    required this.playersOnline,
  });

  final String flag;
  final String titleServer;
  final String serverStatusImage;
  final String pvpType;
  final String playersOnline;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: StylesPaddingConstants.bottomComponent,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.fontColor, width: 1.5),
          borderRadius: BorderRadius.circular(2),
        ),
        child: Column(
          children: [
            Padding(
              padding: StylesPaddingConstants.horizontalComponent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(flag, style: StylesFontConstants.flag),
                      SizedBox(width: 5),
                      Text(titleServer, style: StylesFontConstants.subtitle),
                    ],
                  ),

                  Image(image: AssetImage(ImagesConstants.online), height: 36),
                ],
              ),
            ),
            Padding(
              padding: StylesPaddingConstants.horizontalComponent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        MingCuteIcons.mgc_sword_line,
                        size: 24,
                        color: AppColors.fontColorSecondary,
                      ),
                      Text(
                        pvpType,
                        style: StylesFontConstants.subtitleWorldsSecondaryTile,
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Icon(
                        MingCuteIcons.mgc_group_3_line,
                        color: AppColors.fontColorSecondary,
                      ),
                      SizedBox(width: 5),
                      Text(
                        playersOnline,
                        style: StylesFontConstants.subtitleWorldsSecondaryTile,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
