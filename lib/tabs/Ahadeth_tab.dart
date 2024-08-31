import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/APP_colors.dart';
import 'package:islami/hadeth_model.dart';
import 'package:islami/hadeth_details_screen.dart';
import 'package:islami/provider/ahadeth_details_provider.dart';
import 'package:provider/provider.dart';

class AhadethTab extends StatefulWidget {
  AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
 @override

  // void initState() { // the first call in the app
  //   super.initState();
  //   loadHadethFile();
  // }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AhadethDetailsProvider()..loadHadethFile(),
      builder: (context, child) {
        var hadeth_provider_object = Provider.of<AhadethDetailsProvider>(context);
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
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
              child: Text(
                "Ahadeth",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Divider(
              height: 0.95,
            ),
            Expanded(
                child: ListView.separated(itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, HadethDetailsScreen.routeName,
                          arguments: HadethModel(hadeth_provider_object.allAhadeth[index].title
                              ,hadeth_provider_object. allAhadeth[index].content));
                      setState(() {

                      });
                    },
                    child: Text(hadeth_provider_object.allAhadeth[index].title,
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,),
                  );
                }, separatorBuilder: (context, index) {
                  return Divider(
                    thickness: 1,
                    endIndent: 70,
                    indent: 70,
                    height: 20,
                  );
                }, itemCount: hadeth_provider_object.allAhadeth.length)
            )
          ],

        );
      },

    );
  }


}
