import 'package:flutter/material.dart';
import 'package:projectcaju/modules/worlds/views/worlds_view.dart';

class WorldsRoutes {
  static const String worlds = 'worlds';

  static Map<String, Widget> map = {worlds: const WorldsView()};
}
