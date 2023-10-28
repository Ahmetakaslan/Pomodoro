import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyFabButton extends StatelessWidget {
  Function() function;
  IconData iconData;
 Key?key;
  Color color;
  Text? text;
  String? heroTag;
  MyFabButton({
    required this.function,
    required this.iconData,
    required this.color,
    this.text,
    this.key,
    this.heroTag
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      heroTag: heroTag,
      onPressed: function,
      label: text == null ? Text("") : text!,
      icon: Icon(iconData),
      backgroundColor: color,
    );
  }
}
