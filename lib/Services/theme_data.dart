// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
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
        textSelectionColor: Colors.black,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(5),
              backgroundColor: MaterialStateProperty.all(Colors.red),
              foregroundColor: MaterialStateProperty.all(Colors.black),
              textStyle: MaterialStateProperty.all(
                  const TextStyle(fontWeight: FontWeight.bold))),
        ),
        textTheme: const TextTheme(
            headline6: TextStyle(color: Colors.black),
            caption: TextStyle(
              color: Colors.black,
            ),
            subtitle1: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
        primarySwatch: Colors.cyan,
        appBarTheme: AppBarTheme(
            titleTextStyle: const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            actionsIconTheme: const IconThemeData(color: Colors.black),
            brightness: Brightness.dark,
            color: Colors.cyan.shade300),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.black),
          labelStyle: TextStyle(color: Colors.black),
        ),
        brightness: Brightness.dark,
        canvasColor: Colors.cyan,
        accentColor: Colors.cyanAccent,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.cyan.shade300),
        accentIconTheme: const IconThemeData(color: Colors.cyan),
      );

  ThemeData get lightTheme => ThemeData(
        textSelectionColor: Colors.black,
        primarySwatch: Colors.cyan,
        textTheme: const TextTheme(
            caption: TextStyle(
              color: Colors.white,
            ),
            subtitle1: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          brightness: Brightness.light,
          color: Colors.cyan,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.grey),
          labelStyle: TextStyle(color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(5),
            backgroundColor: MaterialStateProperty.all(Colors.red.shade300),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
        canvasColor: Colors.cyan.shade200,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.cyan),
        brightness: Brightness.light,
        accentColor: Colors.cyanAccent,
        accentIconTheme: const IconThemeData(color: Colors.black),
      );
}
