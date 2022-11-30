import 'package:flutter/material.dart';

import '../screens/repository_details.dart';

class RepositoryItemWidget extends StatelessWidget {
  const RepositoryItemWidget({
    required this.id,
    required this.name,
    required this.avatarUrl,
    required this.watchersCount,
    super.key,
  });

  final int id;
  final String name;
  final String avatarUrl;
  final int watchersCount;

  void _didSelect(BuildContext context) {
    Navigator.pushNamed(
      context,
      RepositoryDetails.routeName,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) => ListTile(
        key: Key(name),
        onTap: () => _didSelect(context),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(avatarUrl),
          onBackgroundImageError: (error, stackTrance) => const AssetImage("assets/images/img_error.png"),
        ),
        title: Text(name),
        subtitle: Text("Watchers Count - $watchersCount"),
      );
}
