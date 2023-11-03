import 'package:flutter/material.dart';
import 'package:pomodoro/Other_Pages/settingPage.dart';
import 'package:pomodoro/ProviderClass.dart/BreakTime.dart';
import 'package:pomodoro/constants/constants.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:  Provider.of<BreakTime>(context).isTimeToBreak==true?Colors.green:Colors.pink,
      title: Text(
         Provider.of<BreakTime>(context).isTimeToBreak==true?"Break Time" :"Pomodoro",style: kDefTextStyle,
      ),
      centerTitle: true,
      actions: [
        kDefSizedBoxWith,
        IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Setting(),
                ));
          },
          icon: Icon(Icons.settings),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
