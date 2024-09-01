import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SebhaProvider extends ChangeNotifier {
  double angle = 0;
  int counter = 0;
  int index = 0;

  List<String> tasbeh = ["سبحان الله", "الحمد لله", "لا إله إلا الله", "الله أكبر"];

  SebhaProvider() {
    loadCounter();  // Load the counter value when the provider is initialized
  }

  onTapFunction() {
    angle += 360 / 5;
    if (counter == 33) {
      counter = 0;
      index++;
    } else {
      counter++;
    }

    if (index == tasbeh.length) {
      index = 0;
    }


    saveCounter();  //  Save the updated counter value
    notifyListeners();
  }

  Future<void> saveCounter() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('sebha_counter', counter);
    await prefs.setInt('sebha_index', index);
  }

  Future<void> loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    counter = prefs.getInt('sebha_counter') ?? 0;
    index = prefs.getInt('sebha_index') ?? 0; // Load the counter value, default to 0 if not found
    notifyListeners();  // Notify listeners after loading the value
  }
}
