import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:git_hub/view/widget/drop_down.dart';

import '../../helpers/store_setup.dart';

void main() {
  group("$DropDown", () {
    const languages = <String>[
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
    const language = "Dart";

    testWidgets("When item selected then show the selected item", (tester) async {
      final dropdownWidget = createMaterialApp(
        child: const DropDown(
          items: languages,
          dropdownValue: language,
        ),
      );
      await tester.pumpWidget(dropdownWidget);
      expect(
        find.byKey(ValueKey(languages[0])),
        findsOneWidget,
      );
      expect(
        find.text(languages[0]),
        findsOneWidget,
      );
    });

    testWidgets("When tap on dropdown then show the dropdown menu items", (tester) async {
      final dropdownWidget = createMaterialApp(
        child: const DropDown(
          items: languages,
          dropdownValue: language,
          key: Key("dropdown"),
        ),
      );
      await tester.pumpWidget(dropdownWidget);
      final dropdown = find.byKey(
        const ValueKey("dropdown"),
      );
      await tester.tap(dropdown);
      for (final item in languages) {
        expect(
          find.text(item),
          findsOneWidget,
        );
      }
    });
  });
}
