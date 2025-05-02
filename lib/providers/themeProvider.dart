import 'package:flutter/material.dart';
import 'package:weatherapp/providers/theme.dart';

class ThemeProvider with ChangeNotifier {
  bool _isSelected = false;

  bool get isSelected => _isSelected;

  ThemeData _themeData = lightmode;

  ThemeData get getTheme => _themeData;

  void toggleTheme() {
    _isSelected = !_isSelected;
    _themeData = _isSelected ? darkMode : lightmode;
    notifyListeners();
  }
}
