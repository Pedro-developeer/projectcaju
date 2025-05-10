import 'package:flutter/material.dart';

import 'base_button.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    required this.onPressed,
    required this.text,
    this.height,
    this.icon,
    this.width,
    this.isLoading = false,
    super.key,
    required this.backgroundColor,
    required this.boundaryColor,
    required this.styles,
  });

  final VoidCallback onPressed;
  final String text;
  final double? width;
  final double? height;
  final Widget? icon;
  final bool isLoading;
  final Color backgroundColor;
  final Color boundaryColor;
  final TextStyle styles;

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      text: text,
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      boundaryColor: boundaryColor,
      stokerColor: boundaryColor,
      height: height,
      icon: icon ?? const SizedBox.shrink(),
      width: width,
      shouldHaveBorder: true,
      isLoading: isLoading,
      styles: styles,
    );
  }
}
