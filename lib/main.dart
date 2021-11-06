import 'package:flutter/material.dart';
import 'package:movie_app/Models/movies_model.dart';
import 'package:movie_app/Services/theme_data.dart';
import 'package:movie_app/UI/Views/home_view.dart';
import 'package:provider/provider.dart';

import 'Models/movies.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Movies())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie App',
        theme: AppTheme().lightTheme,
        darkTheme: AppTheme().darkTheme,
        home: HomeView(),
      ),
    );
  }
}
