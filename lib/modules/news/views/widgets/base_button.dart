import 'package:flutter/material.dart';

class BaseButton extends StatefulWidget {
  const BaseButton({
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.boundaryColor,
    this.foregroundColor,
    this.height,
    this.icon,
    this.width,
    this.shouldHaveBorder = true,
    this.isLoading = false,
    required this.stokerColor,
    required this.styles,
    super.key,
  });

  final String text;
  final VoidCallback onPressed;
  final Color? foregroundColor;
  final Color backgroundColor;
  final Color boundaryColor;
  final Color stokerColor;
  final double? width;
  final double? height;
  final Widget? icon;
  final bool isLoading;
  final bool shouldHaveBorder;
  final TextStyle styles;

  @override
  BaseButtonState createState() => BaseButtonState();
}

class BaseButtonState extends State<BaseButton> {
  static const double _shadowHeight = 4;
  double _position = _shadowHeight;

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final height = (widget.height ?? 54) - _shadowHeight;

        return GestureDetector(
          onTapUp: (_) {
            setState(() => _position = _shadowHeight);
            widget.onPressed();
          },
          onTapDown: (_) => setState(() => _position = 0),
          onTapCancel: () => setState(() => _position = _shadowHeight),
          child: Container(
            width: widget.width ?? double.infinity,
            height: height + _shadowHeight,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: widget.boundaryColor,
                  offset: const Offset(0, _shadowHeight),
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: height,
                    width: widget.width ?? constraints.maxWidth,
                    decoration: BoxDecoration(color: widget.boundaryColor),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 70),
                  curve: Curves.easeIn,
                  bottom: _position,
                  child: Container(
                    width: widget.width ?? constraints.maxWidth,
                    height: height,
                    decoration: BoxDecoration(
                      border:
                          widget.shouldHaveBorder
                              ? Border.all(
                                color: widget.stokerColor,
                                width: 2.0,
                              )
                              : null,
                      color: widget.backgroundColor,
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (widget.icon != null) ...[
                            widget.icon!,
                            if (widget.text.isNotEmpty) SizedBox(width: 20),
                          ],
                          Text(widget.text, style: widget.styles),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
