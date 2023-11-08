import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:day_night_time_picker/lib/state/time.dart';

import 'package:flutter/material.dart';
import 'package:pomodoro/Dbclass/pomodoro.dart';
import 'package:pomodoro/Dbclass/pomodoroDao.dart';
import 'package:pomodoro/ProviderClass.dart/ScoreCounter.dart';
import 'package:pomodoro/ProviderClass.dart/StartStopButton.dart';
import 'package:pomodoro/ProviderClass.dart/SharedPrefernces.dart';
import 'package:pomodoro/constants/constants.dart';
import 'package:pomodoro/widgets/Animation.dart';
import 'package:pomodoro/widgets/ShowCardForBreak.dart';
import 'package:provider/provider.dart';

class TimerClass with ChangeNotifier {
  AudioPlayer audioPlayer = AudioPlayer();

  Timer? timer;
  //! burada düzenleme yapılacaj 29.10.2023
  late Time defaultTime = Time(
      hour: sharedPreferences!.getInt("hour") ?? 0,
      minute: sharedPreferences!.getInt("minute") ?? 25,
      second: sharedPreferences!.getInt("second") ?? 0);

  Time changableTime = Time(hour: 0, minute: 30, second: 0);

  void setDefaultTime(BuildContext context) {
    var provider = Provider.of<TimePicker>(context);
    // ignore: unnecessary_null_comparison
    if (provider.valDateTime == null) {
      defaultTime = Time(hour: hour, minute: minute, second: second);
    }
    defaultTime = Time(
        hour: provider.valDateTime.hour,
        minute: provider.valDateTime.minute,
        second: provider.valDateTime.second);
  }

  int hour = 0;
  int minute = 25;
  int second = 0;

  void changeChangebleTime(Time newTime) {
    //! burada
    changableTime = newTime;
    hour = newTime.hour;
    minute = newTime.minute;
    second = newTime.second;
    notifyListeners();
  }

  void changeDefTime(Time newTime) {
    defaultTime = newTime;
    notifyListeners();
  }

  void restart(BuildContext context) {
    var provider = Provider.of<TimePicker>(context, listen: false).valDateTime;
    defaultTime = Time(hour: provider.hour, minute: provider.minute, second: 0);
    notifyListeners();
  }

  // ! Start Timer
  Future<void> startTime(Time time, BuildContext context, Function fun) async {
    var provider = Provider.of<TimePicker>(context, listen: false).valDateTime;
    Provider.of<StartAndStopButons>(context, listen: false)
        .changeisStartButtonBreak(false);

    var newTime = time;

    // ! will decrease  counter
    hour = time.hour;
    minute = time.minute;
    second = time.second;

    timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) async {
        if (hour == 0 && second == 0 && minute == 0) {
          timer.cancel();

          Provider.of<ScoreCounter>(context, listen: false)
              .changeScoreCounter();
          Provider.of<StartAndStopButons>(context, listen: false)
              .changeisStartButton(false);
          /**
         *   Provider.of<BreakTime>(context, listen: false)
              .changeisTimeToBreak(true);
         */
          //! the alarm will go off
          await audioPlayer.play(
            AssetSource('alarm.mp3'),
          );
/**
 *           Provider.of<BreakTime>(context, listen: false)
              .changeisTimeToBreak(true);
 */
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ShowBreakCard(),
            ),
          );

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 5),
              backgroundColor: Colors.transparent,
              content: Center(
                child: Text(
                  "Time for break",
                  style: kDefTextStyle,
                ),
              ),
            ),
          );
          //! Add Database
          var pomodoro = Pomodoro(
            id: 0,
            hour: newTime.hour,
            minute: newTime.minute,
            second: newTime.second,
            timesPomodoro: 1,
            date: DateTime.now().toString().substring(0, 10),
          );

          // ignore: use_build_context_synchronously
          Provider.of<PomodoroDao>(context, listen: false).insertData(pomodoro);

          //! We restart here
          defaultTime = Time(
              hour: provider.hour,
              minute: provider.minute,
              second: provider.second);
          changableTime = Time(hour: 0, minute: 30, second: 0);
        } else {
          // ! basic algorithim
          if (second > 0) {
            second--;
            //! it will be new
            fun(Time(hour: hour, minute: minute, second: second));
          } else {
            second = 59;

            if (minute > 0) {
              minute--;
              fun(Time(hour: hour, minute: minute, second: second));
            } else {
              minute = 59;

              if (hour > 0) {
                hour--;
              }
              fun(Time(hour: hour, minute: minute, second: second));
            }
          }
        }
        notifyListeners();
      },
    );
  }
}
