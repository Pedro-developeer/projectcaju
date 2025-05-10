import 'package:http_interceptor/http_interceptor.dart';
import 'package:projectcaju/modules/news/repositories/repository.dart';

class WorldsRepository extends Repository {
  WorldsRepository({super.endPoint = '/v4'});
  Future getWorlds() async {
    try {
      Response response = await client.get(
        Uri.parse(getApiUrl(complement: '/worlds')),
      );
      return getResponseBody(response);
    } catch (e) {
      print('Error in login: $e');
      rethrow;
    }
  }
}
