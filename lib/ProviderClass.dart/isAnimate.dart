import 'package:flutter/material.dart';

class IsAnimate with ChangeNotifier {
  //! for control animation
  bool isAnimateMain = true;

  //! for control other animation
  bool isAnimatePomodoroScore = true;

  //! it will keep how many Pomodoros you have.
  int numberOfPomodoro = 0;

  void changeMainisAnimate(bool isAnimate) {
    //!  situation of changeMainisAnimate will  change
    isAnimateMain = isAnimate;
    notifyListeners();
  }

  void changePomodoroisAnimate(bool isAnimate) {
    //! situation of changePomodoroisAnimate  will change
    isAnimatePomodoroScore = isAnimate;
    notifyListeners();
  }

  void counterPomodoro() {
    //! will increse numberOfPomodoro
    numberOfPomodoro++;
    notifyListeners();
  }
}
