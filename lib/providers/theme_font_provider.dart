import 'package:flutter/material.dart';
import '../models/theme_model.dart';

class ThemeFontProvider extends ChangeNotifier {
  TextStyle _selectedFontStyle =
      themes[0].fontStyle; // Default font style is from Theme A

  TextStyle get selectedFontStyle => _selectedFontStyle;

  void setFontStyle(TextStyle fontStyle) {
    _selectedFontStyle = fontStyle;
    notifyListeners();
  }
}
