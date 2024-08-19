import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/APP_colors.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
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
                ImageIcon(AssetImage("assets/images/previous.png"),color: AppColors.primary),
                ImageIcon(AssetImage("assets/images/play.png"),color: AppColors.primary,size: 36),
                ImageIcon(AssetImage("assets/images/next.png"),color: AppColors.primary)
              ],
            ),
          )
          
        ],
      ),
    );
  }
}
