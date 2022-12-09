import '../../repository/contributors/contributors_interface.dart';
import '../../repository/user_details/user_details_interface.dart';
import '../../util/dispatcher.dart';
import '../actions.dart';

void getContributorsMiddleware({
  required Object? action,
  required Dispatcher dispatcher,
  required ContributorsRepository contributorsRepository,
  required UserDetailsRepository userDetailsRepository,
}) {
  if (action is GetContributorsLoadingAction) {
    // Get Contributors for the repository
    contributorsRepository.getContributors(repositoryFullName: action.repositoryFullName).then(
      (contributors) {
        dispatcher(
          GetUsersDetailsLoadingAction(contributorsResponse: contributors),
        );
      },
    ).onError(
      (error, stackTrace) {
        dispatcher(
          GetContributorsFailedAction(
            errorMessage: error.toString(),
          ),
        );
      },
    );
  } else if (action is GetUsersDetailsLoadingAction) {
    // Create Future for getting user details of each contributor
    final userDetailsFutures =
        action.contributorsResponse.map((contributorResponse) => userDetailsRepository.getUserDetails(
              url: contributorResponse.url,
            ));
    // get the users details
    Future.wait(userDetailsFutures).then(
      (usersDetailsResponse) {
        dispatcher(GetContributorsSuccessAction(
          contributorsResponse: action.contributorsResponse,
          usersDetailsResponse: usersDetailsResponse,
        ));
      },
    ).onError((error, stackTrace) {
      dispatcher(
        GetContributorsFailedAction(errorMessage: error.toString()),
      );
    });
  }
}
