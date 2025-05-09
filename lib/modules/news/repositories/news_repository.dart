import 'package:http_interceptor/http_interceptor.dart';
import 'package:projectcaju/modules/news/repositories/repository.dart';

class NewsRepository extends Repository {
  NewsRepository({super.endPoint = '/v4/news'});
  Future getNewsArchive() async {
    try {
      Response response = await client.get(
        Uri.parse(getApiUrl(complement: '/archive')),
      );
      return getResponseBody(response);
    } catch (e) {
      print('Error in login: $e');
      rethrow;
    }
  }
}
