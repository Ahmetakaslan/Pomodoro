import 'package:flutter/material.dart';

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
const TextStyle kDefTextStyleData = TextStyle(
  fontSize: 20,
);

//! Changable TextStyle

TextStyle kChangbleTextStyle (double fontSize, ){
  return TextStyle(fontSize:fontSize );

}
