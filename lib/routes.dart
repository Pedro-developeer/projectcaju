import 'package:flutter/material.dart';
import 'package:projectcaju/modules/home/routes/home_routes.dart';

class Routes {
  static Map<String, Widget> map = {...NewsRoutes.map};

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
      builder: (context) => const Scaffold(body: Center(child: Text(''))),
    );
  }
}