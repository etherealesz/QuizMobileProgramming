import 'package:flutter/material.dart';
import '../models/theme_model.dart';

class ThemeColorProvider extends ChangeNotifier {
  ThemeModel _selectedTheme = themes[0]; // Default theme is Theme A

  ThemeModel get selectedTheme => _selectedTheme;

  void setTheme(ThemeModel theme) {
    _selectedTheme = theme;
    notifyListeners();
  }
}
