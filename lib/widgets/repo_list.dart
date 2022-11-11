import 'package:flutter/material.dart';

import 'drop_down.dart';

class RepoList extends StatefulWidget {
  const RepoList({super.key});

  @override
  State<RepoList> createState() => _RepoListState();
}

class _RepoListState extends State<RepoList> {
  String appBarTitle = "Repositories";
  List<String> repositories = List<String>.generate(
      100,
      (index) => "Repo "
          "${index + 1}");
  TextEditingController searchEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Container(
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: DropDown(
                const [
                  "swift",
                  "kotlin",
                  "dart",
                  "swift2",
                  "kotlin2",
                  "dart2",
                  "swift3",
                  "kotlin3",
                  "dart3",
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: repositories.length,
                    itemBuilder: (context, index) => ListTile(
                          title: Text(repositories[index]),
                        )))
          ],
        ),
      ));
}
