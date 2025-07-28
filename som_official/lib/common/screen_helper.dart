import 'package:flutter/material.dart';

class ScreenHelper extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ScreenHelper({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  //Define booleans that  checks the screen size
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 760;
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 760 &&
      MediaQuery.of(context).size.width < 1200;
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 1200) {
          return desktop;
        } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
