import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Sura_model.dart';


class SuraDetailsScreen extends StatelessWidget {
  static const String routeName="Sura Details";
  SuraDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
     var model=ModalRoute.of(context)?.settings.arguments as SuraModel;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/bg3.png"))
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(model.suraName,
          style: GoogleFonts.elMessiri(
              color: Color(0xff242424),
              fontSize: 30,
              fontWeight: FontWeight.w700
          ),),
        ),
      ),
    );
  }
  //loadSura
}
