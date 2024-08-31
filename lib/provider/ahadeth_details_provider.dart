import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/hadeth_model.dart';

class AhadethDetailsProvider extends ChangeNotifier{
  List<HadethModel> allAhadeth=[];
  loadHadethFile (){
    rootBundle.loadString("assets/files/ahadeth.txt").then((Value){
      List<String> Ahadeth = Value.split("#");
      for(int i =0 ; i<Ahadeth.length ; i++){
        String hadeth = Ahadeth[i];
        List<String> hadethLines=hadeth.trim().split("\n");
        String title = hadethLines[0];
        hadethLines.removeAt(0);
        List<String> content=hadethLines;
        HadethModel model=HadethModel(title, content);
        allAhadeth.add(model);
      }
      notifyListeners();// inside then block because after load hadeth notifylistener
      // if outside it will excute before load hadeth
    });
  }
}