import 'package:git_hub/models/get_repositories/repository_owner_response.dart';
import 'package:git_hub/models/get_repositories/repository_response.dart';

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
