import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/http/api_response.dart';
import '../models/get_repositories/repository_rto.dart';
import '../view_model/repositories_view_model.dart';
import 'widget/app_error_widget.dart';
import 'widget/drop_down.dart';
import 'widget/loading_widget.dart';
import 'widget/repository_item_widget.dart';

class RepositoriesScreen extends StatefulWidget {
  static const routeName = "repositories_screen";
  const RepositoriesScreen({super.key});

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

  void _didSelect({required String item}) {
    setState(() {
      _selectedLanguage = item;
      viewModel.getRepositories(_selectedLanguage);
    });
  }

  @override
  void initState() {
    _selectedLanguage = _languages[0];
    viewModel.getRepositories(_selectedLanguage);
    super.initState();
  }

  Widget _getRepositoriesListView(List<RepositoryRTO> repositories) =>
      ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: repositories.length,
        itemBuilder: (context, index) =>
            RepositoryItemWidget(repositories[index]),
      );

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
                child: ChangeNotifierProvider<RepositoriesViewModel>(
                  create: (BuildContext context) => viewModel,
                  child: Consumer<RepositoriesViewModel>(
                      builder: (context, viewModel, _) {
                    switch (viewModel.repositories.status!) {
                      case ApiStatus.loading:
                        return const LoadingWidget();
                      case ApiStatus.error:
                        return AppErrorWidget(viewModel.repositories.message!);
                      case ApiStatus.completed:
                        return _getRepositoriesListView(
                            viewModel.repositories.data!);
                    }
                  }),
                ),
              ),
            ],
          ),
        ),
      );
}
