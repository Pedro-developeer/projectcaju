import 'package:flutter/material.dart';
import 'package:projectcaju/modules/character/models/character_model.dart';
import 'package:projectcaju/modules/news/models/news_model.dart';
import 'package:projectcaju/modules/news/services/news_service.dart';

class NewsController extends ChangeNotifier {
  final NewsService newsService;
  NewsController({required this.newsService});

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

  CharacterModel _characterModel = CharacterModel();
  CharacterModel get characterModel => _characterModel;
  void changeCharacterModel(CharacterModel value) {
    _characterModel = value;
    notifyListeners();
  }

  Future<CharacterModel> getCharacterByName({required String name}) async {
    try {
      changeIsLoading(true);
      final CharacterModel characterModel = await newsService
          .getCharacterByName(name: name);
      changeCharacterModel(characterModel);
      changeIsLoading(false);
      return characterModel;
    } catch (e) {
      rethrow;
    } finally {
      changeIsLoading(false);
    }
  }

  Future<NewsModel> getNewsTibiaApi() async {
    try {
      changeIsLoading(true);
      final NewsModel news = await newsService.getNewsArchive();
      changeNewsModel(news);
      changeIsLoading(false);
      return news;
    } catch (e) {
      rethrow;
    } finally {
      changeIsLoading(false);
    }
  }

  List<News> getDevelopmentNews() {
    return _filterNewsByCategory('development');
  }

  List<News> getCommunityNews() {
    return _filterNewsByCategory('community');
  }

  List<News> getTechnicalNews() {
    return _filterNewsByCategory('technical');
  }

  List<News> _filterNewsByCategory(String category) {
    return newsModel.news
            ?.where((item) => item.category.toLowerCase() == category)
            .take(10)
            .toList() ??
        [];
  }
}
