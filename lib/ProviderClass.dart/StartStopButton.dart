import 'package:flutter/material.dart';

class StartAndStopButons with ChangeNotifier {
  bool isClickStartButton = false;
  bool isClickStopButton = false;
  bool isClickStartButtonBreak=false;
  bool isClickStopButtonBreak=false;

  void changeisStartButton(bool a) {
    isClickStartButton = a;
    notifyListeners();
  }
    void changeisStartButtonBreak(bool a) {
    isClickStartButtonBreak = a;
    notifyListeners();
  }


  void changeisStopButton(bool a) {
    isClickStopButton = a;
    notifyListeners();
  } 
  
  void changeisStopButtonBreak(bool a) {
    isClickStopButtonBreak = a;
    notifyListeners();
  } 
}
