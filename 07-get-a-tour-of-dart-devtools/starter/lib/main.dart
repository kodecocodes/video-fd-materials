import 'package:flutter/material.dart';

import 'controllers/doggie_provider.dart';
import 'screens/dog_screen.dart';

void main() {
  runApp(
    DoggieProvider(
      child: const BuggieBoiApp(),
    ),
  );
}

class BuggieBoiApp extends StatelessWidget {
  const BuggieBoiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.green,
      ),
      home: const DogScreen(),
    );
  }
}
