import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/Home.dart';
import 'package:islami/Sura_details_screen.dart';
import 'package:islami/hadeth_details_screen.dart';
import 'package:islami/my_theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyThemeData.light_theme,
      darkTheme: MyThemeData.dark_theme,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName:(context)=>HomeScreen(),
        SuraDetailsScreen.routeName:(context)=>SuraDetailsScreen(),
        HadethDetailsScreen.routeName:(context)=>HadethDetailsScreen()

      },

    );
  }
}
