import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DbHelper {
  static const String databaseName = "pomodoro.sqlite";

  static Future<Database> connectDatabase() async {
    String path = join(await getDatabasesPath(), databaseName);

    if (await databaseExists(path)) {
      print("Databse already exists");
    } else {
      ByteData data = await rootBundle.load("Database/$databaseName");
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(path).writeAsBytes(bytes, flush: true);

      print("databse copied");
    }
    return openDatabase(path);
  }
}
