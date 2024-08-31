import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
            title: Text(
                'appBarTittle'.tr()
            ),
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
                    label: 'quranTab'.tr()),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/sebha.png")),
                    label: 'sebhaTab'.tr()),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/radio.png")),
                    label: 'radioTab'.tr()),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/Ahadeth.png")),
                    label: 'ahadethTab'.tr()),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: 'settingTab'.tr()),
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
