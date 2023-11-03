import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro/widgets/Animation.dart';

class TimePicker with ChangeNotifier {
  late DateTime valDateTime;

  late Time defaultTime = Time(
      hour: sharedPreferences!.getInt("hour")!,
      minute: sharedPreferences!.getInt("minute")!,
      second: sharedPreferences!.getInt("second")!);
  Time changableTime = Time(hour: 0, minute: 30, second: 0);
  
  TimePicker() {
    debugPrint("Constructor Çalıştı");
    _fThat();
  }

  void _fThat() async {
    fGetDateTime();
  }

  void fGetDateTime() {
    valDateTime = DateTime.now();
    fChaneDefTime(
      DateTime(
        0,
        0,
        0,
        sharedPreferences!.getInt("hour") ?? 0,
        sharedPreferences!.getInt("minute") ?? 25,
        sharedPreferences!.getInt("second") ?? 0,
      ),
    );
  }

  void fChaneDefTime(DateTime a) {
    valDateTime = a;
    notifyListeners();
  }

  get hour => sharedPreferences!.getInt("hour");
  get minute => sharedPreferences!.getInt("minute");
  get second => sharedPreferences!.getInt("second");

  get hourBreak => sharedPreferences!.getInt("hourBreak");
  get minuteBreak => sharedPreferences!.getInt("minuteBreak");
  get secondBreak => sharedPreferences!.getInt("secondBreak");
}
