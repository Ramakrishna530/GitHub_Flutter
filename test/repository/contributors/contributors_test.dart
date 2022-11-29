import 'package:flutter_test/flutter_test.dart';
import 'package:git_hub/core/http/http_exception.dart';
import 'package:git_hub/models/contributors/contributor_response.dart';
import 'package:git_hub/repository/contributors/contributors.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/mock_json_data.dart';
import '../get_repositories/get_repositories_test.mocks.dart';

Future<void> main() async {
  late ContributorsRepositoryImpl contributorsRepositoryImpl;
  late MockHttpService mockHttpService;
  const repositoryFullName = "Alamofire";

  setUp(() {
    mockHttpService = MockHttpService();
    contributorsRepositoryImpl = ContributorsRepositoryImpl(httpService: mockHttpService);
  });

  group("When get contributors is success", () {
    late List<ContributorResponse> contributors;
    setUp(() async {
      final contributorsJson = getMockJson(
        jsonPath: JsonFile.contributors.path,
      ) as List<dynamic>;
      when(
        mockHttpService.getResponse(any),
      ).thenAnswer(
        (_) => Future.value(contributorsJson),
      );
      contributors = await contributorsRepositoryImpl.getContributors(
        repositoryFullName: repositoryFullName,
      );
    });
    test("then returns the contributors", () {
      expect(contributors.length, 3);
      // Check for the first contributor
      expect(contributors.first.id, 169110);
      expect(contributors.first.url, "https://api.github.com/users/cnoon");
      expect(contributors.first.contributions, 762);
      // Check for the second contributor
      expect(contributors[1].id, 7659);
      expect(contributors[1].url, "https://api.github.com/users/mattt");
      expect(contributors[1].contributions, 231);
      // Check for the third contributor
      expect(contributors.last.id, 51020);
      expect(contributors.last.url, "https://api.github.com/users/jshier");
      expect(contributors.last.contributions, 87);
    });
  });

  group("When the get contributors is failed with exception", () {
    setUp(() async {
      when(mockHttpService.getResponse(any)).thenThrow(FetchDataException());
    });

    test('then throws the correct exception', () async {
      expect(
        () => contributorsRepositoryImpl.getContributors(repositoryFullName: repositoryFullName),
        throwsA(isA<FetchDataException>()),
      );
    });
  });
}
