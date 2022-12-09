import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:git_hub/core/http/api_response.dart';
import 'package:git_hub/core/http/http_exception.dart';
import 'package:git_hub/models/contributors/contributor_response.dart';
import 'package:git_hub/models/get_repositories/repository_owner_response.dart';
import 'package:git_hub/models/get_repositories/repository_response.dart';
import 'package:git_hub/models/user_details/user_details_response.dart';
import 'package:git_hub/state/app_state.dart';
import 'package:git_hub/view/screens/repository_details.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/store_setup.dart';
import '../../mocks/test_mocks.mocks.dart';

void main() {
  group("$RepositoryDetailsScreen", () {
    late MockContributorsRepository contributorsRepository;
    late MockUserDetailsRepository userDetailsRepository;
    const repositoryID = 1;
    const repositoryName = "alamofire";
    const repositoryFullName = "alamofire";
    const repoResponse = RepositoryResponse(
        id: repositoryID,
        name: repositoryName,
        fullName: repositoryFullName,
        private: false,
        owner: RepositoryOwnerResponse(avatarUrl: "avatarUrl-1"),
        watchersCount: 1,
        score: 1);

    List<ContributorResponse> getContributorsResponse({int contributorsCount = 3}) {
      final contributors = <ContributorResponse>[];
      for (var index = 1; index <= contributorsCount; index++) {
        final contributor = ContributorResponse(
          id: index,
          contributions: index,
          url: "avatarUrl-$index",
        );
        contributors.add(contributor);
      }
      return contributors;
    }

    UserDetailsResponse getUsersDetailsResponse({required ContributorResponse contributorResponse}) {
      final user = UserDetailsResponse(
        id: contributorResponse.id,
        name: "name- ${contributorResponse.id}",
        avatarUrl: "avatarUrl-${contributorResponse.id}",
        followers: contributorResponse.id,
      );
      return user;
    }

    setUp(() {
      userDetailsRepository = MockUserDetailsRepository();
      contributorsRepository = MockContributorsRepository();
    });

    testWidgets("When get contributors details is success then show the contributors", (widgetTester) async {
      final contributorsResponse = getContributorsResponse();
      when(
        contributorsRepository.getContributors(repositoryFullName: repositoryFullName),
      ).thenAnswer((_) => Future.value(contributorsResponse));

      for (final contributorResponse in contributorsResponse) {
        when(
          userDetailsRepository.getUserDetails(url: contributorResponse.url),
        ).thenAnswer(
          (_) => Future.value(
            getUsersDetailsResponse(contributorResponse: contributorResponse),
          ),
        );
      }
      final state = AppState(
          repositoriesState: ApiResponse.loading(""),
          selectedRepository: repoResponse,
          contributorsState: ApiResponse.loading(""));
      await widgetTester.pumpWidget(createMaterialApp(
        child: const RepositoryDetailsScreen(),
        state: state,
        contributorsRepository: contributorsRepository,
        userDetailsRepository: userDetailsRepository,
      ));
      await widgetTester.pumpAndSettle();
      find.ancestor(of: find.byType(AppBar), matching: find.text(repositoryName));
      expect(find.text("Watchers Count: 1"), findsOneWidget);
      expect(find.text("Public: true"), findsOneWidget);
      for (var index = 1; index <= contributorsResponse.length; index++) {
        expect(find.text("Contributions - $index"), findsOneWidget);
        expect(find.text("name- $index"), findsOneWidget);
      }
    });

    testWidgets("When get contributors is failed then show the error message in the bottom", (widgetTester) async {
      when(
        contributorsRepository.getContributors(repositoryFullName: repositoryFullName),
      ).thenAnswer((_) => Future.error(FetchDataException("No internet connection!!!")));
      final state = AppState(
          repositoriesState: ApiResponse.loading(""),
          selectedRepository: repoResponse,
          contributorsState: ApiResponse.loading(""));
      await widgetTester.pumpWidget(createMaterialApp(
        child: const RepositoryDetailsScreen(),
        state: state,
        contributorsRepository: contributorsRepository,
        userDetailsRepository: userDetailsRepository,
      ));
      await widgetTester.pumpAndSettle();
      find.ancestor(of: find.byType(AppBar), matching: find.text("name-1"));
      expect(find.text("Watchers Count: 1"), findsOneWidget);
      expect(find.text("Public: true"), findsOneWidget);
      expect(find.text("Error During Communication: No internet connection!!!"), findsOneWidget);
    });
  });
}
