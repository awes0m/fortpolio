import 'package:flutter/material.dart';

// Reusable app logo widget in a circular clip
ClipOval appLogoCircle = ClipOval(
  child: Container(
    color: Colors.white,
    padding: EdgeInsets.all(8),
    child: appLogo,
  ),
);

// Reusable app logo widget
Widget appLogo = Image.asset(
  'assets/som_home_icon.png',
  height: 32,
  width: 32,
  fit: BoxFit.contain,
);
