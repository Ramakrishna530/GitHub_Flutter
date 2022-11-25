import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:git_hub/core/http/http_exception.dart';
import 'package:git_hub/core/http/http_service.dart';
import 'package:git_hub/models/get_repositories/repository_response.dart';
import 'package:git_hub/repository/get_repositories_repo.dart';
import 'package:git_hub/repository/service_constants.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_repositories_repo_test.mocks.dart';

@GenerateMocks([HttpService])
Future<void> main() async {
  late GetRepositoriesRepoImpl getRepositoriesRepoImpl;
  late MockHttpService httpServiceTest;
  const language = "Dart";
  final uri = Uri.parse("$baseURL/search/repositories?q=language:$language&sort"
      "=stars&order=desc");
  setUp(() {
    httpServiceTest = MockHttpService();
    getRepositoriesRepoImpl = GetRepositoriesRepoImpl(httpService: httpServiceTest);
  });

  Object getMockRepositoriesJson() {
    final file = File('test_resources/repositories.json');
    final jsonObject = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
    return jsonObject;
  }

  group("When the get repositories is success", () {
    late List<RepositoryResponse>? repositories;
    setUp(() async {
      final repositoriesJson = getMockRepositoriesJson();
      when(httpServiceTest.getResponse(uri)).thenAnswer((_) async => repositoriesJson);
      repositories = await getRepositoriesRepoImpl.getRepositories(language: language);
    });
    test('then returns the list of repositories', () async {
      expect(repositories?.length, 30);
      expect(repositories?.first.name, "awesome-ios");
    });
  });

  group("When the get repositories is failed with exception", () {
    setUp(() async {
      when(httpServiceTest.getResponse(uri)).thenThrow(FetchDataException());
    });

    test('then throws the correct exception', () async {
      expect(() => getRepositoriesRepoImpl.getRepositories(language: language), throwsA(isA<FetchDataException>()));
    });
  });
}
