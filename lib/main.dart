import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/Home.dart';
import 'package:islami/Sura_details_screen.dart';
import 'package:islami/hadeth_details_screen.dart';
import 'package:islami/my_theme_data.dart';
import 'package:islami/provider/my_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider
    (
    create: (context) => MyProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider_object = Provider.of<MyProvider>(context);
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      themeMode:provider_object.APPTheme,
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
