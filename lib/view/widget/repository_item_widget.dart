import 'package:flutter/material.dart';

import '../../models/get_repositories/repository_rto.dart';

class RepositoryItemWidget extends StatelessWidget {
  final RepositoryRTO repositoryRTO;
  const RepositoryItemWidget(this.repositoryRTO, {super.key});

  void didSelect() {
    print("Selected item: ${repositoryRTO.name}");
  }

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: didSelect,
        leading: CircleAvatar(
          backgroundImage: NetworkImage(repositoryRTO.owner.avatarUrl),
          onBackgroundImageError: (error, stackTrance) =>
              const AssetImage("assets/images/img_error.png"),
        ),
        title: Text(repositoryRTO.name),
        subtitle: Text("Watchers Count - ${repositoryRTO.watchersCount}"),
      );
}
