import 'package:flutter_test/flutter_test.dart';
import 'package:git_hub/core/http/http_exception.dart';
import 'package:git_hub/state/actions.dart';
import 'package:git_hub/state/middleware/get_repositories_middleware.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/repositories_mock.dart';
import '../../mocks/test_mocks.mocks.dart';

void main() {
  group("$getRepositoriesMiddleware", () {
    late MockGetRepositoriesRepo getRepositoriesRepo;
    late MockDispatcher dispatcher;
    late void Function(Object action) sut;
    const language = "Dart";
    setUp(() {
      getRepositoriesRepo = MockGetRepositoriesRepo();
      dispatcher = MockDispatcher();
      sut = (Object action) => getRepositoriesMiddleware(
            action: action,
            dispatcher: dispatcher,
            getRepositoriesRepo: getRepositoriesRepo,
          );
    });

    group("When $GetRepositoriesLoadingAction is received", () {
      group("When get repositories API is success", () {
        final repositories = getRepositoriesResponse();
        setUp(() {
          when(getRepositoriesRepo.getRepositories(language: language)).thenAnswer(
            (_) => Future.value(repositories),
          );
          sut(const GetRepositoriesLoadingAction(language: language));
        });
        test("then $GetRepositoriesSuccessAction should be called", () {
          verify(dispatcher(
            GetRepositoriesSuccessAction(repositories: repositories),
          )).called(1);
        });
      });

      group("When get repositories API is failed", () {
        setUp(() {
          when(
            getRepositoriesRepo.getRepositories(language: language),
          ).thenAnswer((_) => Future.error(FetchDataException("No Internet connection")));
          sut(const GetRepositoriesLoadingAction(language: language));
        });
        test("then $GetRepositoriesFailedAction should be called", () {
          verify(dispatcher(const GetRepositoriesFailedAction(
            errorMessage: "Error During Communication: No Internet "
                "connection",
          ))).called(1);
        });
      });
    });
  });
}
