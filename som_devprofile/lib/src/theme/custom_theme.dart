import 'package:flutter/material.dart';

class CustomTheme extends ChangeNotifier {
  bool isDarkTheme = true;
  ThemeMode get currentTheme => isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      hoverColor: const Color(0xFF1a4b6e).withOpacity(0.225),
      cardColor: const Color(0xFF519259),
      primaryColor: const Color(0xFF064635),
      primaryColorDark: Colors.white54,
      primaryColorLight: Colors.black,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: const Color.fromARGB(255, 11, 39, 32),
      hoverColor: const Color(0xFF02bbe5),
      cardColor: const Color.fromARGB(255, 127, 134, 18),
      primaryColor: const Color(0xFF02bbe5),
      primaryColorDark: const Color(0xFF6c7582),
      primaryColorLight: const Color.fromRGBO(243, 239, 204, 1),
    );
  }
}
