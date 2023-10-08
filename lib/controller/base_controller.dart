import 'dart:convert';
import 'package:http/http.dart' as http;

class BaseController {
  final String baseApiUrl;
  final String appKey;

  BaseController({
    required this.baseApiUrl,
    required this.appKey,
  });

  Future<Map<String, dynamic>> fetchData(String apiUrl) async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Map<String, dynamic>> sendGetRequest(String path) async {
    final apiUrl = '$baseApiUrl$path?appKey=$appKey';
    return fetchData(apiUrl);
  }
}
