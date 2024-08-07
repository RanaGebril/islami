import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/APP_colors.dart';
import 'package:islami/tabs/Ahadeth_tab.dart';
import 'package:islami/tabs/Quran_tab.dart';
import 'package:islami/tabs/Radio_tab.dart';
import 'package:islami/tabs/Sebha_tab.dart';
import 'package:islami/tabs/Setting_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName="home";
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/bg3.png"),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text("إسلامي",
              style: GoogleFonts.elMessiri(
                  color: Color(0xff242424),
                  fontSize: 30,
                  fontWeight: FontWeight.w700
              ),),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppColors.primary,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.white,
              currentIndex: selectedIndex,
              onTap: (index) {
              selectedIndex=index;
              setState(() {
              });
              },
              items: [
            BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/moshaf_blue.png")),label: "Moshaf"),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/sebha.png")),label: "Sebha"),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/radio.png")),label: "Radio"),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/Ahadeth.png")),label: "Ahadeth"),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Setting"),
          ]),
          body: tabs[selectedIndex],
        )
      ],
    );
  }

  List<Widget>tabs=[
    QuranTab(),
    SebhaTab(),
    RadioTab(),
    AhadethTab(),
    SettingTab(),
  ];
}
