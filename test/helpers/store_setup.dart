import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:git_hub/state/app_state.dart';
import 'package:git_hub/state/middleware/app_middleware.dart';
import 'package:git_hub/state/reducer.dart';
import 'package:redux/redux.dart';

import '../mocks/test_mocks.mocks.dart';

Widget createMaterialApp({
  required Widget child,
  AppState? state,
  MockGetRepositoriesRepo? getRepositoriesRepo,
  MockContributorsRepository? contributorsRepository,
  MockUserDetailsRepository? userDetailsRepository,
}) {
  var middleware = <Middleware<AppState>>[];
  if (getRepositoriesRepo != null || contributorsRepository != null || userDetailsRepository != null) {
    final repositoriesRepo = getRepositoriesRepo ?? MockGetRepositoriesRepo();
    final userDetailsRepo = userDetailsRepository ?? MockUserDetailsRepository();
    final contributorsRepo = contributorsRepository ?? MockContributorsRepository();
    final appMiddleware = AppMiddleware(
      getRepositoriesRepo: repositoriesRepo,
      userDetailsRepository: userDetailsRepo,
      contributorsRepository: contributorsRepo,
    );
    middleware = appMiddleware.middlewares();
  }

  final store = Store<AppState>(
    appReducer,
    initialState: state ?? AppState.initialState(),
    middleware: middleware,
  );
  return StoreProvider<AppState>(
    store: store,
    child: MaterialApp(
      home: Scaffold(
        body: child,
      ),
    ),
  );
}
