import 'dart:convert';

import 'package:projectcaju/modules/news/models/news_model.dart';
import 'package:projectcaju/modules/news/repositories/news_repository.dart';

class NewsService {
  final NewsRepository commonRepository;

  NewsService({required this.commonRepository});

  Future<NewsModel> getNewsArchive() async {
    try {
      final Map<String, dynamic> response = jsonDecode(
        await commonRepository.getNewsArchive(),
      );

      return NewsModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
