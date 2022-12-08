import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../state/actions.dart';
import '../../state/app_state.dart';

class DropDown extends StatefulWidget {
  const DropDown({
    required this.items,
    required this.dropdownValue,
    super.key,
  });

  final String dropdownValue;
  final List<String> items;

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  late String selectedDropDownValue;
  @override
  void initState() {
    super.initState();
    selectedDropDownValue = widget.dropdownValue;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      StoreProvider.of<AppState>(context).dispatch(
        GetRepositoriesLoadingAction(language: selectedDropDownValue),
      );
    });
  }

  void _didSelect({required String item}) {
    setState(() {
      selectedDropDownValue = item;
    });
    StoreProvider.of<AppState>(context).dispatch(
      GetRepositoriesLoadingAction(language: selectedDropDownValue),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("rebuild called on Dropdown");
    return DropdownButton2(
      isExpanded: true,
      buttonPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      buttonDecoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      hint: Text(
        "Select Language",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).hintColor),
      ),
      items: widget.items
          .map(
            (item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                key: Key("$item"),
                item,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          )
          .toList(),
      value: selectedDropDownValue,
      onChanged: (value) {
        if (value != null) {
          _didSelect(item: value);
        }
      },
    );
  }
}
