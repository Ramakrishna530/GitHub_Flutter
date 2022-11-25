import 'package:flutter_test/flutter_test.dart';
import 'package:git_hub/core/http/api_response.dart';
import 'package:git_hub/core/http/http_exception.dart';
import 'package:git_hub/models/get_repositories/repository_owner_response.dart';
import 'package:git_hub/models/get_repositories/repository_response.dart';
import 'package:git_hub/provider/repositories_provider.dart';
import 'package:git_hub/repository/get_repositories_repo.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'repositories_provider_test.mocks.dart';

@GenerateMocks([GetRepositoriesRepo])
void main() async {
  group(
    "$RepositoriesProviderImpl",
    () {
      late RepositoriesProviderImpl repositoriesProviderImpl;
      late MockGetRepositoriesRepo mockGetRepositoriesRepo;
      const language = "Dart";
      setUp(() {
        mockGetRepositoriesRepo = MockGetRepositoriesRepo();
        repositoriesProviderImpl = RepositoriesProviderImpl(
          getRepositoriesRepo: mockGetRepositoriesRepo,
        );
      });

      List<RepositoryResponse> getRepositoriesResponse({int repositoriesCount = 5}) {
        final repositories = <RepositoryResponse>[];
        for (var i = 1; i <= repositoriesCount; i++) {
          final repositoryOwnerResponse = RepositoryOwnerResponse(avatarUrl: "avatarUrl-$i");
          final repositoryResponse = RepositoryResponse(
            id: i,
            name: "name-$i",
            fullName: "fullName-$i",
            private: false,
            owner: repositoryOwnerResponse,
            watchersCount: i,
            score: i.toDouble(),
          );
          repositories.add(
            repositoryResponse,
          );
        }
        return repositories;
      }

      group(
        "When the get repositories is success",
        () {
          setUp(
            () async {
              when(
                mockGetRepositoriesRepo.getRepositories(language: language),
              ).thenAnswer(
                (_) async => getRepositoriesResponse(),
              );
              await repositoriesProviderImpl.getRepositories(language: language);
            },
          );
          test(
            'then returns the list of repositories',
            () async {
              final repositoriesState = repositoriesProviderImpl.repositories;
              expect(repositoriesState.status, ApiStatus.completed);
              expect(repositoriesState.data?.length, 5);
              expect(repositoriesState.data?.first.name, "name-1");
            },
          );
        },
      );

      group(
        "When the get repositories is failed with exception",
        () {
          setUp(
            () async {
              when(
                mockGetRepositoriesRepo.getRepositories(language: language),
              ).thenThrow(
                FetchDataException("No Internet Connection"),
              );
              await repositoriesProviderImpl.getRepositories(language: language);
            },
          );

          test(
            'then returns the correct error message',
            () async {
              final repositories = repositoriesProviderImpl.repositories;
              expect(repositories.status, ApiStatus.error);
              expect(repositories.message, "Error During Communication: No Internet Connection");
            },
          );
        },
      );
    },
  );
}
