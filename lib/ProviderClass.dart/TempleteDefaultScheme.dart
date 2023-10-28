import 'package:flutter/material.dart';

class TempleteOfDefaultButton with ChangeNotifier {
  //! for Default button
  bool isClickDefButton = false;

  void changeIsClick(bool a) {
    isClickDefButton = a;
    notifyListeners();
  }
}
