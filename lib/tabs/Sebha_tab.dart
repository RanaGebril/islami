import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';
import 'package:islami/APP_colors.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
        Image.asset("assets/images/head of seb7a.png"),
            Padding(
              padding: const EdgeInsets.only(top: 37),
              child: Transform.rotate(
                angle: angle,
                child: GestureDetector(child: Image.asset("assets/images/body of seb7a.png"),
                onTap: () {
                onTapFunction();

                },
              ),
              ),
            )
          ],
        ),
        Text("عدد التسبيحات",
          style: GoogleFonts.elMessiri(
          fontSize: 30,
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
              color: Color(0xffB7935F),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(counter.toString(),
              style: GoogleFonts.inter(
              fontSize: 30,
              fontWeight: FontWeight.w400,
              )
            ),
          ),
        ),
        Center(
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(5),
            width: 200,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(tasbeh[index],
                style: GoogleFonts.elMessiri(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondary
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
