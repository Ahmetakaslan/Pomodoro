import 'package:flutter/material.dart';

class ScoreCounter with ChangeNotifier {
  int scoreCounter = 0;

  void changeScoreCounter() {
    scoreCounter++;
    notifyListeners();
  }
}
