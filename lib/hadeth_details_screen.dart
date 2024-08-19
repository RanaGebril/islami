import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/APP_colors.dart';
import 'package:islami/hadeth_model.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName="hadethDetails";
  const HadethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var hadeth_model = ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/bg3.png"))),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "إسلامي",
          ),
        ),
        body: Card(
          color: Color(0xfff8f8f8),
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
                  Text(
                    hadeth_model.title,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: AppColors.primary,
                  endIndent: 20,
                  indent: 20,
                ),
                Expanded(
                    child: ListView.builder(itemBuilder: (context, index) {
                      return Text(hadeth_model.content[index],
                        style: GoogleFonts.elMessiri(
                            color: Color(0xff242424),
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            height: 2),
                        textAlign: TextAlign.center,
                      );
                    },
                    itemCount: hadeth_model.content.length,)
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
