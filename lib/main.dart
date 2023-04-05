import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'UI/Views/home.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appTitle = 'Movie App';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      home: HomePage(title: appTitle),
    );
  }
}
