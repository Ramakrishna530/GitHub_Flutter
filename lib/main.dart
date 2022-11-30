import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/repositories_provider.dart';
import 'view/screens/repositories.dart';
import 'view/screens/repository_details.dart';

void main() {
  runApp(
    ListenableProvider<RepositoriesProvider>.value(
      value: RepositoriesProviderImpl(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink).copyWith(
            secondary: Colors.amber,
          ),
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: "Raleway",
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                  fontFamily: "RobotoCondensed",
                ),
                bodyText2: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                  fontFamily: "RobotoCondensed",
                ),
                headline6: const TextStyle(
                  fontSize: 20,
                  fontFamily: "RobotoCondensed",
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
        initialRoute: RepositoriesScreen.routeName,
        routes: {
          RepositoriesScreen.routeName: (context) => const RepositoriesScreen(),
          RepositoryDetails.routeName: (context) => const RepositoryDetails(),
        },
      );
}
