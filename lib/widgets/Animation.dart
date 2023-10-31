import 'dart:math';

import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro/ProviderClass.dart/TimerClass.dart';
import 'package:pomodoro/class/dbhelper.dart';
import 'package:pomodoro/class/pomodoroDao.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ProviderClass.dart/ScoreCounter.dart';
import '../ProviderClass.dart/TempleteDefaultScheme.dart';
import '../ProviderClass.dart/TempleteOfCostumButto.dart';
import '../ProviderClass.dart/isAnimate.dart';
import '../constants/constants.dart';
import '../scaffolds/MyAppBar.dart';
import '../scaffolds/MyBody.dart';
import 'FacButton.dart';

SharedPreferences? sharedPreferences;

class TempleteAnimation extends StatefulWidget {
  const TempleteAnimation({super.key});

  @override
  State<TempleteAnimation> createState() => Templete_AnimationState();
}

class Templete_AnimationState extends State<TempleteAnimation>
    with TickerProviderStateMixin {
  //! for controll Aimation( strat , stop )
  late AnimationController animationController;
  //! for score button
  late AnimationController animationController2;
  //! for Scale buttons
  late Animation<double> scaleAnimation;
  // ! for count of pomodoro
  late Animation<double> scaleAnimationCountOfPomodoro;
  //! for  rotate buttons
  late Animation<double> rotateAnimation;
  Future<void> initSharedPreference() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }



  @override
  void initState() {
    super.initState();
 

    // ! For Animation
    initSharedPreference();
    debugPrint("SharedPreference Çalıştı");
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    animationController2 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    rotateAnimation =
        Tween<double>(begin: 0, end: pi).animate(animationController)
          ..addListener(() {
            setState(() {});
          });

    scaleAnimation =
        Tween<double>(begin: 0, end: 1).animate(animationController)
          ..addListener(() {
            setState(() {});
          });
    scaleAnimationCountOfPomodoro =
        Tween<double>(begin: 0, end: 1).animate(animationController2)
          ..addListener(() {
            setState(() {});
          });
  }

  @override
  void dispose() {
    super.dispose();
    // TODO: implement dispose
    animationController.dispose();
    animationController2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          /**
      *  decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue,
                Colors.red,
              ],
            )
          ),
      */
          child: MyBody()),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //!Costum button
          //!  4 buttons and 1 container here

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.scale(
                scale: scaleAnimation.value,
                child: MyFabButton(
                  heroTag: "CustomButton",
                  function: () {
                    var provider =
                        Provider.of<TimerClass>(context, listen: false);
                    var provider2 = Provider.of<TempleteOfCoostumBUtton>(
                        context,
                        listen: false);
                    var provider3 = Provider.of<TempleteOfDefaultButton>(
                        context,
                        listen: false);
                    var provider4 =
                        Provider.of<IsAnimate>(context, listen: false);

                    Navigator.of(context).push(
                      showPicker(
                        showSecondSelector: true,
                        is24HrFormat: true,
                        context: context,
                        value: provider.changableTime,
                        onChange: provider.changeChangebleTime,
                        minuteInterval: TimePickerInterval.FIVE,
                        // Optional onChange to receive value as DateTime
                      ),
                    );
                    if (provider2.isClickCostumButton == false) {
                      provider2.changeCostumButton(true);
                      provider3.changeIsClick(false);
                      animationController.reverse();
                      provider4.changeMainisAnimate(true);
                    }
                    /**
                     *  else {
                      provider2.changeCostumButton(false);
                      provider3.changeIsClick(true);
                      animationController.reverse();
                      provider4.changeMainisAnimate(true);
                      //  providerStartStop.changeisStartButton(false);
                    }
                     */
                    provider.restart(context);
                  },
                  iconData: Icons.watch_later_outlined,
                  color: Colors.green,
                  text: Text("Costum"),
                ),
              ),
              kDefSizedBoxWith,

              // ! Default Button
              //! will create Templete for Default pomodoro
              Transform.scale(
                scale: scaleAnimation.value,
                child: MyFabButton(
                  heroTag: "DefaultButton",
                  function: () {
                    var provider = Provider.of<TempleteOfDefaultButton>(context,
                        listen: false);
                    var provider2 =
                        Provider.of<IsAnimate>(context, listen: false);
                    var provider3 = Provider.of<TempleteOfCoostumBUtton>(
                        context,
                        listen: false);

                    if (provider.isClickDefButton == false) {
                      provider.changeIsClick(true);
                      provider3.changeCostumButton(false);
                      animationController.reverse();
                      provider2.changeMainisAnimate(true);
                    } /**
                    else {
                      provider.changeIsClick(false);
                      provider3.changeCostumButton(true);
                      animationController.reverse();
                      provider2.changeMainisAnimate(true);
                      //  providerStartStop.changeisStartButton(false);
                    } */
                  },
                  iconData: Icons.watch_later_outlined,
                  color: Colors.red,
                  text: Text("Default"),
                ),
              ),
            ],
          ),
          kDefSizedBoxHeight,

          //! Main Fab Button
          Align(
            alignment:
                Provider.of<IsAnimate>(context, listen: false).isAnimateMain ==
                        true
                    ? Alignment.bottomRight
                    : Alignment.center,
            child: Transform.rotate(
              angle: rotateAnimation.value,
              child: FloatingActionButton(
                heroTag: "Main_button",
                onPressed: () {
                  //! run Animation
                  var provider = Provider.of<IsAnimate>(context, listen: false);
                  provider.isAnimateMain
                      ? animationController.forward()
                      : animationController.reverse();
                  provider.isAnimateMain == true
                      ? provider.isAnimateMain = false
                      : provider.isAnimateMain = true;
                  provider.changeMainisAnimate(provider.isAnimateMain);
                },
                child: Icon(Icons.add),
              ),
            ),
          ),

          kDefSizedBoxHeight,

          // ! Score Button
          // ! Animationcontorller 2 used here
          Transform.scale(
            scale: scaleAnimation.value,
            child: MyFabButton(
              heroTag: "ScoreButton",
              function: () {
                var provider = Provider.of<IsAnimate>(context, listen: false);
                provider.isAnimatePomodoroScore == true
                    ? animationController2.forward()
                    : animationController2.reverse();
                provider.isAnimatePomodoroScore == true
                    ? provider.isAnimatePomodoroScore = false
                    : provider.isAnimatePomodoroScore = true;
                print("Şimdi => ${provider.isAnimatePomodoroScore}");
                provider
                    .changePomodoroisAnimate(provider.isAnimatePomodoroScore);
              },
              iconData: Icons.score,
              color: Colors.blue,
              text: Text("Score"),
            ),
          ),

          //! Container
          // ! Animationcontorller 2 used for here
          Transform.scale(
            scale: scaleAnimationCountOfPomodoro.value,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      //! i will get timesOfPomodoro with provider
                      child: Text(
                          "${Provider.of<ScoreCounter>(context).scoreCounter}"),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
