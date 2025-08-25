import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:som_devprofile/src/custom/header_logo.dart';

import '../../theme/theme_button.dart';
import 'nav_bar_btn.dart';

//The top Nav Bar
class NavBar extends StatelessWidget {
  const NavBar({
    Key? key,
    required this.isDarkModeBtnVisible,
  }) : super(key: key);

  final bool isDarkModeBtnVisible;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        dragStartBehavior: DragStartBehavior.down,
        clipBehavior: Clip.antiAlias,
        physics: const BouncingScrollPhysics(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(width: 8),
            const HeaderLogo(),
            const SizedBox(width: 5),
            UnderlinedButton(
                context: context,
                tabNumber: 0,
                btnNumber: ' _/. ',
                btnName: 'Home'),
            UnderlinedButton(
                context: context,
                tabNumber: 1,
                btnNumber: ' _1. ',
                btnName: 'What I Do'),
            UnderlinedButton(
                context: context,
                tabNumber: 2,
                btnNumber: ' _2. ',
                btnName: 'Education'),
            UnderlinedButton(
                context: context,
                tabNumber: 3,
                btnNumber: ' _3. ',
                btnName: 'Experience'),
            UnderlinedButton(
                context: context,
                tabNumber: 4,
                btnNumber: ' _4. ',
                btnName: 'Projects'),
            UnderlinedButton(
                context: context,
                tabNumber: 5,
                btnNumber: ' _5. ',
                btnName: 'Certifications'),
            UnderlinedButton(
                context: context,
                tabNumber: 6,
                btnNumber: ' _6. ',
                btnName: 'Contact Me'),
            Visibility(
              visible: isDarkModeBtnVisible,
              child: const ThemeButton(),
            )
          ],
        ),
      ),
    );
  }
}
