import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/repositories_provider.dart';
import '../widget/drop_down.dart';
import '../widget/repositories_list_widget.dart';

class Repositories extends StatelessWidget {
  const Repositories({super.key});
  static const routeName = "/repositories";

  @override
  Widget build(BuildContext context) => ListenableProvider<RepositoriesProvider>.value(
        value: RepositoriesProviderImpl(),
        child: const RepositoriesScreen(),
      );
}

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
  late String _selectedLanguage;

  @override
  void initState() {
    super.initState();
    _selectedLanguage = _languages[0];
    Future.delayed(
      const Duration(seconds: 1),
      () {
        context.read<RepositoriesProvider>().getRepositories(language: _selectedLanguage);
      },
    );
  }

  void _didSelect({required String item}) {
    setState(() {
      _selectedLanguage = item;
    });
    context.read<RepositoriesProvider>().getRepositories(language: _selectedLanguage);
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
              const Expanded(
                child: RepositoriesListWidget(),
              ),
            ],
          ),
        ),
      );
}