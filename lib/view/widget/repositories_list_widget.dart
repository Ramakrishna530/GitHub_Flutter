import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../core/http/api_response.dart';
import '../../models/get_repositories/repository_response.dart';
import '../../state/app_state.dart';
import 'app_error_widget.dart';
import 'loading_widget.dart';
import 'repository_item_widget.dart';

class RepositoriesListWidget extends StatelessWidget {
  const RepositoriesListWidget({
    super.key,
  });

  Widget _getRepositoriesListView({required List<RepositoryResponse> repositories}) => ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: repositories.length,
        itemBuilder: (context, index) => RepositoryItemWidget(
          id: repositories[index].id,
          name: repositories[index].name,
          avatarUrl: repositories[index].owner.avatarUrl,
          watchersCount: repositories[index].watchersCount,
        ),
      );

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, ApiResponse<List<RepositoryResponse>>>(
        converter: (Store<AppState> store) => store.state.repositoriesState,
        distinct: true,
        builder: (BuildContext context, repositoriesState) {
          print("Rebuild called $RepositoriesListWidget with Status ${repositoriesState.status}");
          switch (repositoriesState.status) {
            case ApiStatus.loading:
              return LoadingWidget(message: repositoriesState.message!);
            case ApiStatus.error:
              return AppErrorWidget(message: repositoriesState.message!);
            case ApiStatus.completed:
              return _getRepositoriesListView(repositories: repositoriesState.data!);
          }
        },
      );
}
