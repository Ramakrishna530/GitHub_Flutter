import 'package:flutter/material.dart';

import '../core/http/api_response.dart';
import '../models/get_repositories/repository_response.dart';
import '../repository/get_repositories_repo.dart';

class RepositoriesViewModel extends ChangeNotifier {
  GetRepositoriesRepo repositoriesRepo = GetRepositoriesRepoImpl();
  ApiResponse<List<RepositoryResponse>> repositories = ApiResponse.loading();

  Future<void> getRepositories(String language) async {
    _setRepositoriesState(ApiResponse.loading());
    await repositoriesRepo
        .getRepositories(language)
        .then((value) => _setRepositoriesState(ApiResponse.completed(value)))
        .onError((error, stackTrace) =>
            _setRepositoriesState(ApiResponse.error(error.toString())));
  }

  void _setRepositoriesState(ApiResponse<List<RepositoryResponse>> response) {
    repositories = response;
    notifyListeners();
  }
}
