//dependencies
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../common/screen_helper.dart';
import '../../../constants/constants.dart';
import '../../../models/footer_item.dart';
//imports

final List<FooterItem> footerItems = [
  FooterItem(
    iconPath: "assets/mappin.png",
    title: 'SOCIAL',
    text1: 'facebook.com/awe.s0m',
    text2: 'twitter.com/_awe_som_',
  ),
  FooterItem(
    iconPath: "assets/phone.png",
    title: 'PHONE',
    text1: '+91-790-831-4526',
    text2: '+91-843-650-6528',
  ),
  FooterItem(
    iconPath: "assets/email.png",
    title: 'EMAIL',
    text1: 'somsubhra.pandit@gmail.com',
    text2: 'dgr8som@gmail.com',
  ),
  FooterItem(
    iconPath: "assets/whatsapp.png",
    title: 'WHATSAPP CHAT',
    text1: '+91-790-831-4526',
    text2: '+91-843-650-6528',
  ),
];

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor.withValues(alpha: 0.2),
      child: ScreenHelper(
        desktop: _buildUI(context, 1000.0),
        tablet: _buildUI(context, 760),
        mobile: _buildUI(context, MediaQuery.of(context).size.width * .8),
      ),
    );
  }
}

Widget _buildUI(BuildContext context, double width) {
  return Center(
    child: LayoutBuilder(builder: (context, constraints) {
      return Container(
        key: Globals.contactFooter,
        constraints: BoxConstraints(
          maxWidth: width,
          minWidth: width,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: Wrap(
                // spacing: 20.0,
                // runSpacing: 20.0,
                children: footerItems
                    .map((footerItem) => SizedBox(
                          height: 120.0,
                          width: ScreenHelper.isMobile(context) ||
                                  ScreenHelper.isTablet(context)
                              ? constraints.maxWidth / 2.4 - 20
                              : constraints.maxWidth / 5.5 - 10,
                          child: SizedBox(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      /// Footer Icon
                                      Image.asset(
                                        footerItem.iconPath,
                                        width: 25.0,
                                      ),
                                      const SizedBox(
                                          width: 15.0), //horizontal spacing 15
                                      /// Footer Item Title
                                      Text(
                                        footerItem.title,
                                        style: GoogleFonts.oswald(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w700,
                                          color: kDangerColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15.0,
                                  ), //spacing 15
                                  RichText(
                                      textAlign: TextAlign.start,
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "${footerItem.text1}\n",
                                            style: const TextStyle(
                                              color: kCaptionColor,
                                            )),
                                        TextSpan(
                                            text: "${footerItem.text2}\n",
                                            style: const TextStyle(
                                              color: kCaptionColor,
                                            )),
                                      ]))
                                ]),
                          ),
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Flex(
              direction: ScreenHelper.isMobile(context)
                  ? Axis.vertical
                  : Axis.horizontal,
              mainAxisAlignment: ScreenHelper.isMobile(context)
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Copyright © 2022 Som Subhra,All rights reserved.",
                    style: TextStyle(
                      color: kCaptionColor,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: const Text(
                        '|',
                        style: TextStyle(
                          color: kCaptionColor,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        launchUrlString('https://www.facebook.com/awe.s0m');
                      },
                      //privacy policy
                      child: const MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Text('Privacy Policy',
                            style: TextStyle(
                              color: kCaptionColor,
                            )),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      );
    }),
  );
}
