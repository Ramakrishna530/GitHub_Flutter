import 'package:flutter/material.dart';

import '../core/http/api_response.dart';
import '../models/get_repositories/repository_response.dart';
import '../repository/get_repositories/get_repositories.dart';
import '../repository/get_repositories/get_repositories_interface.dart';

abstract class RepositoriesProvider implements Listenable {
  Future<void> getRepositories({
    required String language,
  });
  ApiResponse<List<RepositoryResponse>> get repositories;

  RepositoryResponse? getRepositoryResponseBy({required int id});
}

class RepositoriesProviderImpl extends ChangeNotifier implements RepositoriesProvider {
  RepositoriesProviderImpl({
    GetRepositoriesRepo? getRepositoriesRepo,
  }) : getRepositoriesRepo = getRepositoriesRepo ?? GetRepositoriesRepoImpl();
  GetRepositoriesRepo getRepositoriesRepo;

  @override
  ApiResponse<List<RepositoryResponse>> get repositories => _repositories;

  ApiResponse<List<RepositoryResponse>> _repositories = ApiResponse.loading();

  @override
  Future<void> getRepositories({required String language}) async {
    _setRepositoriesState(ApiResponse.loading());
    try {
      final response = await getRepositoriesRepo.getRepositories(language: language);
      _setRepositoriesState(ApiResponse.completed(response));
    } on Exception catch (error) {
      print("Error = $error");
      _setRepositoriesState(ApiResponse.error(error.toString()));
    }
  }

  void _setRepositoriesState(ApiResponse<List<RepositoryResponse>> response) {
    _repositories = response;
    notifyListeners();
  }

  @override
  RepositoryResponse? getRepositoryResponseBy({required int id}) =>
      _repositories.data?.firstWhere((repository) => repository.id == id);
}
