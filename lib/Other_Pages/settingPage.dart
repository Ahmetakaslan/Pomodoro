import 'dart:async';

import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro/Other_Pages/datapage.dart';
import 'package:pomodoro/ProviderClass.dart/TimerClass.dart';
import 'package:pomodoro/constants/constants.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ProviderClass.dart/timePicker.dart';

class Setting extends StatelessWidget {
  Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Data(),
                    ));
              },
              child: Text("Data"),
            ),
            CupertinoButton(
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) {
                    return SizedBox(
                      height: 250,
                      child: CupertinoDatePicker(
                        backgroundColor: Colors.white,
                        initialDateTime:
                            Provider.of<TimePicker>(context).valDateTime,
                        onDateTimeChanged: (value) async {
                          Provider.of<TimePicker>(context, listen: false)
                              .fChaneDefTime(value);
                          Provider.of<TimerClass>(context, listen: false)
                              .changeDefTime(
                            Time(
                                hour: value.hour,
                                minute: value.minute,
                                second: 0),
                          );

                          var prefs = await SharedPreferences.getInstance();

                          prefs.setInt("hour", value.hour);
                          prefs.setInt("minute", value.minute);
                          prefs.setInt("second", value.second);
                        },
                        use24hFormat: true,
                        mode: CupertinoDatePickerMode.time,
                      ),
                    );
                  },
                );
              },
              child: Text("Change Default Time"),
            ),
          ],
        ),
      ),
    );
  }
}
