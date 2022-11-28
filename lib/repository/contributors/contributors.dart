import 'dart:core';

import '../../core/http/http_service.dart';
import '../../models/contributors/contributor_response.dart';
import '../service_constants.dart';
import 'contributors_interface.dart';

class ContributorsRepositoryImpl implements ContributorsRepository {
  ContributorsRepositoryImpl({HttpService? httpService}) : httpService = httpService ?? HttpServiceImpl();
  final HttpService httpService;

  @override
  Future<List<ContributorResponse>> getContributors({required String repositoryFullName}) async {
    final uri = _createUri(repositoryFullName: repositoryFullName);
    final response = await httpService.getResponse(uri) as List<dynamic>;
    final contributorsResponseMap = List<Map<String, dynamic>>.from(response);
    final contributorsResponse = contributorsResponseMap.map(ContributorResponse.fromJson).toList();
    return contributorsResponse;
  }

  Uri _createUri({required String repositoryFullName}) =>
      Uri.parse("$baseURL/repos/$repositoryFullName/contributors?q=contributions&order"
          "=desc&per_page=3");
}
