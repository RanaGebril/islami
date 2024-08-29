import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/APP_colors.dart';
import 'package:islami/provider/my_provider.dart';
import 'package:islami/tabs/Ahadeth_tab.dart';
import 'package:islami/tabs/Quran_tab.dart';
import 'package:islami/tabs/Radio_tab.dart';
import 'package:islami/tabs/Sebha_tab.dart';
import 'package:islami/tabs/Setting_tab.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var provider_object = Provider.of<MyProvider>(context);
    return Stack(
      children: [
        Image.asset(provider_object.APPTheme == ThemeMode.dark?
        "assets/images/home_dark_background.png"
        :"assets/images/bg3.png"
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Islami"),
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon:
                        ImageIcon(AssetImage("assets/images/moshaf_blue.png")),
                    label: "Moshaf"),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/sebha.png")),
                    label: "Sebha"),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/radio.png")),
                    label: "Radio"),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/Ahadeth.png")),
                    label: "Ahadeth"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: "Setting"),
              ]),
          body: tabs[selectedIndex],
        )
      ],
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    SebhaTab(),
    RadioTab(),
    AhadethTab(),
    SettingTab(),
  ];
}
