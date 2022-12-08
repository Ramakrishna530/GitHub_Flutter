import 'package:flutter/material.dart';

import '../widget/drop_down.dart';
import '../widget/repositories_list_widget.dart';

class RepositoriesScreen extends StatelessWidget {
  const RepositoriesScreen({super.key});
  static const routeName = "/repositories_screen";

  List<String> get _languages => const <String>[
        "Dart",
        "Java",
        "JavaScript",
        "Kotlin",
        "PHP",
        "Python",
        "Ruby",
        "Swift",
        "TypeScript",
      ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Repositories"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Column(
            children: [
              DropDown(
                items: _languages,
                dropdownValue: _languages[0],
              ),
              const SizedBox(
                height: 10,
              ),
              const Expanded(
                child: RepositoriesListWidget(),
              ),
            ],
          ),
        ),
      );
}
