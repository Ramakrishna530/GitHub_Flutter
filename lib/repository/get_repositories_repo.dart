import '../core/http/http_service.dart';
import '../models/get_repositories/repositories_response.dart';
import '../models/get_repositories/repository_response.dart';
import 'service_constants.dart';

abstract class GetRepositoriesRepo {
  Future<List<RepositoryResponse>> getRepositories({required String language});
}

class GetRepositoriesRepoImpl implements GetRepositoriesRepo {
  GetRepositoriesRepoImpl({HttpService? httpService})
      : httpService = httpService ?? HttpServiceImpl();
  final HttpService httpService;

  @override
  Future<List<RepositoryResponse>> getRepositories(
      {required String language}) async {
    final uri = _createUri(language);
    final response = await httpService.getResponse(uri) as Map<String, dynamic>;
    final reposResult = RepositoriesResponse.fromJson(response);
    return reposResult.items;
  }

  Uri _createUri(String language) =>
      Uri.parse("$baseURL/search/repositories?q=language:$language&sort"
          "=stars&order=desc");
}
