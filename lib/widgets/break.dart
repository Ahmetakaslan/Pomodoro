import 'package:flutter/material.dart';
import 'package:pomodoro/ProviderClass.dart/TimerClassBreak.dart';
import 'package:pomodoro/constants/constants.dart';
import 'package:pomodoro/responsive/responsive.dart';
import 'package:provider/provider.dart';

class BreakTimeWidget extends StatelessWidget {
  const BreakTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width > desktopScreen ? size.height * .5 : size.height * .4,
      width: size.width > desktopScreen ? size.width * .5 : size.width * 7,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                defContainer(color: Colors.blue, text: "Hour"),
                defContainer(color: Colors.blue, text: "Minute"),
                defContainer(color: Colors.blue, text: "Second"),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Consumer<TimerClassBreak>(
              builder: (context, value, child) {
                return Row(
                  children: [
                    defContainer(
                      color: Colors.grey,
                      text: value.breakTime.hour.toString(),
                    ),
                    defContainer(
                      color: Colors.grey,
                      text: value.breakTime.minute.toString(),
                    ),
                    defContainer(
                      color: Colors.grey,
                      text: value.breakTime.second.toString(),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Expanded defContainer(
      {required Color color,
      String? text,
      TextStyle textStyle = kDefTextStyle}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              "${text == null ? "" : text}",
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }
}
