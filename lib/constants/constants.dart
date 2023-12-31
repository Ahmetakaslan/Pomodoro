import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pomodoro/Dbclass/pomodoro.dart';
import 'package:pomodoro/Dbclass/pomodoroDao.dart';
import 'package:pomodoro/main.dart';
import 'package:pomodoro/widgets/FacButton.dart';
import 'package:provider/provider.dart';

SizedBox kDefSizedBoxWith = SizedBox(
  width: 20,
);
SizedBox kDefSizedBoxHeight = SizedBox(
  height: 20,
);
//! Defult TextStyle

const TextStyle kDefTextStyle = TextStyle(
  fontSize: 30,
);
const TextStyle kDefTextStyle2 = TextStyle(
  fontSize: 20,
);
const TextStyle kDefTextStyleData = TextStyle(
  fontSize: 20,
);

//! Changable TextStyle

TextStyle kChangbleTextStyle(
  double fontSize,
) {
  return TextStyle(fontSize: fontSize);
}

AlertDialog kdefaultAlert(BuildContext context, int id) {
  return AlertDialog(
    content: Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Are You Sure Delete  Data?"),
      ),
    ),
    actions: [
      TextButton(
        onPressed: () {
          Provider.of<PomodoroDao>(context, listen: false).deleteData(id);
          Navigator.pop(context);
        },
        child: Icon(
          FontAwesomeIcons.thumbsUp,
          color: Colors.red,
        ),
      ),
      TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(
          FontAwesomeIcons.thumbsDown,
          color: Colors.green,
        ),
      ),
    ],
  );
}

AlertDialog kdefaultAlertAlldata(BuildContext context) {
  return AlertDialog(
    content: Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Are You Sure Delete All Data?"),
      ),
    ),
    actions: [
      TextButton(
        onPressed: () {
          Provider.of<PomodoroDao>(context, listen: false).deleteAllData();
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MyApp(),
              ));
        },
        child: Icon(
          FontAwesomeIcons.thumbsUp,
          color: Colors.red,
        ),
      ),
      TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(
          FontAwesomeIcons.thumbsDown,
          color: Colors.green,
        ),
      ),
    ],
  );
}

AlertDialog kdefForBreakTimeAler(bool is10,bool is15 ,bool is20) {
  return AlertDialog(
    actions: [
      FloatingActionButton.extended(
        onPressed: () {
          is10=true;
          is15=false;
          is20=false;
        },
        label: Text("10"),
      ),
       FloatingActionButton.extended(
        onPressed: () {
            is10=false;
          is15=true;
          is20=false;
        },
        label: Text("15"),
      ),
       FloatingActionButton.extended(
        onPressed: () {
            is10=false;
          is15=false;
          is20=true;
        },
        label: Text("20"),
      ),
    ],
  );
}
