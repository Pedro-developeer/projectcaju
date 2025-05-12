import 'package:flutter/material.dart';
import 'package:projectcaju/core/constants/padding_constants.dart';
import 'package:projectcaju/core/constants/styles_font_constants.dart';
import 'package:projectcaju/core/themes/colors.dart';

class CardNews extends StatelessWidget {
  const CardNews({
    super.key,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.tickerTitle,
    required this.icon,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final String date;
  final String tickerTitle;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: StylesPaddingConstants.bottomComponent,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.fontColor, width: 1.5),
            borderRadius: BorderRadius.circular(2),
          ),
          child: ListTile(
            onTap: onTap,
            leading: Icon(icon, color: AppColors.fontColor, size: 27),
            title: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: StylesFontConstants.content,
            ),
            subtitle: Text(date, style: StylesFontConstants.contentSecondary),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: AppColors.fontColor,
              size: 19,
            ),
          ),
        ),
      ),
    );
  }
}
