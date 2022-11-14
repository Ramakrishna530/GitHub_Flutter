import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/repository.dart';
import 'service_constants.dart';

class GetRepositories {
  final String _language;
  const GetRepositories(this._language);

  Uri get _uri =>
      Uri.parse("$baseURL/search/repositories?q=language:$_language&sort"
          "=stars&order=desc");

  Future<List<Repository>> getRepositoriesFor(String language) async {
    try {
      final response = await http.get(_uri);
      switch (response.statusCode) {
        case 200:
          final data = jsonDecode(response.body) as Map<String, Object>;
          final repositoriesMap = data["items"] as List<Map<String, Object>>;
          final repositories =
              repositoriesMap.map<Repository>(Repository.fromJson).toList();
          return repositories;
        default:
          throw Exception(response.reasonPhrase);
      }
    } on SocketException catch (_) {
      rethrow;
    }
  }
}
