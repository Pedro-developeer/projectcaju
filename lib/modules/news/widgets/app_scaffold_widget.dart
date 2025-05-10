import 'package:flutter/material.dart';
import 'package:projectcaju/core/themes/colors.dart';
import 'package:projectcaju/core/themes/sizes.dart';
import 'package:skeletonizer/skeletonizer.dart';

enum BodyRadiusType { leftOnly, curved, linear }

class AppScaffoldWidget extends StatefulWidget {
  final Widget child;
  final bool hasDefaultPadding;
  final Color bodyBackgroundColor;
  final bool showAppBar;
  final BodyRadiusType bodyRadiusType;
  final Color scaffoldBackgroundColor;
  final Widget? title;
  final Widget? leading;
  final Color? appBarBackgroundColor;
  final List<Widget>? actions;
  final bool validateIdle;
  final bool showMenu;
  final bool isLoading;
  final bool resizeToAvoidBottomInset;

  const AppScaffoldWidget({
    required this.child,
    required this.bodyRadiusType,
    this.showAppBar = true,
    this.resizeToAvoidBottomInset = true,
    this.hasDefaultPadding = true,
    this.validateIdle = true,
    this.bodyBackgroundColor = AppColors.white,
    this.scaffoldBackgroundColor = AppColors.primary,
    this.title,
    this.leading,
    this.appBarBackgroundColor = AppColors.primary,
    this.actions,
    this.showMenu = true,
    this.isLoading = false,
    super.key,
  });

  @override
  State<AppScaffoldWidget> createState() => _AppScaffoldWidgetState();
}

class _AppScaffoldWidgetState extends State<AppScaffoldWidget> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool idleWasValidated = false;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: widget.scaffoldBackgroundColor,
          appBar: widget.showAppBar ? _getAppBar : null,
          drawerEnableOpenDragGesture: widget.showMenu,
          body: SafeArea(
            bottom: false,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              padding: EdgeInsets.all(
                widget.hasDefaultPadding ? AppSizes.padding.large! : 0,
              ),
              decoration: switch (widget.bodyRadiusType) {
                BodyRadiusType.leftOnly => _boxDecorationLeftRadius,
                BodyRadiusType.curved => _boxDecorationCurvedRadius,
                BodyRadiusType.linear => _boxDecorationLinear,
              },
              child: Skeletonizer(
                enabled: widget.isLoading,
                containersColor: AppColors.white,
                effect: ShimmerEffect(
                  baseColor: AppColors.white.withAlpha(80),
                  highlightColor: AppColors.white.withAlpha(60),
                ),
                child: widget.child,
              ),
            ),
          ),
          resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
        ),
      ),
    );
  }

  AppBar get _getAppBar {
    return AppBar(
      centerTitle: true,
      title: widget.title,
      actions: widget.actions,
      leading: _getMenuButton,
      backgroundColor: widget.appBarBackgroundColor,
    );
  }

  Widget? get _getMenuButton {
    return widget.leading ??
        (widget.showMenu
            ? IconButton(
              onPressed: () {
                scaffoldKey.currentState?.openDrawer();
              },
              icon: Icon(Icons.menu, size: AppSizes.icons.extraSmall),
            )
            : const SizedBox.shrink());
  }

  BoxDecoration get _boxDecorationLinear {
    return BoxDecoration(color: widget.bodyBackgroundColor);
  }

  BoxDecoration get _boxDecorationLeftRadius {
    return BoxDecoration(
      color: widget.bodyBackgroundColor,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(_radiusCircular),
      ),
    );
  }

  BoxDecoration get _boxDecorationCurvedRadius {
    return BoxDecoration(
      color: widget.bodyBackgroundColor,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(_radiusCircular),
        topRight: Radius.circular(_radiusCircular),
      ),
    );
  }

  double get _radiusCircular {
    return AppSizes.radius.large ?? 0;
  }
}
