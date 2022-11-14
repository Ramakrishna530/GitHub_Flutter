import 'package:flutter/material.dart';

import '../widgets/drop_down.dart';

class RepositoriesScreen extends StatefulWidget {
  const RepositoriesScreen({super.key});

  @override
  State<RepositoriesScreen> createState() => _RepositoriesScreenState();
}

class _RepositoriesScreenState extends State<RepositoriesScreen> {
  final _languages = const <String>[
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
  List<String> _repositories = [];

  void _didSelect(String item) {
    setState(() {
      _selectedLanguage = item;
      _repositories =
          List<String>.generate(100, (index) => "Repo ${index + 1}");
    });
  }

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
                didSelectItemHandler: _didSelect,
                dropdownValue: _selectedLanguage,
              ),
              Expanded(
                child: _repositories.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: _repositories.length,
                        itemBuilder: (context, index) => ListTile(
                          title: Text(_repositories[index]),
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
