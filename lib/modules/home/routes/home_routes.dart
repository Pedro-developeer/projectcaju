import 'package:flutter/material.dart';
import 'package:projectcaju/modules/news/views/news_details_view.dart';
import 'package:projectcaju/modules/news/views/news_view.dart';
import 'package:projectcaju/modules/news/views/web_view.dart';

class NewsRoutes {
  static const String news = 'news';

  static const String newsDetail = 'newsDetail';

  static const String webView = 'webView';

  static Map<String, Widget> map = {
    news: const NewsView(),
    newsDetail: const NewsDetailsView(),
    webView: const WebviewView(),
  };
}
