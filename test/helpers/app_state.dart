import 'package:git_hub/core/http/api_response.dart';
import 'package:git_hub/models/contributors/contributor.dart';
import 'package:git_hub/models/get_repositories/repository_response.dart';
import 'package:git_hub/state/app_state.dart';

AppState createState({
  ApiResponse<List<RepositoryResponse>>? repositoriesState,
  RepositoryResponse? repositoryResponse,
  ApiResponse<List<Contributor>>? contributorsState,
}) =>
    AppState(
      repositoriesState: repositoriesState ?? ApiResponse(status: ApiStatus.loading),
      selectedRepository: repositoryResponse,
      contributorsState: contributorsState ?? ApiResponse(status: ApiStatus.loading),
    );
