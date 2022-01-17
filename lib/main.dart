import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/Services/theme_data.dart';
import 'package:movie_app/UI/Views/home_view.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static GlobalKey animationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var appTitle = 'Movie App';
    return MaterialApp(
      key: MyApp.animationKey,
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: AppTheme().lightTheme,
      darkTheme: AppTheme().darkTheme,
      home: HomeView(
        data: appTitle,
      ),
    );
  }
}
