import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/APP_colors.dart';


class MyThemeData{
  static ThemeData light_theme= ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(
          size: 40,
          color: AppColors.blackColor
        ),
        titleTextStyle:  GoogleFonts.elMessiri(
            color: Color(0xff242424),
            fontSize: 30,
            fontWeight: FontWeight.w700),

      ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
     backgroundColor: AppColors.primary,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
    ),
    dividerTheme: DividerThemeData(
      thickness: 3,
       color: AppColors.primary,
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.elMessiri(
          color: AppColors.blackColor,
          fontSize: 30,
          fontWeight: FontWeight.w700),
      bodyMedium: GoogleFonts.elMessiri(
          color: AppColors.blackColor,
          fontSize: 25,
          fontWeight: FontWeight.w600),
      bodySmall: GoogleFonts.elMessiri(
          color: AppColors.blackColor,
          fontSize: 25,
          fontWeight: FontWeight.w400),
    )




  );

  static ThemeData dark_theme= ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        //elevation: 0,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(
          size: 40,
        ),
        titleTextStyle:  GoogleFonts.elMessiri(
            color: Color(0xff242424),
            fontSize: 30,
            fontWeight: FontWeight.w700),

      )

  );

}