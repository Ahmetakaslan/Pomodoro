import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro/ProviderClass.dart/BreakTime.dart';
import 'package:pomodoro/ProviderClass.dart/TimerClassBreak.dart';
import 'package:pomodoro/constants/constants.dart';
import 'package:pomodoro/main.dart';
import 'package:pomodoro/widgets/Animation.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowBreakCard extends StatefulWidget {
  const ShowBreakCard({super.key});

  @override
  State<ShowBreakCard> createState() => _ShowBreakCardState();
}

class _ShowBreakCardState extends State<ShowBreakCard> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BreakTime>(context, listen: false);
    var providerBreakTime =
        Provider.of<TimerClassBreak>(context, listen: false);
    DateTime dateTime = DateTime(0, 0, 0, 0, 30, 0, 0, 0);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                defContainer(Colors.white, "10b.png", () async {
                  provider.changeis10(true);
                  provider.changeisTimeToBreak(true);
                  print("basıldı");

                  providerBreakTime
                      .changeBreakTime(Time(hour: 0, minute: 10, second: 0));
                  Future.delayed(
                    Duration(seconds: 2),
                    () {
                      setState(() {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TempleteAnimation(),
                            ));
                      });
                    },
                  );
                }),
                defContainer(Colors.white, "15b.png", () async {

                  providerBreakTime
                      .changeBreakTime(Time(hour: 0, minute: 15, second: 0));
                  provider.changeis15(true);
                  provider.changeisTimeToBreak(true);

                  setState(() {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TempleteAnimation(),
                        ));
                  });
                }),
                defContainer(Colors.white, "20b.png", () async {
                  provider.changeis20(true);
                  provider.changeisTimeToBreak(true);

                  providerBreakTime
                      .changeBreakTime(Time(hour: 0, minute: 20, second: 0));
                  setState(() {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TempleteAnimation(),
                        ));
                  });
                }),
              ],
            ),
            kDefSizedBoxHeight,
            Container(
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: () {
                  //todo CupertinoDatePicker

                  //! here you choice break time
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Container(
                              height: 250,
                              width: 200,
                              child: CupertinoDatePicker(
                                initialDateTime:
                                    DateTime(0, 0, 0, 0, 30, 0, 0, 0),
                                mode: CupertinoDatePickerMode.time,
                                onDateTimeChanged: (value) {
                                  providerBreakTime.changeBreakTime(Time(
                                      hour: value.hour, minute: value.minute));
                                  provider.changeisTimeToBreak(true);
                                 
                                },
                                use24hFormat: true,
                                backgroundColor: Colors.blue[300],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              provider.changeisTimeToBreak(true);
                              setState(() {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MyApp(),
                                    ));
                              });
                            },
                            child: Text(
                              "Set",
                              style: kDefTextStyle,
                            ),
                          ),
                        ],
                      );
                      //todo CupertinoDatePicker
                    },
                  );
                },
                child: Text("Choice your Break Time"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector defContainer(
      Color color, String photo, void Function() function) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/${photo}"), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(25),
          color: color,
        ),
      ),
    );
  }
}
