import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../models/get_repositories/repository_response.dart';
import '../../state/app_state.dart';
import '../widget/contributors.dart';

class RepositoryDetailsScreen extends StatelessWidget {
  const RepositoryDetailsScreen({super.key});
  static const String routeName = "/repository_details_screen";
  Text _createTextWidget({required String text, required BuildContext context}) => Text(
        text,
        textAlign: TextAlign.left,
        style: Theme.of(context).textTheme.bodyText1,
      );

  @override
  Widget build(BuildContext context) {
    print("Rebuild called $RepositoryDetailsScreen");
    return StoreConnector<AppState, RepositoryResponse>(
      converter: (Store<AppState> store) => store.state.selectedRepository!,
      builder: (_, repositoryResponse) => Scaffold(
        appBar: AppBar(
          title: Text(repositoryResponse.name),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: NetworkImage(repositoryResponse.owner.avatarUrl),
                errorBuilder: (context, object, stackTrace) => const Image(
                  height: 200,
                  width: double.infinity,
                  image: AssetImage(
                    "assets/images/img_error.png",
                  ),
                ),
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
                  _createTextWidget(
                    text: "Watchers Count: ${repositoryResponse.watchersCount}",
                    context: context,
                  ),
                  _createTextWidget(
                    text: "Public: ${!repositoryResponse.private}",
                    context: context,
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
              const SizedBox(
                height: 10,
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
      ),
    );
  }
}
