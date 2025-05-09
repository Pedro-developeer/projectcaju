import 'package:flutter/material.dart';
import 'package:projectcaju/modules/news/models/news_model.dart';
import 'package:projectcaju/modules/news/services/common_service.dart';

class NewsController extends ChangeNotifier {
  final NewsService commonService;
  NewsController({required this.commonService});

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void changeIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  NewsModel _newsModel = NewsModel();
  NewsModel get newsModel => _newsModel;
  void changeNewsModel(NewsModel value) {
    _newsModel = value;
    notifyListeners();
  }

  Future<NewsModel> getNewsTibiaApi() async {
    try {
      changeIsLoading(true);
      final NewsModel news = await commonService.getNewsArchive();
      changeNewsModel(news);
      changeIsLoading(false);
      return news;
    } catch (e) {
      rethrow;
    } finally {
      changeIsLoading(false);
    }
  }
}
