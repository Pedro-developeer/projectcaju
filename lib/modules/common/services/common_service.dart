import 'dart:convert';

import 'package:projectcaju/modules/common/models/news_model.dart';
import 'package:projectcaju/modules/common/repositories/common_repository.dart';


class CommonService {
 final CommonRepository commonRepository;
 
  CommonService({
    required this.commonRepository,
  });

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