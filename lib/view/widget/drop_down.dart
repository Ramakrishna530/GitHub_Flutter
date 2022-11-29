import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropDown extends StatelessWidget {
  const DropDown({
    required this.items,
    required this.didSelect,
    this.dropdownValue,
    super.key,
  });

  final String? dropdownValue;
  final List<String> items;
  final void Function({required String item}) didSelect;

  @override
  Widget build(BuildContext context) => DropdownButton2(
        isExpanded: true,
        buttonPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        buttonDecoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(20),
        ),
        hint: Text(
          "Select Language",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: items
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
        value: dropdownValue,
        onChanged: (value) {
          if (value != null) {
            didSelect(item: value);
          }
        },
      );
}
