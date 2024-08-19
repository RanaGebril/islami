import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          style: GoogleFonts.elMessiri(
            fontWeight: FontWeight.w600,
            fontSize: 25
          ),),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ImageIcon(AssetImage("assets/images/previous.png")),
              ImageIcon(AssetImage("assets/images/play.png")),
              ImageIcon(AssetImage("assets/images/next.png"))
            ],
          )
          
        ],
      ),
    );
  }
}
