String id = "id";
String hour="hour";
String minute="minute";
String second="second";
String timesPmodoro="times";
class Pomodoro {
  int id;
  int hour;
  int minute;
  int second;
  int timesPomodoro;
  String date;
  Pomodoro({
    required this.id,
    required this.hour,
    required this.minute,
    required this.second,
    required this.timesPomodoro,
    required this.date
  });

//! toMap
Map<String ,dynamic> toMap(){
  return {
    "hour":hour,
    "minute":minute,
    "second":second,
    "timesPomodoro":timesPomodoro,
    "date":date
  };
}
/**
 *  Pomodoro.fromMap(Map<String, Object?> map) {
    id = map["id"];
    hour = map["hour"];
    minute = map["minute"] == 1;
    second=map["second"];
    timesPomodoro=map["timesPomodor"];
  } 
 */
}
