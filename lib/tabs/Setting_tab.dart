import 'package:flutter/material.dart';
import 'package:islami/APP_colors.dart';
import 'package:islami/botttom_sheets/Theme_bottom_sheet.dart';
import 'package:islami/botttom_sheets/language_bottom_sheet.dart';
import 'package:islami/provider/my_provider.dart';
import 'package:provider/provider.dart';

class SettingTab extends StatelessWidget {
  const SettingTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider_object = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Theme",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                //isDismissible: false,
                isScrollControlled: true,
                builder: (context) {
                  return ThemeBottomSheet();
                },
              );
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: provider_object.APPTheme == ThemeMode.dark
                      ? AppColors.yellowColor
                      : AppColors.primary,
                  )),
              child: Text(
                  provider_object.APPTheme == ThemeMode.dark
                      ? "Dark"
                      : "Light",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color:  provider_object.APPTheme == ThemeMode.dark
                      ? AppColors.yellowColor
                      : AppColors.primary,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Language",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(context: context,
                  //isDismissible: false,
                  isScrollControlled: true,
                  builder: (context) {
                    return LanguageBottomSheet();
                  },);
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: provider_object.APPTheme == ThemeMode.dark
                        ? AppColors.yellowColor
                        : AppColors.primary,
                  )),
              child: Text(
                "Arabic",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color:  provider_object.APPTheme == ThemeMode.dark
                      ? AppColors.yellowColor
                      : AppColors.primary,
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}
