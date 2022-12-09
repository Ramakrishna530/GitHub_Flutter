import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:git_hub/core/http/api_response.dart';
import 'package:git_hub/models/get_repositories/repository_owner_response.dart';
import 'package:git_hub/models/get_repositories/repository_response.dart';
import 'package:git_hub/provider/contributor.dart';
import 'package:git_hub/provider/contributors_provider.dart';
import 'package:git_hub/provider/repositories_provider.dart';
import 'package:git_hub/view/screens/repository_details.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import '../../mocks/repositories_provider.mocks.dart';
import 'repository_details_test.mocks.dart';

@GenerateMocks([ContributorsProvider])
void main() {
  group("$RepositoryDetailsScreen", () {
    late MockRepositoriesProvider mockRepositoriesProvider;
    late MockContributorsProvider mockContributorsProvider;
    const repositoryID = 1;
    const repositoryFullName = "alamofire";
    final repositoryResponse = RepositoryResponse(
      id: repositoryID,
      name: "name-1",
      fullName: repositoryFullName,
      private: false,
      owner: RepositoryOwnerResponse(avatarUrl: "avatarUrl-1"),
      watchersCount: 1,
      score: 1,
    );

    Widget createRepositoryDetailsScreenWithProviders() => MultiProvider(
          providers: [
            ListenableProvider<RepositoriesProvider>.value(value: mockRepositoriesProvider),
            ListenableProvider<ContributorsProvider>.value(value: mockContributorsProvider),
          ],
          child: const RepositoryDetailsScreen(),
        );

    Widget createMaterialApp(int repositoryID) => MaterialApp(
          home: Navigator(
            onGenerateRoute: (settings) => MaterialPageRoute<Widget>(
              builder: (_) => createRepositoryDetailsScreenWithProviders(),
              settings: RouteSettings(arguments: repositoryID),
            ),
          ),
        );

    List<Contributor> getMockContributors({int contributorsCount = 3}) {
      final contributors = <Contributor>[];
      for (var index = 1; index <= contributorsCount; index++) {
        final contributor = Contributor(
          id: index,
          contributionsCount: index,
          avatarUrl: "avatarUrl-$index",
          followers: index,
          name: "name- $index",
          bio: null,
          company: null,
        );
        contributors.add(contributor);
      }
      return contributors;
    }

    setUp(() {
      mockRepositoriesProvider = MockRepositoriesProvider();
      mockContributorsProvider = MockContributorsProvider();
    });

    testWidgets("When get contributors details is success then show the contributors", (widgetTester) async {
      final contributors = getMockContributors();
      when(
        mockRepositoriesProvider.getRepositoryResponseBy(id: repositoryID),
      ).thenAnswer((realInvocation) => repositoryResponse);
      when(
        mockContributorsProvider.getContributorsDetail(repositoryFullName: repositoryFullName),
      ).thenAnswer((realInvocation) => Future.value());
      when(
        mockContributorsProvider.contributors,
      ).thenReturn(
        ApiResponse.completed(contributors),
      );
      await widgetTester.pumpWidget(createMaterialApp(repositoryID));
      await widgetTester.pumpAndSettle();
      find.ancestor(of: find.byType(AppBar), matching: find.text("name-1"));
      expect(find.text("Watchers Count: 1"), findsOneWidget);
      expect(find.text("Public: true"), findsOneWidget);
      for (var index = 1; index <= contributors.length; index++) {
        expect(find.text("Contributions - $index"), findsOneWidget);
        expect(find.text("name- $index"), findsOneWidget);
      }
    });

    testWidgets("When get contributors is failed then show the error message in the bottom", (widgetTester) async {
      final contributors = getMockContributors();
      when(
        mockRepositoriesProvider.getRepositoryResponseBy(id: repositoryID),
      ).thenAnswer((realInvocation) => repositoryResponse);
      when(
        mockContributorsProvider.getContributorsDetail(repositoryFullName: repositoryFullName),
      ).thenAnswer((realInvocation) => Future.value());
      when(
        mockContributorsProvider.contributors,
      ).thenReturn(
        ApiResponse.error("Server not available!!!"),
      );
      await widgetTester.pumpWidget(createMaterialApp(repositoryID));
      await widgetTester.pumpAndSettle();
      find.ancestor(of: find.byType(AppBar), matching: find.text("name-1"));
      expect(find.text("Watchers Count: 1"), findsOneWidget);
      expect(find.text("Public: true"), findsOneWidget);
      expect(find.text("Server not available!!!"), findsOneWidget);
    });
  });
}
