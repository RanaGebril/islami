import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier {
  ThemeMode APPTheme = ThemeMode.light;

  //this method asynchronously loads the theme preference from SharedPreferences.
  getTheme ()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? darkMode = prefs.getBool('isDark'); //
    if(darkMode != null){
      if(darkMode){
        APPTheme = ThemeMode.dark;
      }
      else{
        APPTheme = ThemeMode.light;
      }
    }

  }

  changeTheme(ThemeMode themeMode) async{
    APPTheme = themeMode;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', APPTheme== ThemeMode.dark);//stores the new theme preference in SharedPreferences:
    notifyListeners();
  }
}
