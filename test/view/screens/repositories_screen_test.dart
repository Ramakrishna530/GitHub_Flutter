import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:git_hub/core/http/http_exception.dart';
import 'package:git_hub/models/get_repositories/repository_owner_response.dart';
import 'package:git_hub/models/get_repositories/repository_response.dart';
import 'package:git_hub/provider/repositories_provider.dart';
import 'package:git_hub/repository/get_repositories_repo.dart';
import 'package:git_hub/view/screens/repositories_screen.dart';
import 'package:git_hub/view/widget/drop_down.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'repositories_screen_test.mocks.dart';

@GenerateMocks([GetRepositoriesRepo])
void main() {
  group("$RepositoriesScreen", () {
    late RepositoriesProviderImpl repositoriesProvider;
    late MockGetRepositoriesRepo mockGetRepositoriesRepo;

    setUp(() {
      mockGetRepositoriesRepo = MockGetRepositoriesRepo();
      repositoriesProvider = RepositoriesProviderImpl(
          getRepositoriesRepo: mockGetRepositoriesRepo);
    });

    Widget createMaterialApp() => MaterialApp(
          home: ChangeNotifierProvider.value(
            value: repositoriesProvider,
            child: const RepositoriesScreen(),
          ),
        );

    List<RepositoryResponse> getRepositoriesResponse(
        {int repositoriesCount = 5}) {
      final repositories = <RepositoryResponse>[];
      for (var i = 1; i < repositoriesCount; i++) {
        final repositoryOwnerResponse =
            RepositoryOwnerResponse(avatarUrl: "avatarUrl-$i");
        final repositoryResponse = RepositoryResponse(
            id: i,
            name: "name-$i",
            fullName: "fullName-$i",
            private: false,
            owner: repositoryOwnerResponse,
            watchersCount: i,
            score: i.toDouble());
        repositories.add(repositoryResponse);
      }
      return repositories;
    }

    testWidgets("When get repositories is success then shows the list",
        (tester) async {
      final mockRepositoriesResponse = getRepositoriesResponse();
      when(mockGetRepositoriesRepo.getRepositories(language: "Dart"))
          .thenAnswer((_) => Future.value(mockRepositoriesResponse));
      await tester.pumpWidget(createMaterialApp());
      expect(find.text("Loading..."), findsOneWidget);
      await tester.pumpAndSettle(const Duration(milliseconds: 1));
      for (final repositoryResponse in mockRepositoriesResponse) {
        expect(find.text(repositoryResponse.name), findsOneWidget);
        expect(
            find.text("Watchers Count - ${repositoryResponse.watchersCount}"),
            findsOneWidget);
        expect(find.byType(CircleAvatar),
            findsNWidgets(mockRepositoriesResponse.length));
      }
    });

    testWidgets("When get repositories is failure then shows the error message",
        (tester) async {
      when(mockGetRepositoriesRepo.getRepositories(language: "Dart"))
          .thenThrow(FetchDataException("No Internet Connection"));
      await tester.pumpWidget(createMaterialApp());
      expect(find.text("Loading..."), findsOneWidget);
      await tester.pumpAndSettle(const Duration(milliseconds: 1));
      expect(find.text("Error During Communication: No Internet Connection"),
          findsOneWidget);
    });

    testWidgets("When language selected then show the repositories",
        (tester) async {
      const language = "Swift";
      final mockRepositoriesResponse = getRepositoriesResponse();
      when(mockGetRepositoriesRepo.getRepositories(language: "Dart"))
          .thenAnswer((_) => Future.value(mockRepositoriesResponse));
      await tester.pumpWidget(createMaterialApp());
      expect(find.text("Loading..."), findsOneWidget);
      await tester.pumpAndSettle(const Duration(milliseconds: 1));
      when(mockGetRepositoriesRepo.getRepositories(language: language))
          .thenAnswer((_) => Future.value(mockRepositoriesResponse));
      final dropdown = find.byType(DropDown).first;
      await tester.tap(dropdown);
      await tester.pump();
      final menuItem = find.text(language).last;
      await tester.tap(menuItem);
      await tester.pumpAndSettle(const Duration(milliseconds: 1));
      for (final repositoryResponse in mockRepositoriesResponse) {
        expect(find.text(repositoryResponse.name), findsOneWidget);
        expect(
            find.text("Watchers Count - ${repositoryResponse.watchersCount}"),
            findsOneWidget);
        expect(find.byType(CircleAvatar),
            findsNWidgets(mockRepositoriesResponse.length));
      }
    });
  });
}
