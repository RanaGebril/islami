import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/Sura_details_screen.dart';
import 'package:islami/Sura_model.dart';

import '../APP_colors.dart';

class QuranTab extends StatelessWidget {
  QuranTab({super.key});

  List<int> versesNumber = [7,286,200,176,120,165,206,75,129,109,123,111,43,52,99,128,111,110,98,135,112,78,118,64,77,227,93,88,
    69,60,34,30,73,54,45,83,182,88,75,85,54,53,89,59,37,35,38,29,18,45,60,49,62,55,78,96,29,22,24,13,14,11,11,18,12,12,30,52,52,
    44,28,28,20,56,40,31,50,40,46,42,29,19,36,25,22,17,19,26,30,20,15,21,11,8,5,19,5,8,8,11,11,8,3,9,5,4,6,3,6,3,5,4,5,6
  ];

  List <String> suraNames=["الفاتحه","البقرة","آل عمران","النساء","المائدة","الأنعام","الأعراف","الأنفال","التوبة","يونس","هود"
    ,"يوسف","الرعد","إبراهيم","الحجر","النحل","الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون"
    ,"النّور","الفرقان","الشعراء","النّمل","القصص","العنكبوت","الرّوم","لقمان","السجدة","الأحزاب","سبأ"
    ,"فاطر","يس","الصافات","ص","الزمر","غافر","فصّلت","الشورى","الزخرف","الدّخان","الجاثية","الأحقاف"
    ,"محمد","الفتح","الحجرات","ق","الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
    ,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك","القلم","الحاقة","المعارج"
    ,"نوح","الجن","المزّمّل","المدّثر","القيامة","الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار"
    ,"المطفّفين","الإنشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس","الليل","الضحى","الشرح"
    ,"التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة","التكاثر","العصر",
    "الهمزة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر","المسد","الإخلاص","الفلق","الناس"];


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("assets/images/quran_header_icn.png",
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
                padding: const EdgeInsets.symmetric(
                    vertical: 8.0, horizontal: 20),
                child: Row(
                  children: [
                    Text("Verses Number",
                      style: GoogleFonts.elMessiri(
                          fontSize: 25,
                          fontWeight: FontWeight.w600
                      ),),
                    Spacer(),
                    Text("Sura Name",
                      style: GoogleFonts.elMessiri(
                          fontSize: 25,
                          fontWeight: FontWeight.w600
                      ),)
                  ],
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
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, SuraDetailsScreen.routeName,
                              arguments: SuraModel(suraNames[index], index));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 50),
                          child: Row(
                            children: [
                              Text(versesNumber[index].toString(),
                                style: GoogleFonts.inter(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w400
                                ),),
                              Spacer(),
                              Text(suraNames[index],
                                style: GoogleFonts.inter(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w400
                                ),)
                            ],
                          ),
                        ),
                      );

                    },
                  itemCount: suraNames.length,
                  )
              ),
            ],
          ),
        ),
        Positioned(
          left: 205,
          bottom: 0,
          height: 477,
          child: Container(
            color: AppColors.primary,
            width: 3,
            height: 400,
          ),
        )
      ],
    );
  }
  }