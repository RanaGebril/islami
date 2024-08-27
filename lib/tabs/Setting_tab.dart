import 'package:flutter/material.dart';
import 'package:islami/APP_colors.dart';
import 'package:islami/botttom_sheets/Theme_bottom_sheet.dart';
import 'package:islami/botttom_sheets/language_bottom_sheet.dart';

class SettingTab extends StatelessWidget {
  const SettingTab({super.key});

  @override
  Widget build(BuildContext context) {
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
                    color: AppColors.yellowColor,
                  )),
              child: Text(
                "dark",
                style: Theme.of(context).textTheme.bodyMedium,
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
                    color: AppColors.yellowColor,
                  )),
              child: Text(
                "Arabic",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          )
        ],
      ),
    );
  }
}
