//imports
import 'package:flutter/cupertino.dart';
import 'package:som_official/utils/globals.dart';

import '../../../../models/header_items.dart';

//list of Header Tabs
List<HeaderItem> headerItems = [
  HeaderItem(
    title: 'Home',
    onTap: () => scrollToSection(Globals.carouselKey),
  ),
  HeaderItem(
    title: 'My Profile',
    onTap: () => scrollToSection(Globals.cvSectionKey),
  ),
  HeaderItem(
    title: 'Works',
    onTap: () => scrollToSection(Globals.workadvert1Key),
  ),
  HeaderItem(
    title: 'Skills',
    onTap: () => scrollToSection(Globals.skillsKey),
  ),
  HeaderItem(
    title: 'Testimonials',
    onTap: () => scrollToSection(Globals.testimonialsKey),
  ),
  HeaderItem(
    title: 'Blogs',
    onTap: () {},
  ),
  HeaderItem(
    title: 'Hire Me',
    onTap: () {},
    isButton: true,
  ),
];

Future<void> scrollToSection(itemkey) async {
  //scroll to section
  final context = itemkey.currentContext;
  await Scrollable.ensureVisible(
    context,
    duration: const Duration(milliseconds: 600),
    curve: Curves.slowMiddle,
  );
}
