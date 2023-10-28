import 'package:flutter/material.dart';

class TempleteOfCoostumBUtton with ChangeNotifier {
  bool isClickCostumButton = false;

  void changeCostumButton(bool a) {
    isClickCostumButton = a;
   
    notifyListeners();
  }
}
