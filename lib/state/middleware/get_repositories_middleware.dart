import '../../repository/get_repositories/get_repositories_interface.dart';
import '../../util/dispatcher.dart';
import '../actions.dart';

void getRepositoriesMiddleware({
  required Object? action,
  required Dispatcher dispatcher,
  required GetRepositoriesRepo getRepositoriesRepo,
}) {
  if (action is GetRepositoriesLoadingAction) {
    getRepositoriesRepo
        .getRepositories(
      language: action.language,
    )
        .then((repositoriesResponse) {
      dispatcher(GetRepositoriesSuccessAction(repositories: repositoriesResponse));
    }).onError((error, stackTrace) {
      dispatcher(GetRepositoriesFailedAction(errorMessage: error.toString()));
    });
  }
}
