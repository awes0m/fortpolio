import 'package:flutter/material.dart';

CustomTheme currentTheme = CustomTheme();

class CustomTheme extends ChangeNotifier {
  bool isDarkTheme = true;
  ThemeMode get currentTheme => isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }
}
