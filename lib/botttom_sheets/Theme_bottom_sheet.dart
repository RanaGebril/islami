import 'package:flutter/material.dart';
import 'package:islami/provider/my_provider.dart';
import 'package:provider/provider.dart';
import '../APP_colors.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider_object = Provider.of<MyProvider>(context);
    return Container(
      padding: EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
          color: provider_object.APPTheme == ThemeMode.dark
              ? AppColors.primary_dark
              : AppColors.whiteColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          border: Border.all(color: provider_object.APPTheme == ThemeMode.dark
              ? AppColors.yellowColor
              : AppColors.primary,
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              provider_object.changeTheme(ThemeMode.light);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Light",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: provider_object.APPTheme == ThemeMode.dark
                        ? AppColors.whiteColor
                        : AppColors.primary,)),
                provider_object.APPTheme == ThemeMode.dark
                ?SizedBox()
                : Icon(
                  Icons.done,
                  color: AppColors.primary,
                  size: 40,
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              provider_object.changeTheme(ThemeMode.dark);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Dark",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: provider_object.APPTheme == ThemeMode.dark
                            ? AppColors.yellowColor
                            : AppColors.blackColor)),
                provider_object.APPTheme == ThemeMode.dark
                    ?Icon(
                  Icons.done,
                  color: AppColors.yellowColor,
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
