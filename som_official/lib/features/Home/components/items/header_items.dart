import 'package:flutter/material.dart';

import '../../../../constants/globals.dart';
import '../../../contact_form/contact_form.dart';
import '../../models/header_items.dart';

List<HeaderItem> headerItems = [
  /// Home
  HeaderItem(
    title: 'Home',
    onTap: () => scrollToSection(Globals.carouselKey),
  ),

  /// My Profile
  HeaderItem(
    title: 'My Profile',
    onTap: () => scrollToSection(Globals.cvSectionKey),
  ),

  /// Works-experience
  HeaderItem(
    title: 'Works',
    onTap: () => scrollToSection(Globals.workexKey),
  ),

  /// Skills
  HeaderItem(
    title: 'Skills',
    onTap: () => scrollToSection(Globals.skillsKey),
  ),

  // Contact form
  HeaderItem(
    title: 'Contact',
    onTap: () => scrollToSection(Globals.contactFooter),
  ),

  // Blogs
  // HeaderItem(
  //   title: 'Blogs',
  //   onTap: () => Navigator.pushNamed(
  //       Globals.navigatorKey.currentContext!, BlogMain.routeName),
  // ),

  /// Hire Me Button
  HeaderItem(
    title: 'Say hi !',
    onTap: () => Navigator.pushNamed(
        Globals.navigatorKey.currentContext!, ContactFormPage.routeName),
    isButton: true,
  ),
];
