import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/http/api_response.dart';
import '../../models/get_repositories/repository_response.dart';
import '../../provider/repositories_provider.dart';
import 'app_error_widget.dart';
import 'loading_widget.dart';
import 'repository_item_widget.dart';

class RepositoriesListWidget extends StatelessWidget {
  const RepositoriesListWidget({
    super.key,
  });

  Widget _getRepositoriesListView(List<RepositoryResponse> repositories) =>
      ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: repositories.length,
        itemBuilder: (context, index) => RepositoryItemWidget(
          name: repositories[index].name,
          avatarUrl: repositories[index].owner.avatarUrl,
          watchersCount: repositories[index].watchersCount,
        ),
      );

  @override
  Widget build(BuildContext context) {
    final repositoriesProvider = context.watch<RepositoriesProviderImpl>();
    switch (repositoriesProvider.repositories.status) {
      case ApiStatus.loading:
        return const LoadingWidget();
      case ApiStatus.error:
        return AppErrorWidget(
          repositoriesProvider.repositories.message!,
        );
      case ApiStatus.completed:
        return _getRepositoriesListView(
          repositoriesProvider.repositories.data!,
        );
    }
  }
}
