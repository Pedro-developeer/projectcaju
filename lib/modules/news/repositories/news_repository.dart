import 'package:http_interceptor/http_interceptor.dart';
import 'package:projectcaju/modules/news/repositories/repository.dart';

class NewsRepository extends Repository {
  NewsRepository({super.endPoint = '/v4/'});
  Future getNewsArchive() async {
    try {
      Response response = await client.get(
        Uri.parse(getApiUrl(complement: 'news/archive')),
      );
      return getResponseBody(response);
    } catch (e) {
      rethrow;
    }
  }

  Future getCharacterByName({required String name}) async {
    try {
      Response response = await client.get(
        Uri.parse(getApiUrl(complement: 'character/$name')),
      );
      return getResponseBody(response);
    } catch (e) {
      rethrow;
    }
  }
}
