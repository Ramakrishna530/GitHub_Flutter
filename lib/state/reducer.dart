import 'package:redux/redux.dart';

import '../core/http/api_response.dart';
import '../models/contributors/contributor.dart';
import '../models/contributors/contributor_response.dart';
import '../models/user_details/user_details_response.dart';
import 'actions.dart';
import 'app_state.dart';

final appReducer = combineReducers<AppState>(
  [
    TypedReducer<AppState, GetRepositoriesLoadingAction>(_getRepositoriesLoading),
    TypedReducer<AppState, GetRepositoriesSuccessAction>(_getRepositoriesSuccess),
    TypedReducer<AppState, GetRepositoriesFailedAction>(_getRepositoriesFailed),
    TypedReducer<AppState, SetSelectedRepositoryAction>(_setSelectedRepository),
    TypedReducer<AppState, GetContributorsLoadingAction>(_getContributorsLoading),
    TypedReducer<AppState, GetContributorsSuccessAction>(_getContributorsSuccess),
    TypedReducer<AppState, GetContributorsFailedAction>(_getContributorsFailed),
  ],
);

AppState _getRepositoriesLoading(
  AppState appState,
  GetRepositoriesLoadingAction action,
) =>
    appState.copyWith(
      repositoriesState: ApiResponse.loading(action.message),
    );

AppState _getRepositoriesSuccess(
  AppState appState,
  GetRepositoriesSuccessAction action,
) =>
    appState.copyWith(
      repositoriesState: ApiResponse.completed(action.repositories),
    );

AppState _getRepositoriesFailed(
  AppState appState,
  GetRepositoriesFailedAction action,
) =>
    appState.copyWith(
      repositoriesState: ApiResponse.error(action.errorMessage),
    );

AppState _setSelectedRepository(
  AppState appState,
  SetSelectedRepositoryAction action,
) {
  final selectedRepository = appState.repositoriesState.data?.firstWhere(
    (repository) => repository.id == action.repositoryID,
  );
  return appState.copyWith(selectedRepository: selectedRepository);
}

AppState _getContributorsLoading(
  AppState appState,
  GetContributorsLoadingAction action,
) =>
    appState.copyWith(
      contributorsState: ApiResponse.loading(action.message),
    );

AppState _getContributorsSuccess(
  AppState appState,
  GetContributorsSuccessAction action,
) {
  final contributors = _createContributors(
    action.usersDetailsResponse,
    action.contributorsResponse,
  );
  return appState.copyWith(
    contributorsState: ApiResponse.completed(contributors),
  );
}

AppState _getContributorsFailed(
  AppState appState,
  GetContributorsFailedAction action,
) =>
    appState.copyWith(
      contributorsState: ApiResponse.error(action.errorMessage),
    );

List<Contributor> _createContributors(
  List<UserDetailsResponse> userDetailsResponse,
  List<ContributorResponse> contributorsResponse,
) {
  final contributors = <Contributor>[];
  userDetailsResponse.forEach((userDetails) {
    final contributorResponse = contributorsResponse.firstWhere(
      (contributorResponse) => contributorResponse.id == userDetails.id,
    );
    final contributor = Contributor(
      id: userDetails.id,
      contributionsCount: contributorResponse.contributions,
      avatarUrl: userDetails.avatarUrl,
      followers: userDetails.followers,
      name: userDetails.name,
      bio: userDetails.bio,
      company: userDetails.company,
    );
    contributors.add(contributor);
  });
  return contributors;
}
