import 'package:flutter/material.dart';

class ThemeModel {
  final String name;
  final ThemeData themeData;
  final TextStyle fontStyle;

  ThemeModel({
    required this.name,
    required this.themeData,
    required this.fontStyle,
  });
}

final themes = [
  ThemeModel(
    name: 'Theme Blue',
    themeData: ThemeData(
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: Colors.blue.shade50,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.blue, fontSize: 16),
        bodyMedium: TextStyle(color: Colors.blue, fontSize: 16),
      ),
    ),
    fontStyle: const TextStyle(
      fontFamily: 'Lato',
      fontSize: 20,
    ),
  ),
  ThemeModel(
    name: 'Theme Green',
    themeData: ThemeData(
      primarySwatch: Colors.green,
      scaffoldBackgroundColor: Colors.green.shade50,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.green, fontSize: 16),
        bodyMedium: TextStyle(color: Colors.green, fontSize: 16),
      ),
    ),
    fontStyle: const TextStyle(
      fontFamily: 'Ostrich',
      fontSize: 20,
    ),
  ),
  ThemeModel(
    name: 'Theme Purple',
    themeData: ThemeData(
      primarySwatch: Colors.purple,
      scaffoldBackgroundColor: Colors.purple.shade50,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.purple, fontSize: 16),
        bodyMedium: TextStyle(color: Colors.purple, fontSize: 16),
      ),
    ),
    fontStyle: const TextStyle(
      fontFamily: 'Pacifico',
      fontSize: 20,
    ),
  ),
];
