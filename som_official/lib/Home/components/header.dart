//dependencies
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
//imports
import '../../../utils/constants.dart';
import '../../../utils/globals.dart';
import '../../../utils/screen_helper.dart';
import 'component_item_lists/header_items.dart';
import 'header_logo.dart';

class HeaderRow extends StatelessWidget {
  /// header menu widget
  const HeaderRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Handle the header row layout for different screen sizes
    return ResponsiveVisibility(
      visible: false,
      visibleWhen: const [Condition.largerThan(name: 'MOBILE')],
      child: Row(
        children: headerItems
            .map((item) => item.isButton
                //if {isButton} displays Button
                ? MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      decoration: BoxDecoration(
                        color: kDangerColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: TextButton(
                        onPressed: item.onTap,
                        child: Text(
                          item.title,
                          style: GoogleFonts.oswald(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )

                /// if not button displays textbutton
                : MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      margin: const EdgeInsets.only(right: 30),
                      child: TextButton(
                        onPressed: item.onTap,
                        child: Text(
                          item.title,
                          style: GoogleFonts.oswald(
                            color: kDangerColor,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ))
            .toList(),
      ),
    );
  }
}

class Header extends StatelessWidget {
  /// header widget
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ScreenHelper(
        desktop: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: buildHeader(),
        ),
        mobile: buildMobileHeader(),
        tablet: buildHeader(),
      ),
    );
  }
}

/// header for desktop and tablets
Widget buildHeader() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        HeaderLogo(),
        HeaderRow(),
      ],
    ),
  );
}

/// header for mobile
Widget buildMobileHeader() {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const HeaderLogo(),
          GestureDetector(
              onTap: () {
                Globals.scaffoldKey.currentState?.openEndDrawer();
              },
              child: const Icon(
                FontAwesomeIcons.bars,
                color: kDangerColor,
                size: 28.0,
              )),
        ],
      ),
    ),
  );
}
