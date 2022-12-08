import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:functional_data/functional_data.dart';

import '../core/http/api_response.dart';
import '../models/contributors/contributor.dart';
import '../models/get_repositories/repository_response.dart';

part 'app_state.g.dart';

// ignore_for_file: annotate_overrides

@immutable
@FunctionalData()
class AppState extends $AppState {
  @CustomEquality(DeepCollectionEquality())
  final ApiResponse<List<RepositoryResponse>> repositoriesState;

  final RepositoryResponse? selectedRepository;

  @CustomEquality(DeepCollectionEquality())
  final ApiResponse<List<Contributor>> contributorsState;

  const AppState({
    required this.repositoriesState,
    required this.selectedRepository,
    required this.contributorsState,
  });

  AppState.initialState()
      : this(
          repositoriesState: ApiResponse(status: ApiStatus.loading, message: ""),
          selectedRepository: null,
          contributorsState: ApiResponse(status: ApiStatus.loading, message: ""),
        );
}
