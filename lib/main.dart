import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/Models/movies_model.dart';
import 'package:movie_app/Services/theme_data.dart';
import 'package:movie_app/UI/Views/details_page.dart';
import 'package:movie_app/UI/Views/home_view.dart';

import 'Models/movies.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: AppTheme().lightTheme,
      darkTheme: AppTheme().darkTheme,
      home: HomeView(),
    );
  }
}
