//imports
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
