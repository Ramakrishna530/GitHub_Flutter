// ThunkAction
import 'package:redux/redux.dart';

import '../../repository/contributors/contributors.dart';
import '../../repository/contributors/contributors_interface.dart';
import '../../repository/get_repositories/get_repositories.dart';
import '../../repository/get_repositories/get_repositories_interface.dart';
import '../../repository/user_details/user_details.dart';
import '../../repository/user_details/user_details_interface.dart';
import '../../util/dispatcher.dart';
import 'get_contributors_middleware.dart';
import 'get_repositories_middleware.dart';

class GithubMiddleware {
  GithubMiddleware({
    GetRepositoriesRepo? getRepositoriesRepo,
    ContributorsRepository? contributorsRepository,
    UserDetailsRepository? userDetailsRepository,
  })  : getRepositoriesRepo = getRepositoriesRepo ?? GetRepositoriesRepoImpl(),
        contributorsRepository = contributorsRepository ?? ContributorsRepositoryImpl(),
        userDetailsRepository = userDetailsRepository ?? UserDetailsRepositoryImpl();

  final GetRepositoriesRepo getRepositoriesRepo;
  final ContributorsRepository contributorsRepository;
  final UserDetailsRepository userDetailsRepository;

  List<Middleware<AppState>> middlewares<AppState>() => [
        (Store<AppState> store, Object? action, NextDispatcher next) {
          getRepositoriesMiddleware(
            action: action,
            getRepositoriesRepo: getRepositoriesRepo,
            dispatcher: Dispatcher(store.dispatch),
          );
          next(action);
        },
        (Store<AppState> store, Object? action, NextDispatcher next) {
          getContributorsMiddleware(
            action: action,
            dispatcher: Dispatcher(store.dispatch),
            contributorsRepository: contributorsRepository,
            userDetailsRepository: userDetailsRepository,
          );
          next(action);
        },
      ];
}
