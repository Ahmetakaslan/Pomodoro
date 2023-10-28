import 'package:flutter/material.dart';

class StartAndStopButons with ChangeNotifier {
  bool isClickStartButton = false;
  bool isClickStopButton = false;

  void changeisStartButton(bool a) {
    isClickStartButton = a;
    notifyListeners();
  }

  void changeisStopButton(bool a) {
    isClickStopButton = a;
    notifyListeners();
  } 
}
