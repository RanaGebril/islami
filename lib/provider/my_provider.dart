import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  ThemeMode APPTheme = ThemeMode.light;
  changeTheme(ThemeMode themeMode) {
    APPTheme = themeMode;
    notifyListeners();
  }
}
