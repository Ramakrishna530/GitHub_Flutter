import 'package:flutter/material.dart';

import '../widgets/drop_down.dart';

class RepositoriesScreen extends StatefulWidget {
  const RepositoriesScreen({super.key});

  @override
  State<RepositoriesScreen> createState() => _RepositoriesScreenState();
}

class _RepositoriesScreenState extends State<RepositoriesScreen> {
  final List<String> _languages = [
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
  String? _selectedLanguage;
  List<String> repositories = [];

  void _didSelectItem(String item) {
    setState(() {
      _selectedLanguage = item;
      repositories = List<String>.generate(100, (index) => "Repo ${index + 1}");
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Repositories"),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Column(
            children: [
              DropDown(
                items: _languages,
                didSelectItemHandler: _didSelectItem,
                dropdownValue: _selectedLanguage,
              ),
              Expanded(
                child: repositories.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: repositories.length,
                        itemBuilder: (context, index) => ListTile(
                          title: Text(repositories[index]),
                        ),
                      )
                    : const Center(
                        child: Text("No Records Found"),
                      ),
              ),
            ],
          ),
        ),
      );
}
