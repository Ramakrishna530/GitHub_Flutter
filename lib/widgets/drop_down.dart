import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropDown extends StatelessWidget {
  final String? dropdownValue;
  final List<String> items;
  final Function didSelectItemHandler;

  const DropDown({
    required this.items,
    required this.didSelectItemHandler,
    this.dropdownValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
        ),
        child: DropdownButton2(
          isExpanded: true,
          hint: Text(
            "Select Language",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).hintColor,
            ),
          ),
          items: items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ))
              .toList(),
          value: dropdownValue,
          onChanged: (value) async {
            didSelectItemHandler(value!);
          },
        ),
      );
}
