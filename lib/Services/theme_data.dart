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
        primarySwatch: Colors.amber,
        appBarTheme: AppBarTheme(
            titleTextStyle: const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            actionsIconTheme: const IconThemeData(color: Colors.black),
            brightness: Brightness.dark,
            color: Colors.amber.shade300),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.black),
          labelStyle: TextStyle(color: Colors.black),
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
          color: Colors.amber,
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
