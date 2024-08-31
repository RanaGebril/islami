import 'package:flutter/material.dart';
import 'package:islami/APP_colors.dart';
import 'package:islami/provider/my_provider.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider_object = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset("assets/images/radio_header.png"),
          SizedBox(
            height: 40,
          ),
          Text("إذاعة القرآن الكريم",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
         SizedBox(
           height: 70,
         ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ImageIcon(AssetImage("assets/images/previous.png"),
                    color: provider_object.APPTheme == ThemeMode.dark
                        ? AppColors.yellowColor
                        : AppColors.primary,),
                ImageIcon(AssetImage("assets/images/play.png"),
                    color: provider_object.APPTheme == ThemeMode.dark
                        ? AppColors.yellowColor
                        : AppColors.primary
                    ,size: 35),
                ImageIcon(AssetImage("assets/images/next.png"),
                    color: provider_object.APPTheme == ThemeMode.dark
                        ? AppColors.yellowColor
                        : AppColors.primary,)
              ],
            ),
          )
          
        ],
      ),
    );
  }
}
