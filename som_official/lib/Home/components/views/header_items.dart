//imports
import 'package:som_official/utils/globals.dart';

import '../../../../models/header_items.dart';

/// List of Header Tabs, used in HeaderRow
/// can be text buttons or buttons
/// parameters:title, onTap, isButton
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

  /// Testimonials
  // HeaderItem(
  //   title: 'Testimonials',
  //   onTap: () => scrollToSection(Globals.testimonialsKey),
  // ),

  /// Blogs
  HeaderItem(
    title: 'Blogs',
    onTap: () {},
  ),

  /// Hire Me Button
  HeaderItem(
    title: 'Hire Me',
    onTap: () {},
    isButton: true,
  ),
];
