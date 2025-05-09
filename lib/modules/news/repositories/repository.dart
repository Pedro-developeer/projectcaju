import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:projectcaju/configs/config.dart';
import 'package:projectcaju/core/constants/string_constants.dart';
import 'package:projectcaju/core/interceptor/interceptor.dart';
import 'package:http_interceptor/http_interceptor.dart';

class Repository {
  static const httpOkCode = 200;
  static const httpCreatedCode = 201;

  final String endPoint;

  Repository({required this.endPoint});

  InterceptedClient client = InterceptedClient.build(
    interceptors: [AppInterceptor()],
  );

  String getApiUrl({String? complement}) {
    if (complement != null) {
      return '${AppConfig.apiUrl}$endPoint$complement';
    }

    return '${AppConfig.apiUrl}$endPoint';
  }

  String getRequestBody(Map<String, dynamic> body) {
    return jsonEncode(body);
  }

  String getResponseBody(Response response) {
    String? treatedResponse = response.body;
    if (response.body.contains('<!DOCTYPE html>')) {
      treatedResponse = StringConstant.genericError;
    }

    if (response.statusCode != httpOkCode &&
        response.statusCode != httpCreatedCode) {
      throw HttpException(_getErrorMessage(treatedResponse));
    }
    return treatedResponse;
  }

  Future<String> get(Map<String, dynamic> params) async {
    Response response = await client.get(
      Uri.parse(getApiUrl()),
      params: params,
    );

    return getResponseBody(response);
  }

  Future<String> post(Map<String, dynamic> data) async {
    Response response = await client.post(
      Uri.parse(getApiUrl()),
      body: getRequestBody(data),
    );

    return getResponseBody(response);
  }

  Future<String> put(Map<String, dynamic> data) async {
    Response response = await client.put(
      Uri.parse(getApiUrl()),
      body: getRequestBody(data),
    );

    return getResponseBody(response);
  }

  Future<String> delete(int id) async {
    Response response = await client.delete(Uri.parse('${getApiUrl()}/$id'));

    return getResponseBody(response);
  }

  String _getErrorMessage(String response) {
    if (response != StringConstant.genericError) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response);

      return jsonResponse['message'] ?? StringConstant.genericError;
    }

    return response;
  }
}
