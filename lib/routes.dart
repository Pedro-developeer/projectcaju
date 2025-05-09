import 'package:flutter/material.dart';
import 'package:projectcaju/modules/common/routes/commons_routes.dart';
import 'package:projectcaju/modules/home/routes/home_routes.dart';

class Routes {
  static Map<String, Widget> map = {
    ...CommonsRoutes.map,
    ...HomeRoutes.map,
  };

  static Route<dynamic> generate(RouteSettings settings) {
    if (map.containsKey(settings.name)) {
      return MaterialPageRoute(
        builder: (context) => map[settings.name]!,
        settings: settings,
      );
    }

    return _errorRoute;
  }

  static Route<dynamic> get _errorRoute {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text('Error'),
        ),
      ),
    );
  }
}