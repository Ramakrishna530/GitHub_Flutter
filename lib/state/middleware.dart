// ThunkAction
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import '../repository/contributors/contributors.dart';
import '../repository/contributors/contributors_interface.dart';
import '../repository/get_repositories/get_repositories.dart';
import '../repository/get_repositories/get_repositories_interface.dart';
import '../repository/user_details/user_details.dart';
import '../repository/user_details/user_details_interface.dart';
import 'actions.dart';
import 'app_state.dart';

ThunkAction<AppState> getRepositories({
  required String language,
  GetRepositoriesRepo? getRepositoriesRepo,
}) =>
    (Store<AppState> store) async {
      final repo = getRepositoriesRepo ?? GetRepositoriesRepoImpl();
      store.dispatch(GetRepositoriesLoadingAction(message: "Loading Repositories for $language"));
      try {
        final response = await repo.getRepositories(language: language);
        store.dispatch(GetRepositoriesSuccessAction(repositories: response));
      } on Exception catch (error) {
        print("Error = $error");
        store.dispatch(GetRepositoriesFailedAction(errorMessage: error.toString()));
      }
    };

ThunkAction<AppState> getContributorsDetail({
  required String repositoryFullName,
  ContributorsRepository? contributorsRepository,
  UserDetailsRepository? userDetailsRepository,
}) =>
    (Store<AppState> store) async {
      store.dispatch(const GetContributorsLoadingAction(message: "Loading Contributors..."));
      final contributorsRepo = contributorsRepository ?? ContributorsRepositoryImpl();
      final userDetailsRepo = userDetailsRepository ?? UserDetailsRepositoryImpl();
      try {
        // Get Contributors for the repository
        final contributorsResponse = await contributorsRepo.getContributors(
          repositoryFullName: repositoryFullName,
        );
        // Create Future for getting user details of each contributor
        final userDetailsFutures = contributorsResponse.map(
          (contributorResponse) => userDetailsRepo.getUserDetails(
            url: contributorResponse.url,
          ),
        );
        // get the users details
        final usersDetailsResponse = await Future.wait(userDetailsFutures);
        store.dispatch(GetContributorsSuccessAction(
          contributorsResponse: contributorsResponse,
          usersDetailsResponse: usersDetailsResponse,
        ));
      } on Exception catch (error) {
        store.dispatch(GetRepositoriesFailedAction(errorMessage: error.toString()));
      }
    };
