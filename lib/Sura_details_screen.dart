import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/APP_colors.dart';
import 'package:islami/Sura_model.dart';
import 'package:islami/provider/my_provider.dart';
import 'package:islami/provider/sura_details_provider.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatelessWidget {
  static const String routeName = "SuraDetails";
  SuraDetailsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    var provider_object = Provider.of<MyProvider>(context);
    var model = ModalRoute.of(context)?.settings.arguments as SuraModel;

    return ChangeNotifierProvider(
      create: (context) => SuraDetailsProvider(),//..loadSuraFile  ==> can access suraprovider only call the function ome time
      builder: (context, child) {
        var sura_provider_object = Provider.of<SuraDetailsProvider>(context);
    if (sura_provider_object.verses.isEmpty) {
      //to inforce calling set state and rebuild in finite loop
      sura_provider_object.loadSurafile(model.index);
    }
        return Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(
                  provider_object.APPTheme == ThemeMode.dark
                      ? "assets/images/home_dark_background.png"
                  :"assets/images/bg3.png"))),
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                "إسلامي",
              ),
            ),
            body: Card(
              color: provider_object.APPTheme==ThemeMode.dark
                  ?AppColors.primary_dark
                  :AppColors.whiteColor,
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
                            style: Theme.of(context).textTheme.bodyLarge
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        ImageIcon(
                          AssetImage("assets/images/Icon awesome-play-circle.png"),
                          size: 50,
                          color: provider_object.APPTheme==ThemeMode.dark
                              ?AppColors.whiteColor
                              :AppColors.blackColor,
                        )
                      ]),
                    ),
                    Divider(
                      endIndent: 20,
                      indent: 20,
                      thickness: 1,
                      color: provider_object.APPTheme==ThemeMode.dark
                          ?AppColors.yellowColor
                          :AppColors.primary,
                    ),
                    Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return Text(
                                "${sura_provider_object.verses[index]} ",
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontSize: 20,
                                    height: 3,
                                ),
                                textAlign: TextAlign.center,
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Row(
                                children: [
                                  Expanded(
                                    child: Divider(
                                      color: provider_object.APPTheme==ThemeMode.dark
                                          ?AppColors.yellowColor
                                          :AppColors.primary,
                                      thickness: 1,
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
                                            color: provider_object.APPTheme==ThemeMode.dark
                                                ?AppColors.yellowColor
                                                :AppColors.primary
                                            , width: 2)),
                                    child: Center(child: Text("${index + 1}",
                                      style: GoogleFonts.elMessiri(
                                          color: provider_object.APPTheme==ThemeMode.dark
                                              ?AppColors.whiteColor
                                              :AppColors.blackColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600
                                      ),)),
                                  ),
                                  Expanded(
                                    child: Divider(
                                      thickness: 1,
                                      indent: 10,
                                      endIndent: 20,
                                      color: provider_object.APPTheme==ThemeMode.dark
                                          ?AppColors.yellowColor
                                          :AppColors.primary,
                                    ),
                                  ),
                                ],
                              );
                            },
                            itemCount: sura_provider_object.verses.length))
                  ],
                ),
              ),
            ),
          ),
        );
      },

    );
  }
}
