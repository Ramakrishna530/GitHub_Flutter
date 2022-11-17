import 'package:flutter/material.dart';

import '../view_model/repositories_view_model.dart';
import 'widget/drop_down.dart';
import 'widget/repositories_widget.dart';

class RepositoriesScreen extends StatefulWidget {
  const RepositoriesScreen({super.key});
  static const routeName = "repositories_screen";

  @override
  State<RepositoriesScreen> createState() => _RepositoriesScreenState();
}

class _RepositoriesScreenState extends State<RepositoriesScreen> {
  final RepositoriesViewModel viewModel = RepositoriesViewModel();
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
  late String _selectedLanguage;

  @override
  void initState() {
    _selectedLanguage = _languages[0];
    viewModel.getRepositories(_selectedLanguage);
    super.initState();
  }

  void _didSelect({required String item}) {
    setState(() {
      _selectedLanguage = item;
      viewModel.getRepositories(_selectedLanguage);
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
                didSelect: _didSelect,
                dropdownValue: _selectedLanguage,
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: RepositoriesWidget(
                  viewModel: viewModel,
                ),
              ),
            ],
          ),
        ),
      );
}
