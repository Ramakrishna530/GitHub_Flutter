import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/http/api_response.dart';
import '../../models/get_repositories/repository_response.dart';
import '../../view_model/repositories_view_model.dart';
import 'app_error_widget.dart';
import 'loading_widget.dart';
import 'repository_item_widget.dart';

class RepositoriesWidget extends StatelessWidget {
  const RepositoriesWidget({
    required this.viewModel,
    super.key,
  });

  final RepositoriesViewModel viewModel;

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
  Widget build(BuildContext context) =>
      ChangeNotifierProvider<RepositoriesViewModel>(
        create: (BuildContext context) => viewModel,
        child:
            Consumer<RepositoriesViewModel>(builder: (context, viewModel, _) {
          switch (viewModel.repositories.status) {
            case ApiStatus.loading:
              return const LoadingWidget();
            case ApiStatus.error:
              return AppErrorWidget(
                viewModel.repositories.message!,
              );
            case ApiStatus.completed:
              return _getRepositoriesListView(
                viewModel.repositories.data!,
              );
          }
        }),
      );
}
