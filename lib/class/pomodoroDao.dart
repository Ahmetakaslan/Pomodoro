import 'package:flutter/foundation.dart';
import 'package:pomodoro/class/pomodoro.dart';

import 'dbhelper.dart';

class PomodoroDao with ChangeNotifier {
  //! Get All Data from db
  Future<List<Pomodoro>> getAllData() async {
    var db = await DbHelper.connectDatabase();

    List<Map<String, dynamic>> list =
        await db.rawQuery("Select * from pomodoro");
 
    return List.generate(
      list.length,
      (index) {
        var map = list[index];
        return Pomodoro(
          id: map["id"],
          hour: map["hour"],
          minute: map["minute"],
          second: map["second"],
          timesPomodoro: map["timesPomodoro"],
          date: map["date"],
        );
      },
    );
  }

  //! insert Data from db
  Future<void> insertData(Pomodoro a) async {
    var db = await DbHelper.connectDatabase();
    //? here id is not important cause of automatic increanment

    await db.insert("pomodoro", a.toMap());
    print("inserted");
    notifyListeners();
  }

  //! Delete Data from db
  Future<void> deleteData(int id) async {
    var db = await DbHelper.connectDatabase();
    //?  here id is important

    await db.delete("pomodoro", where: 'id = ?', whereArgs: [id]);
    print("Deleted");
    
    notifyListeners();
  }

  //! Update Data from db
  Future<void> Update(Pomodoro pomodoro) async {
    var db = await DbHelper.connectDatabase();
    //? here id is important
    await db.update("pomodoro", pomodoro.toMap());
    print("Updated");
    notifyListeners();
  }
}
