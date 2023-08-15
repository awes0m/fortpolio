import 'package:flutter/material.dart';

double getMaxWidth(BuildContext context) {
  return MediaQuery.of(context).size.width * .8;
}

double getMaxheight(BuildContext context) {
  return MediaQuery.of(context).size.height * .8;
}

appSnackBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(text)));
}
