import 'package:flutter/material.dart';
import 'package:pomodoro/ProviderClass.dart/TimerClass.dart';
import 'package:pomodoro/constants/constants.dart';
import 'package:pomodoro/responsive/responsive.dart';
import 'package:provider/provider.dart';


class DefaultCounter extends StatelessWidget {
  const DefaultCounter({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width>desktopScreen?size.height * .5:size.height*.4,
      width: size.width>desktopScreen?size.width* .5:size.width*7,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                defContainer(color: Colors.pink, text: "Hour"),
                defContainer(color: Colors.pink, text: "Minute"),
                defContainer(color: Colors.pink, text: "Second"),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Consumer<TimerClass>(
              builder: (context, value, child) {
                return Row(
                  children: [
                    defContainer(
                        color: Colors.grey,
                        text: value.defaultTimeeee.hour.toString()),
                    defContainer(
                        color: Colors.grey,
                        text: value.defaultTimeeee.minute.toString()),
                    defContainer(
                        color: Colors.grey,
                        text: value.defaultTimeeee.second.toString()),
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
