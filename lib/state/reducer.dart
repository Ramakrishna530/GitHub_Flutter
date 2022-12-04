import '../core/http/api_response.dart';
import '../models/contributors/contributor.dart';
import '../models/contributors/contributor_response.dart';
import '../models/user_details/user_details_response.dart';
import 'actions.dart';
import 'app_state.dart';

AppState reducer(AppState previousState, Object? action) {
  if (action is GetRepositoriesLoadingAction) {
    return previousState.copyWith(
      repositoriesState: ApiResponse.loading(action.message),
    );
  }

  if (action is GetRepositoriesSuccessAction) {
    return previousState.copyWith(
      repositoriesState: ApiResponse.completed(action.repositories),
    );
  }

  if (action is GetRepositoriesFailedAction) {
    return previousState.copyWith(
      repositoriesState: ApiResponse.error(action.errorMessage),
    );
  }

  if (action is SetSelectedRepositoryAction) {
    final selectedRepository = previousState.repositoriesState.data?.firstWhere(
      (repository) => repository.id == action.repositoryID,
    );
    return previousState.copyWith(selectedRepository: selectedRepository);
  }

  if (action is GetContributorsLoadingAction) {
    return previousState.copyWith(
      contributorsState: ApiResponse.loading(action.message),
    );
  }

  if (action is GetContributorsSuccessAction) {
    final contributors = _createContributors(
      action.usersDetailsResponse,
      action.contributorsResponse,
    );
    return previousState.copyWith(
      contributorsState: ApiResponse.completed(contributors),
    );
  }

  if (action is GetContributorsFailedAction) {
    return previousState.copyWith(
      contributorsState: ApiResponse.error(action.errorMessage),
    );
  }
  return previousState;
}

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
