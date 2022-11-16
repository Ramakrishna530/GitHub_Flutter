import 'package:flutter/material.dart';

import '../core/http/api_response.dart';
import '../models/get_repositories/repository_rto.dart';
import '../repository/get_repositories_repo.dart';

class RepositoriesViewModel extends ChangeNotifier {
  GetRepositoriesRepo repositoriesRepo = GetRepositoriesRepoImpl();
  ApiResponse<List<RepositoryRTO>> repositories = ApiResponse.loading();

  void _setRepositoriesState(ApiResponse<List<RepositoryRTO>> response) {
    repositories = response;
    notifyListeners();
  }

  Future<void> getRepositories(String language) async {
    _setRepositoriesState(ApiResponse.loading());
    await repositoriesRepo
        .getRepositories(language)
        .then((value) => _setRepositoriesState(ApiResponse.completed(value)))
        .onError((error, stackTrace) =>
            _setRepositoriesState(ApiResponse.error(error.toString())));
  }
}
