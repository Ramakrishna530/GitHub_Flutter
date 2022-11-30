import '../../models/get_repositories/repository_response.dart';

abstract class GetRepositoriesRepo {
  Future<List<RepositoryResponse>> getRepositories({
    required String language,
  });
}
