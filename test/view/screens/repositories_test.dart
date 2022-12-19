import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:git_hub/core/http/http_exception.dart';
import 'package:git_hub/view/screens/repositories.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/repositories_mock.dart';
import '../../helpers/store_setup.dart';
import '../../mocks/test_mocks.mocks.dart';

void main() {
  group("$RepositoriesScreen", () {
    late MockGetRepositoriesRepo getRepositoriesRepo;
    const language = "Dart";

    setUp(() {
      getRepositoriesRepo = MockGetRepositoriesRepo();
    });

    testWidgets("When get repositories is success then shows the list", (tester) async {
      final repositoriesResponse = getRepositoriesResponse();
      when(
        getRepositoriesRepo.getRepositories(language: language),
      ).thenAnswer(
        (_) => Future.value(repositoriesResponse),
      );
      await tester.pumpWidget(createMaterialApp(
        child: const RepositoriesScreen(),
        getRepositoriesRepo: getRepositoriesRepo,
      ));
      await tester.pumpAndSettle();
      for (final repositoryResponse in repositoriesResponse) {
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
          findsNWidgets(repositoriesResponse.length),
        );
      }
    });

    testWidgets("When get repositories is failure then shows the error message", (tester) async {
      when(
        getRepositoriesRepo.getRepositories(language: language),
      ).thenAnswer((_) => Future.error(FetchDataException("No Internet connection")));

      await tester.pumpWidget(createMaterialApp(
        child: const RepositoriesScreen(),
        getRepositoriesRepo: getRepositoriesRepo,
      ));
      await tester.pumpAndSettle();
      expect(
        find.text("Error During Communication: No Internet connection"),
        findsOneWidget,
      );
    });
  });
}
