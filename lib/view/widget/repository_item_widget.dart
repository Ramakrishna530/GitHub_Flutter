import 'package:flutter/material.dart';

class RepositoryItemWidget extends StatelessWidget {
  const RepositoryItemWidget({
    required this.name,
    required this.avatarUrl,
    required this.watchersCount,
    super.key,
  });

  final String name;
  final String avatarUrl;
  final int watchersCount;

  void _didSelect() {}

  @override
  Widget build(BuildContext context) => ListTile(
        key: Key(name),
        onTap: _didSelect,
        leading: CircleAvatar(
          backgroundImage: NetworkImage(avatarUrl),
          onBackgroundImageError: (error, stackTrance) =>
              const AssetImage("assets/images/img_error.png"),
        ),
        title: Text(name),
        subtitle: Text("Watchers Count - $watchersCount"),
      );
}
