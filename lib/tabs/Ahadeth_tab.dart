import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/APP_colors.dart';
import 'package:islami/hadeth_model.dart';
import 'package:islami/hadeth_details_screen.dart';

class AhadethTab extends StatefulWidget {
  AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadethModel> allAhadeth=[];
 @override

  void initState() { // the first call in the app
    super.initState();
    loadHadethFile();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:CrossAxisAlignment.center ,
      children: [
        Image.asset("assets/images/hadith_header.png",
        height: 227,),
        SizedBox(
          height: 10,
        ),
        Divider(
          height: 0.95,
          thickness: 3,
          color: AppColors.primary,
        ),
        Padding(
          padding:
          const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
          child: Text(
            "Ahadeth",
            style: GoogleFonts.elMessiri(
                fontSize: 25, fontWeight: FontWeight.w600),
          ),
        ),
        Divider(
          height: 0.95,
          thickness: 3,
          color: AppColors.primary,
        ),
        Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, HadethDetailsScreen.routeName,
                      arguments: HadethModel(allAhadeth[index].title, allAhadeth[index].content));
                      setState(() {

                      });
                    },
                    child: Text(allAhadeth[index].title,
                      style: GoogleFonts.elMessiri(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                        height: 2
                      ),
                    textAlign: TextAlign.center,),
                  );
                },
            itemCount: allAhadeth.length,))
      ],

    );
  }

  loadHadethFile (){
     rootBundle.loadString("assets/files/ahadeth.txt").then((Value){
      List<String> Ahadeth = Value.split("#");
      for(int i =0 ; i<Ahadeth.length ; i++){
        String hadeth = Ahadeth[i];
        List<String> hadethLines=hadeth.trim().split("\n");
        String title = hadethLines[0];
        hadethLines.removeAt(0);
        List<String> content=hadethLines;
        HadethModel model=HadethModel(title, content);
        allAhadeth.add(model);
      }
setState(() {

});
     });
  }
}
