import 'dart:convert';

import 'package:projectcaju/modules/news/models/news_model.dart';
import 'package:projectcaju/modules/news/repositories/news_repository.dart';

class NewsService {
  final NewsRepository newsRepository;

  NewsService({required this.newsRepository});

  Future<NewsModel> getNewsArchive() async {
    try {
      final Map<String, dynamic> response = jsonDecode(
        await newsRepository.getNewsArchive(),
      );

      return NewsModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
