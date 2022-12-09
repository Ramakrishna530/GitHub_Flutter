import 'package:flutter_test/flutter_test.dart';
import 'package:git_hub/core/http/api_response.dart';
import 'package:git_hub/state/actions.dart';
import 'package:git_hub/state/app_state.dart';
import 'package:git_hub/state/reducer.dart';

import '../helpers/app_state.dart';
import '../helpers/repositories_mock.dart';

void main() {
  group("$appReducer", () {
    late AppState state;
    const language = "Dart";

    group("When get repositories loading action received", () {
      setUp(() {
        state = appReducer(
          createState(
            repositoriesState: ApiResponse(status: ApiStatus.completed),
          ),
          const GetRepositoriesLoadingAction(language: language),
        );
      });
      test("then repositories state status is loading and the message should be proper", () {
        expect(state.repositoriesState.status, ApiStatus.loading);
        expect(state.repositoriesState.message, "Loading Repositories for $language");
      });
    });

    group("When get repositories success action received", () {
      setUp(() {
        state = appReducer(
          createState(
            repositoriesState: ApiResponse(
              status: ApiStatus.loading,
            ),
          ),
          GetRepositoriesSuccessAction(repositories: getRepositoriesResponse()),
        );
      });

      test("then the state status is completed and the repositories data should be the correct", () {
        expect(state.repositoriesState.status, ApiStatus.completed);
        expect(state.repositoriesState.data, getRepositoriesResponse());
      });
    });

    group("When get repositories failed action received", () {
      setUp(() {
        state = appReducer(
          createState(
            repositoriesState: ApiResponse(status: ApiStatus.loading),
          ),
          const GetRepositoriesFailedAction(errorMessage: "No Internet Connection"),
        );
      });
      test("then repositories state status is error and the error message should be proper", () {
        expect(state.repositoriesState.status, ApiStatus.error);
        expect(state.repositoriesState.message, "No Internet Connection");
      });
    });

    group("When set repository action received", () {
      setUp(() {
        state = appReducer(
          createState(
            repositoriesState: ApiResponse(
              status: ApiStatus.completed,
              data: getRepositoriesResponse(),
            ),
          ),
          const SetSelectedRepositoryAction(repositoryID: 1),
        );
      });

      test("then the state updated with the correct repository information", () {
        expect(state.selectedRepository, getRepositoriesResponse().first);
      });
    });
  });
}
