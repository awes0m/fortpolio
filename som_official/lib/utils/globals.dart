import 'package:flutter/material.dart';

class Globals {
  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  static GlobalKey carouselKey = GlobalKey();
  static GlobalKey cvSectionKey = GlobalKey();
  static GlobalKey workadvert1Key = GlobalKey();
  static GlobalKey workadvert2Key = GlobalKey();
  static GlobalKey educationKey = GlobalKey();
  static GlobalKey skillsKey = GlobalKey();
  static GlobalKey testimonialsKey = GlobalKey();
}

Future<void> scrollToSection(itemkey) async {
  //scroll to section
  final context = itemkey.currentContext;
  await Scrollable.ensureVisible(
    context,
    duration: const Duration(milliseconds: 600),
    curve: Curves.slowMiddle,
  );
}
