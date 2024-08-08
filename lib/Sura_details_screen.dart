import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/APP_colors.dart';
import 'package:islami/Sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "SuraDetails";
  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadSurafile(model.index);
    }
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/bg3.png"))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            size: 40,
          ),
          centerTitle: true,
          title: Text(
            "إسلامي",
            style: GoogleFonts.elMessiri(
                color: Color(0xff242424),
                fontSize: 30,
                fontWeight: FontWeight.w700),
          ),
        ),
        body: Card(
          color: AppColors.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          elevation: 25,
          shadowColor: AppColors.primary,
          margin: EdgeInsets.all(25),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Text(
                      model.name,
                      style: GoogleFonts.elMessiri(
                          color: Color(0xff242424),
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    ImageIcon(
                      AssetImage("assets/images/Icon awesome-play-circle.png"),
                      size: 50,
                    )
                  ]),
                ),
                Divider(
                  thickness: 1,
                  color: AppColors.primary,
                  endIndent: 20,
                  indent: 20,
                ),
                Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Text(
                            "${verses[index]} ",
                            style: GoogleFonts.elMessiri(
                                color: Color(0xff242424),
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                height: 3),
                            textAlign: TextAlign.center,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  thickness: 1,
                                  color: AppColors.primary,
                                  endIndent: 10,
                                  indent: 20,
                                ),
                              ),
                              Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                    //color: AppColors.primary,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: AppColors.primary, width: 2)),
                                child: Center(child: Text("${index + 1}")),
                              ),
                              Expanded(
                                child: Divider(
                                  thickness: 1,
                                  color: AppColors.primary,
                                  indent: 10,
                                  endIndent: 20,
                                ),
                              ),
                            ],
                          );
                        },
                        itemCount: verses.length))
              ],
            ),
          ),
        ),
      ),
    );
  }

  loadSurafile(int index) async {
    String sura = await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> suraLines = sura.split("\n");
    verses = suraLines;
    //print(suraLines);
    setState(() {});
  }
}
