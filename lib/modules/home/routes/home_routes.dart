import 'package:flutter/material.dart';
import 'package:projectcaju/modules/common/views/home_view.dart';


class HomeRoutes {
static const String home1 = '/home1';

  static Map<String,Widget>map = {
    home1: const HomeView1(),
  };
}