import 'package:flutter/material.dart';
import 'package:pomodoro/Other_Pages/settingPage.dart';
import 'package:pomodoro/constants/constants.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Pomodoro",style: kDefTextStyle,
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
