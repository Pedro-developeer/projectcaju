import 'package:flutter/material.dart';
import 'package:projectcaju/modules/news/views/news_view.dart';
import 'package:projectcaju/modules/news/views/web_view.dart';
import 'package:projectcaju/modules/worlds/views/worlds_view.dart';

class NewsRoutes {
  static const String news = 'news';

  static const String webView = 'webView';

  static const String worlds = 'worlds';

  static Map<String, Widget> map = {
    news: const NewsView(),
    webView: const WebviewView(),
    worlds: const WorldsView(),
  };
}
