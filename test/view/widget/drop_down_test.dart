// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:git_hub/view/widget/drop_down.dart';
//
// void main() {
//   group("$DropDown", () {
//     const languages = <String>[
//       "Dart",
//       "Java",
//       "JavaScript",
//       "Kotlin",
//       "PHP",
//       "Python",
//       "Ruby",
//       "Swift",
//       "TypeScript",
//     ];
//
//     Widget createMaterialApp(Widget child) => MaterialApp(
//           home: Scaffold(
//             body: child,
//           ),
//         );
//
//     testWidgets("When no drop down item selected then show \"Select Language\"", (tester) async {
//       final dropdownWidget = createMaterialApp(
//         DropDown(
//             items: languages,
//             didSelect: ({
//               required String item,
//             }) {}),
//       );
//       await tester.pumpWidget(dropdownWidget);
//       expect(find.text("Select Language"), findsOneWidget);
//     });
//
//     testWidgets("When item selected then show the selected item", (tester) async {
//       final dropdownWidget = createMaterialApp(
//         DropDown(
//           items: languages,
//           didSelect: ({
//             required String item,
//           }) {},
//           dropdownValue: languages[0],
//         ),
//       );
//       await tester.pumpWidget(dropdownWidget);
//       expect(
//         find.byKey(ValueKey(languages[0])),
//         findsOneWidget,
//       );
//       expect(
//         find.text(languages[0]),
//         findsOneWidget,
//       );
//     });
//
//     testWidgets("When tap on dropdown then show the dropdown menu items", (tester) async {
//       final dropdownWidget = createMaterialApp(
//         DropDown(
//           items: languages,
//           didSelect: ({
//             required String item,
//           }) {},
//           key: const Key("dropdown"),
//         ),
//       );
//       await tester.pumpWidget(dropdownWidget);
//       final dropdown = find.byKey(
//         const ValueKey("dropdown"),
//       );
//       await tester.tap(dropdown);
//       for (final item in languages) {
//         expect(
//           find.text(item),
//           findsOneWidget,
//         );
//       }
//     });
//
//     testWidgets(
//         "When tap on dropdown menu item then pass the menu item in the "
//         "callback", (tester) async {
//       String? selectedItem;
//       void didSelect({required String item}) {
//         selectedItem = item;
//       }
//
//       final dropdownWidget = createMaterialApp(
//         DropDown(
//           items: languages,
//           didSelect: didSelect,
//           key: const Key("dropdown"),
//         ),
//       );
//       await tester.pumpWidget(dropdownWidget);
//       final dropdown = find.byKey(
//         const ValueKey("dropdown"),
//       );
//       for (final item in languages) {
//         await tester.tap(dropdown);
//         await tester.pump();
//         final menuItem = find.text(item).last;
//         await tester.tap(menuItem);
//         await tester.pumpAndSettle();
//         expect(
//           selectedItem,
//           item,
//         );
//       }
//     });
//   });
// }
