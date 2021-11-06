// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeMode _themeMode;

  ThemeNotifier(this._themeMode);

  ThemeMode getThemeMode() => _themeMode;

  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    notifyListeners();
  }
}

// ignore: avoid_classes_with_only_static_members
class AppTheme {
  ThemeData get darkTheme => ThemeData(
        textSelectionColor: Colors.white,
        primarySwatch: Colors.amber,
        appBarTheme: AppBarTheme(
            actionsIconTheme: IconThemeData(color: Colors.amber),
            brightness: Brightness.dark,
            color: Colors.amber.shade300),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.grey),
          labelStyle: TextStyle(color: Colors.white),
        ),
        brightness: Brightness.dark,
        canvasColor: Colors.amber,
        accentColor: Colors.amberAccent,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.amber.shade300),
        accentIconTheme: const IconThemeData(color: Colors.amber),
      );

  ThemeData get lightTheme => ThemeData(
        textSelectionColor: Colors.black,
        primarySwatch: Colors.amber,
        appBarTheme: const AppBarTheme(
          brightness: Brightness.light,
          color: Colors.amber,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.grey),
          labelStyle: TextStyle(color: Colors.white),
        ),
        canvasColor: Colors.amber.shade200,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.amber),
        brightness: Brightness.light,
        accentColor: Colors.amberAccent,
        accentIconTheme: const IconThemeData(color: Colors.black),
      );
}
