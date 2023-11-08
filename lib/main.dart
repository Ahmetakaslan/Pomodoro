import 'package:flutter/material.dart';
import 'package:pomodoro/Dbclass/pomodoroDao.dart';
import 'package:pomodoro/MyMobileHomePage.dart';
import 'package:pomodoro/ProviderClass.dart/BreakTime.dart';
import 'package:pomodoro/ProviderClass.dart/ScoreCounter.dart';
import 'package:pomodoro/ProviderClass.dart/StartStopButton.dart';
import 'package:pomodoro/ProviderClass.dart/TempleteDefaultScheme.dart';
import 'package:pomodoro/ProviderClass.dart/TempleteOfCostumButto.dart';
import 'package:pomodoro/ProviderClass.dart/TimerClass.dart';
import 'package:pomodoro/ProviderClass.dart/TimerClassBreak.dart';
import 'package:pomodoro/ProviderClass.dart/isAnimate.dart';
import 'package:pomodoro/ProviderClass.dart/SharedPrefernces.dart';
import 'package:pomodoro/responsive/responsive.dart';
import 'package:provider/provider.dart';

import 'MyDesktopHomePage.dart';

void main() {
  //! İ used provider
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => IsAnimate(),
      ),
      ChangeNotifierProvider(
        create: (context) => TempleteOfDefaultButton(),
      ),
      ChangeNotifierProvider(
        create: (context) => TimerClass(),
      ),
      ChangeNotifierProvider(
        create: (context) => StartAndStopButons(),
      ),
      ChangeNotifierProvider(
        create: (context) => TempleteOfCoostumButton(),
      ),
      ChangeNotifierProvider(
        create: (context) => ScoreCounter(),
      ),
      ChangeNotifierProvider(
        create: (context) => ScoreCounter(),
      ),
      ChangeNotifierProvider(
        create: (context) => TimePicker(),
      ),
      ChangeNotifierProvider(
        create: (context) => PomodoroDao(),
      ),
      ChangeNotifierProvider(
        create: (context) => BreakTime(),
      ),
      ChangeNotifierProvider(
        create: (context) => TimerClassBreak(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.pink,
          primaryColor: Colors.pink,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          appBarTheme: const AppBarTheme(backgroundColor: Colors.pink),
          useMaterial3: true,
        ),
        home: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < desktopScreen) {
              return MyMobile();
            } else {
              return MyHomePage();
            }
          },
        ));
  }
}
