import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/get_repositories/repository_response.dart';
import '../../provider/contributors_provider.dart';
import '../widget/contributors.dart';

class RepositoryDetails extends StatelessWidget {
  const RepositoryDetails({super.key});
  static const String routeName = "/repository_details";
  @override
  Widget build(BuildContext context) => ListenableProvider<ContributorsProvider>.value(
        value: ContributorsProviderImpl(),
        child: const RepositoryDetailsScreen(),
      );
}

class RepositoryDetailsScreen extends StatelessWidget {
  const RepositoryDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final repositoryResponse = ModalRoute.of(context)?.settings.arguments as RepositoryResponse;
    return Scaffold(
      appBar: AppBar(
        title: Text(repositoryResponse.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: NetworkImage(repositoryResponse.owner.avatarUrl),
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Watchers Count: ${repositoryResponse.watchersCount}",
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  "Public: ${!repositoryResponse.private}",
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ContributorsWidget(
                repositoryFullName: repositoryResponse.fullName,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
