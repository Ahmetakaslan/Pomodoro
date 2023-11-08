import 'package:flutter/material.dart';

class TempleteOfCoostumButton with ChangeNotifier {
  bool isClickCostumButton = false;

  void changeCostumButton(bool a) {
    isClickCostumButton = a;
   
    notifyListeners();
  }
}
