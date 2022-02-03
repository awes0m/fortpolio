import 'package:flutter/material.dart';

const Color kPrimaryColor = Color.fromRGBO(21, 181, 114, 1);
const Color kSecondaryColor = Color.fromRGBO(7, 17, 26, 1);
const Color kDangerColor = Color.fromRGBO(249, 77, 30, 1);
const Color kCaptionColor = Color.fromRGBO(166, 177, 187, 1);

const double kDesktopMaxWidth = 1000;
const double kTabletMaxWidth = 760.0;
double getMobileMaxWidth(BuildContext context) {
  return MediaQuery.of(context).size.width * .8;
}
