import '../core/http/http_service.dart';
import '../models/get_repositories/repos_result_rto.dart';
import '../models/get_repositories/repository_rto.dart';
import 'service_constants.dart';

abstract class GetRepositoriesRepo {
  Future<List<RepositoryRTO>> getRepositories(String language);
}

class GetRepositoriesRepoImpl implements GetRepositoriesRepo {
  HttpService httpService = HttpServiceImpl();
  GetRepositoriesRepoImpl();

  @override
  Future<List<RepositoryRTO>> getRepositories(String language) async {
    try {
      final uri = createUri(language);
      final response =
          await httpService.getResponse(uri) as Map<String, dynamic>;
      final reposResult = ReposResultRTO.fromJson(response);
      return reposResult.items;
    } on Exception catch (_) {
      rethrow;
    }
  }

  Uri createUri(String language) =>
      Uri.parse("$baseURL/search/repositories?q=language:$language&sort"
          "=stars&order=desc");
}
