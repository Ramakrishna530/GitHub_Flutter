import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/contributors_provider.dart';
import '../../provider/repositories_provider.dart';
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
    final repositoryID = ModalRoute.of(context)?.settings.arguments as int;
    final repositoryResponse = context.read<RepositoriesProvider>().getRepositoryResponseBy(id: repositoryID)!;
    final appBar = AppBar(
      title: Text(repositoryResponse.name),
    );
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Column(
                children: [
                  Image(
                    image: NetworkImage(repositoryResponse.owner.avatarUrl),
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
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
                  const Text(
                    "Contributors",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(10),
                    bottom: Radius.circular(15),
                  ),
                ),
                child: ContributorsWidget(
                  repositoryFullName: repositoryResponse.fullName,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
