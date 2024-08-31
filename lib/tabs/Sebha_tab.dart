import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami/APP_colors.dart';
import 'package:islami/provider/my_provider.dart';
import 'package:islami/provider/sebha_provider.dart';
import 'package:provider/provider.dart';
class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  @override
  Widget build(BuildContext context) {
    var provider_object = Provider.of<MyProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => SebhaProvider(),
      builder: (context, child) {
        var sebha_provider_object = Provider.of<SebhaProvider>(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(provider_object.APPTheme==ThemeMode.dark
                    ?"assets/images/head of seb7a dark.png"
                    :"assets/images/head of seb7a.png"),
                Padding(
                  padding: const EdgeInsets.only(top: 37),
                  child: Transform.rotate(
                    angle: sebha_provider_object.angle,
                    child: GestureDetector(child: Image.asset(provider_object.APPTheme==ThemeMode.dark
                        ?"assets/images/body of seb7a dark.png"
                        :"assets/images/body of seb7a.png",height: 310,),
                      onTap: () {
                        sebha_provider_object.onTapFunction();
                        // setState(() {
                        //
                        // });
                      },
                    ),
                  ),
                )
              ],
            ),
            Text('tasbehNumber'.tr(),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            Center(
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(5),
                width: 70,
                height: 80,
                decoration: BoxDecoration(
                  color: provider_object.APPTheme==ThemeMode.dark
                      ?AppColors.primary_dark
                      :AppColors.primary,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(sebha_provider_object.counter.toString(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            Center(
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(15),
                width: 150,
                height: 80,
                decoration: BoxDecoration(
                  color: provider_object.APPTheme==ThemeMode.dark
                      ?AppColors.yellowColor
                      :AppColors.primary,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(sebha_provider_object.tasbeh[sebha_provider_object.index],
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: provider_object.APPTheme==ThemeMode.dark
                            ?AppColors.blackColor
                            :AppColors.whiteColor
                    )
                ),
              ),
            ),


          ],
        );
      },
    );
  }
}
