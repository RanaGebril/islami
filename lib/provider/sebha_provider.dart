import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

class SebhaProvider extends ChangeNotifier{
  double angle=0;
  int counter=0;
  int index=0;
  List<String>tasbeh=["سبحان الله","الحمد لله","لا إله إلا الله","الله أكبر"];
  onTapFunction(){
    angle += 360/5;
    if(counter==33){
      counter=0;
      index++;
    }
    else{
      counter++;
    }
    if(index==tasbeh.length){
      index=0;
    }
  }
  notifyListeners();
}