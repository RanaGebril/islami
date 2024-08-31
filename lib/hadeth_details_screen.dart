import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami/APP_colors.dart';
import 'package:islami/hadeth_model.dart';
import 'package:islami/provider/my_provider.dart';
import 'package:provider/provider.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName="hadethDetails";
  const HadethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider_object = Provider.of<MyProvider>(context);
    var hadeth_model = ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(provider_object.APPTheme == ThemeMode.dark
              ? "assets/images/home_dark_background.png"
              :"assets/images/bg3.png"))),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'appBarTittle'.tr(),
          ),
        ),
        body: Card(
          color:  provider_object.APPTheme==ThemeMode.dark
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
                  Text(
                    hadeth_model.title,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                Divider(
                  thickness: 1,
                  color:  provider_object.APPTheme==ThemeMode.dark
                      ?AppColors.yellowColor
                      :AppColors.primary,
                  endIndent: 20,
                  indent: 20,
                ),
                Expanded(
                    child: ListView.builder(itemBuilder: (context, index) {
                      return Text(hadeth_model.content[index],
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 23,
                          height: 2,
                        ),
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
