import 'package:flutter/material.dart';

const Color kPrimaryColor = Color.fromRGBO(39, 154, 70, 1);
const Color kSecondaryColor = Color.fromRGBO(15, 14, 14, 1);
const Color kDangerColor = Colors.orange;
const Color kCaptionColor = Color.fromRGBO(238, 238, 238, 1);

const double kDesktopMaxWidth = 1000;
const double kTabletMaxWidth = 760.0;
double getMobileMaxWidth(BuildContext context) {
  return MediaQuery.of(context).size.width * .8;
}
