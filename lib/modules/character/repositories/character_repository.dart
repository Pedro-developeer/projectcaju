import 'package:http_interceptor/http_interceptor.dart';
import 'package:projectcaju/modules/news/repositories/repository.dart';

class CharacterRepository extends Repository {
  CharacterRepository({super.endPoint = '/v4/'});
  Future getNewsArchive() async {
    try {
      Response response = await client.get(
        Uri.parse(getApiUrl(complement: 'character/')),
      );
      return getResponseBody(response);
    } catch (e) {
      print('Error in login: $e');
      rethrow;
    }
  }
}
