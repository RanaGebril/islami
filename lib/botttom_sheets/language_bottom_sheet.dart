import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami/provider/my_provider.dart';
import 'package:provider/provider.dart';
import '../APP_colors.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider_object = Provider.of<MyProvider>(context);
    return Container(
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
          color: provider_object.APPTheme == ThemeMode.dark
              ? AppColors.primary_dark
              : AppColors.whiteColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          border: Border.all(
            color: provider_object.APPTheme == ThemeMode.dark
                ? AppColors.yellowColor
                : AppColors.primary,
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              context.setLocale(Locale("en"));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('english'.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(
                    color: (context.locale == Locale("en"))
                        ? (provider_object.APPTheme == ThemeMode.dark)
                        ? AppColors.yellowColor
                        : AppColors.primary
                        : (provider_object.APPTheme == ThemeMode.light)
                        ? AppColors.blackColor
                        : AppColors.whiteColor,
                  ),),
                context.locale == Locale("en")
                    ? Icon(
                        Icons.done,
                        color: provider_object.APPTheme == ThemeMode.dark
                            ? AppColors.yellowColor
                            : AppColors.primary,
                        size: 40,
                      )
                    : SizedBox()
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              context.setLocale(Locale('ar'));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('arabic'.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(
                    color: (context.locale == Locale("ar"))
                        ? (provider_object.APPTheme == ThemeMode.dark)
                        ? AppColors.yellowColor
                        : AppColors.primary
                        : (provider_object.APPTheme == ThemeMode.light)
                        ? AppColors.blackColor
                        : AppColors.whiteColor,
                  ),),
                context.locale == Locale("ar")
                    ? Icon(
                  Icons.done,
                  color: provider_object.APPTheme == ThemeMode.dark
                      ? AppColors.yellowColor
                      : AppColors.primary,
                  size: 40,
                )
                    : SizedBox()
              ],
            ),
          )
        ],
      ),
    );
  }
}
