import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:git_hub/core/http/api_response.dart';
import 'package:git_hub/models/get_repositories/repository_owner_response.dart';
import 'package:git_hub/models/get_repositories/repository_response.dart';
import 'package:git_hub/provider/repositories_provider.dart';
import 'package:git_hub/view/screens/repositories.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'repositories_test.mocks.dart';

@GenerateMocks([RepositoriesProvider])
void main() {
  group("$RepositoriesScreen", () {
    late MockRepositoriesProvider repositoriesProvider;

    setUp(() {
      repositoriesProvider = MockRepositoriesProvider();
    });

    Widget createMaterialApp() => MaterialApp(
          home: ListenableProvider<RepositoriesProvider>.value(
            value: repositoriesProvider,
            child: const RepositoriesScreen(),
          ),
        );

    List<RepositoryResponse> getRepositoriesResponse({int repositoriesCount = 5}) {
      final repositories = <RepositoryResponse>[];
      for (var i = 1; i < repositoriesCount; i++) {
        final repositoryOwnerResponse = RepositoryOwnerResponse(avatarUrl: "avatarUrl-$i");
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

    testWidgets("When get repositories is success then shows the list", (tester) async {
      final mockRepositoriesResponse = getRepositoriesResponse();
      when(
        repositoriesProvider.getRepositories(language: "Dart"),
      ).thenAnswer(
        (_) => Future.value(),
      );
      when(
        repositoriesProvider.repositories,
      ).thenReturn(
        ApiResponse.completed(mockRepositoriesResponse),
      );
      await tester.pumpWidget(createMaterialApp());
      await tester.pumpAndSettle(const Duration(seconds: 1));
      for (final repositoryResponse in mockRepositoriesResponse) {
        expect(
          find.text(repositoryResponse.name),
          findsOneWidget,
        );
        expect(
          find.text("Watchers Count - ${repositoryResponse.watchersCount}"),
          findsOneWidget,
        );
        expect(
          find.byType(CircleAvatar),
          findsNWidgets(mockRepositoriesResponse.length),
        );
      }
    });

    testWidgets("When get repositories is failure then shows the error message", (tester) async {
      when(
        repositoriesProvider.getRepositories(language: "Dart"),
      ).thenAnswer(
        (_) => Future.value(),
      );
      when(repositoriesProvider.repositories).thenReturn(
        ApiResponse.error("No Internet Connection"),
      );
      await tester.pumpWidget(createMaterialApp());
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(
        find.text("No Internet Connection"),
        findsOneWidget,
      );
    });
  });
}
