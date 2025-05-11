import 'dart:convert';

import 'package:projectcaju/modules/character/repositories/character_repository.dart';
import 'package:projectcaju/modules/news/models/news_model.dart';
import 'package:projectcaju/modules/news/repositories/news_repository.dart';

class CharacterService {
  final CharacterRepository characterRepository;

  CharacterService({required this.characterRepository});

  Future<NewsModel> getNewsArchive() async {
    try {
      final Map<String, dynamic> response = jsonDecode(
        await characterRepository.getNewsArchive(),
      );

      return NewsModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
