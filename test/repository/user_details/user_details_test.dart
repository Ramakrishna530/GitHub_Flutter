import 'package:flutter_test/flutter_test.dart';
import 'package:git_hub/core/http/http_exception.dart';
import 'package:git_hub/models/user_details/user_details_response.dart';
import 'package:git_hub/repository/user_details/user_details.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/mock_json_data.dart';
import '../get_repositories/get_repositories_test.mocks.dart';

Future<void> main() async {
  late UserDetailsRepositoryImpl userDetailsRepositoryImpl;
  late MockHttpService mockHttpService;
  const url = "https://api.github.com/users/mattt";
  setUp(() {
    mockHttpService = MockHttpService();
    userDetailsRepositoryImpl = UserDetailsRepositoryImpl(httpService: mockHttpService);
  });

  group("When get user details is success", () {
    late UserDetailsResponse userDetailsResponse;
    setUp(() async {
      when(mockHttpService.getResponse(any)).thenAnswer((_) {
        final userDetailsJson = getMockJson(jsonPath: JsonFile.userDetails.path);
        return Future.value(userDetailsJson);
      });
      userDetailsResponse = await userDetailsRepositoryImpl.getUserDetails(url: url);
    });

    test("then returns the user details", () {
      expect(userDetailsResponse.id, 7659);
      expect(userDetailsResponse.name, "Mattt");
      expect(userDetailsResponse.bio, null);
      expect(userDetailsResponse.followers, 0);
      expect(
        userDetailsResponse.avatarUrl,
        "https://avatars.githubusercontent.com/u/7659?v=4",
      );
    });
  });

  group("When the get user details is failed with exception", () {
    setUp(() async {
      when(mockHttpService.getResponse(any)).thenThrow(FetchDataException());
    });

    test('then throws the correct exception', () async {
      expect(
        () => userDetailsRepositoryImpl.getUserDetails(url: url),
        throwsA(isA<FetchDataException>()),
      );
    });
  });
}
