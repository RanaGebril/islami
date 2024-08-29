import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';
import 'package:islami/APP_colors.dart';
import 'package:islami/provider/my_provider.dart';
import 'package:provider/provider.dart';
class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double angle=0;
  int counter=0;
  int index=0;
  List<String>tasbeh=["سبحان الله","الحمد لله","لا إله إلا الله","الله أكبر"];
  @override
  Widget build(BuildContext context) {
    var provider_object = Provider.of<MyProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
        Image.asset(provider_object.APPTheme==ThemeMode.dark
            ?"assets/images/head of seb7a dark.png"
            :"assets/images/head of seb7a.png"),
            Padding(
              padding: const EdgeInsets.only(top: 37),
              child: Transform.rotate(
                angle: angle,
                child: GestureDetector(child: Image.asset(provider_object.APPTheme==ThemeMode.dark
                    ?"assets/images/body of seb7a dark.png"
                    :"assets/images/body of seb7a.png",height: 310,),
                onTap: () {
                onTapFunction();

                },
              ),
              ),
            )
          ],
        ),
        Text("عدد التسبيحات",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
         fontWeight: FontWeight.w600,
        ),
          textAlign: TextAlign.center,
        ),
        Center(
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(5),
            width: 70,
            height: 80,
            decoration: BoxDecoration(
              color: provider_object.APPTheme==ThemeMode.dark
                  ?AppColors.primary_dark
                  :AppColors.primary,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(counter.toString(),
            style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
        Center(
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(15),
            width: 150,
            height: 80,
            decoration: BoxDecoration(
              color: provider_object.APPTheme==ThemeMode.dark
                  ?AppColors.yellowColor
                  :AppColors.primary,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(tasbeh[index],
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: provider_object.APPTheme==ThemeMode.dark
              ?AppColors.blackColor
              :AppColors.whiteColor
        )
            ),
          ),
        ),


      ],
    );
  }
  onTapFunction(){
    angle += 360/5;
    if(counter==33){
      counter=0;
      index++;
    }
    else{
      counter++;
    }
    if(index==tasbeh.length){
      index=0;
    }
    setState(() {

    });
  }
}
