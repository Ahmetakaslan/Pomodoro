import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pomodoro/ProviderClass.dart/BreakTime.dart';
import 'package:pomodoro/ProviderClass.dart/StartStopButton.dart';
import 'package:pomodoro/ProviderClass.dart/TempleteDefaultScheme.dart';
import 'package:pomodoro/ProviderClass.dart/TempleteOfCostumButto.dart';
import 'package:pomodoro/ProviderClass.dart/TimerClass.dart';
import 'package:pomodoro/ProviderClass.dart/TimerClassBreak.dart';
import 'package:pomodoro/constants/constants.dart';
import 'package:pomodoro/widgets/CostumCounter.dart';
import 'package:pomodoro/widgets/DefaultcounterTemplete.dart';
import 'package:pomodoro/widgets/break.dart';
import 'package:provider/provider.dart';

class MyBody extends StatelessWidget {
  const MyBody({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TempleteOfDefaultButton>(context);
    var provider2 = Provider.of<StartAndStopButons>(context);
    var provider3 = Provider.of<TempleteOfCoostumButton>(context);
    var provider4 = Provider.of<BreakTime>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        provider4.isTimeToBreak == true
            ? Container(
                height: 100,
                width: 100,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/break.png")),
                  borderRadius: BorderRadius.circular(50),
                ),
              )
            : Container(),
        provider4.isTimeToBreak == true
            ? BreakTimeWidget()
            : provider.isClickDefButton == true
                ? DefaultCounter()
                : provider3.isClickCostumButton == true
                    ? CostumCounter()
                    : Container(),
        provider4.isTimeToBreak == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  provider2.isClickStartButtonBreak == false
                      ? myStartButtonForBreak(context)
                      : Container(),
                  kDefSizedBoxWith,
                  myStopButtonForBreak(context),
                ],
              )
            : provider.isClickDefButton == true ||
                    provider3.isClickCostumButton == true
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      provider2.isClickStartButton == false
                          ? myStartButton(context)
                          : Container(),
                      kDefSizedBoxWith,
                      myStopButton(context),
                    ],
                  )
                : Container(),
      ],
    );
  }

  //!  Break Stratt Stop
  FloatingActionButton myStartButtonForBreak(BuildContext context) =>
      FloatingActionButton(
        heroTag: "myStartButtonForBreak",
        onPressed: () {
          var providerStratStop =
              Provider.of<StartAndStopButons>(context, listen: false);
          var provTimerClassBreak =
              Provider.of<TimerClassBreak>(context, listen: false);
          provTimerClassBreak.startTime(provTimerClassBreak.breakTime, context,
              provTimerClassBreak.changeBreakTime);
          providerStratStop.isClickStartButtonBreak == true
              ? providerStratStop.changeisStartButtonBreak(false)
              : providerStratStop.changeisStartButtonBreak(true);
        },
        child: FaIcon(
          FontAwesomeIcons.hourglass,
          color: Colors.green,
        ),
      );

//todo Stop break button
  FloatingActionButton myStopButtonForBreak(BuildContext context) =>
      FloatingActionButton(
        heroTag: "myStopButtonForBreak",
        onPressed: () {
          var providerStratStop =
              Provider.of<StartAndStopButons>(context, listen: false);
          var provTimerClassBreak =
              Provider.of<TimerClassBreak>(context, listen: false);
          provTimerClassBreak.timer!.cancel();
       
          print("break stop button tıklandı");

          providerStratStop.changeisStartButtonBreak(false);
        },
        child: FaIcon(
          FontAwesomeIcons.stop,
          color: Colors.green,
        ),
      );

  //!  Break Stratt Stop
  // todo
  //?
  //todo
  //* */
  //! Start Button

  FloatingActionButton myStartButton(BuildContext context) =>
      FloatingActionButton(
        heroTag: "myStartButton",
        onPressed: () {
          var provider =
              Provider.of<StartAndStopButons>(context, listen: false);
          var provider2 = Provider.of<TimerClass>(context, listen: false);

          var provider3 =
              Provider.of<TempleteOfDefaultButton>(context, listen: false);
          var provider4 =
              Provider.of<TempleteOfCoostumButton>(context, listen: false);

          provider.isClickStartButton == true
              ? provider.changeisStartButton(false)
              : provider.changeisStartButton(true);

          provider2.startTime(
            //! Control of Which Time

            provider3.isClickDefButton == true
                ? provider2.defaultTime
                : provider4.isClickCostumButton
                    ? provider2.changableTime
                    : Time(hour: 0, minute: 0, second: 0),
            //? Context
            context,
            //! i choiced wich button is clicked Default or Costum in here

            provider3.isClickDefButton == true
                ? provider2.changeDefTime
                : provider4.isClickCostumButton
                    ? provider2.changeChangebleTime
                    : () {},
          );

          if (provider3.isClickDefButton == true) {
            provider4.changeCostumButton(false);
          }
          if (provider4.isClickCostumButton == true) {
            provider3.changeIsClick(false);
          }
        },
        child: FaIcon(FontAwesomeIcons.hourglass),
      );
  //! Stop Button
  FloatingActionButton myStopButton(BuildContext context) =>
      FloatingActionButton(
          heroTag: "myStopButton",
          onPressed: () {
            var provider1 =
                Provider.of<StartAndStopButons>(context, listen: false);
            var provider2 = Provider.of<TimerClass>(context, listen: false);

            provider1.changeisStartButton(false);
            provider1.changeisStopButton(true);
            provider2.timer!.cancel();
          },
          child: FaIcon(FontAwesomeIcons.stop));
}
