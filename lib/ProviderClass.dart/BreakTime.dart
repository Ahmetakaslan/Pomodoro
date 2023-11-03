import 'package:flutter/material.dart';

class BreakTime with ChangeNotifier {
  bool isTimeToBreak = false;
  bool is10 = false;
  bool is15 = false;
  bool is20 = false;

  void changeis10(bool a) {
    is10 = a;
    is15 = !a;
    is20 = !a;
    notifyListeners();
  }

  void changeis15(bool a) {
    is10 = !a;
    is15 = a;
    is20 = !a;
    notifyListeners();
  }

  void changeis20(bool a) {
    is10 = !a;
    is15 = !a;
    is20 = a;
    notifyListeners();
  }

  void changeisTimeToBreak(bool a) {
    isTimeToBreak = a;
    notifyListeners();
  }
}
