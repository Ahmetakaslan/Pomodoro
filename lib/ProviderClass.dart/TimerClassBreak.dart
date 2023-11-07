import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro/Dbclass/pomodoro.dart';
import 'package:pomodoro/Dbclass/pomodoroDao.dart';
import 'package:pomodoro/ProviderClass.dart/BreakTime.dart';
import 'package:pomodoro/constants/constants.dart';
import 'package:pomodoro/widgets/Animation.dart';
import 'package:provider/provider.dart';

class TimerClassBreak with ChangeNotifier {
  AudioPlayer audioPlayer = AudioPlayer();
  Timer? timer;
  Time breakTime = Time(
      hour: sharedPreferences!.getInt("hourBreak") ?? 0,
      minute: sharedPreferences!.getInt("minuteBreak") ?? 15,
      second: sharedPreferences!.getInt("secondBreak") ?? 0);

  void changeBreakTime(Time dateTime) {
    breakTime = Time(
        hour: dateTime.hour,
        minute: dateTime.minute,
        second: dateTime.second);
    sharedPreferences?.setInt("hourBreak", dateTime.hour);
    sharedPreferences?.setInt("minuteBreak", dateTime.minute);
    sharedPreferences?.setInt("secondBreak", dateTime.second);
    notifyListeners();
  }

  int hour = 0;
  int minute = 20;
  int second = 0;
  // ! Start Timer
  Future<void> startTime(Time time, BuildContext context, Function fun) async {
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

          Provider.of<BreakTime>(context, listen: false)
              .changeisTimeToBreak(false);
          //! the alarm will go off
          await audioPlayer.play(
            AssetSource('alarm.mp3'),
          );

          Future.delayed(
            Duration(milliseconds: 1000),
            () {
              Provider.of<BreakTime>(context, listen: false)
                  .changeisTimeToBreak(false);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => TempleteAnimation(),
                ),
              );
            },
          );

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 10),
              backgroundColor: Colors.transparent,
              content: Center(
                child: Text(
                  "Break is over",
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
        } else {
          // ! basic algorithim
          if (second > 0) {
            second--;
            //! it will be new
            fun(Time(hour: hour, minute: minute, second: second));
            notifyListeners();
          } else {
            second = 59;

            if (minute > 0) {
              minute--;
              fun(Time(hour: hour, minute: minute, second: second));
              notifyListeners();
            } else {
              minute = 59;

              if (hour > 0) {
                hour--;
              }
              fun(Time(hour: hour, minute: minute, second: second));
              notifyListeners();
            }
          }
        }
        notifyListeners();
      },
    );
  }
}
