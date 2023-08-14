// ignore_for_file: public_member_api_docs, sort_constructors_first
//dependencies
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import '../../../common/screen_helper.dart';
import '../../../constants/constants.dart';
import '../../../constants/globals.dart';
import 'commons/bordered_text.dart';

class GameAdvert2 extends StatelessWidget {
  const GameAdvert2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Globals.workadvert2Key,
      child: ScreenHelper(
        desktop: _buildUI(context, kDesktopMaxWidth),
        tablet: _buildUI(context, kTabletMaxWidth),
        mobile: _buildUI(context, getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUI(BuildContext context, double width) {
    return Center(
      child: LayoutBuilder(builder: (context, constraints) {
        return ResponsiveWrapper(
          maxWidth: width,
          minWidth: width,
          defaultScale: false,
          child: Flex(
            direction: constraints.maxWidth > 720
                ? Axis.horizontal
                : Axis
                    .vertical, //directioon of window horizontal if desktop/tablet or vertical if mobile
            children: [
              //Disable Expanded for mobile to avoid Render errors by setting flex to 0
              Expanded(
                flex: constraints.maxWidth > 720 ? 1 : 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Responsive Offline Downladabe puzzle ',
                      style: GoogleFonts.oswald(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(
                      //White space 15
                      height: 15.0,
                    ),
                    const BorderedText(text: 'Sliderrr'),
                    const SizedBox(
                      //White space 10
                      height: 10.0,
                    ),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.oswald(
                          color: kCaptionColor,
                          fontSize: 15.0,
                          height: 1.5,
                        ),
                        text:
                            'Experience Mind-Bending Fun Anytime, Anywhere with Sliderrr: Your Ultimate Numbers Slider Game!',
                        children: [
                          TextSpan(
                            text:
                                '\n\nAvailiable for all screens and platforms',
                            style: GoogleFonts.oswald(
                              color: kCaptionColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.0,
                              height: 1.5,
                            ),
                          ),
                          TextSpan(
                            style: GoogleFonts.oswald(
                              fontStyle: FontStyle.italic,
                              color: kCaptionColor,
                              fontSize: 12.0,
                              height: 1.5,
                            ),
                            text:
                                '\n(Can be dowloaded as app directly from browser)',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      //White space 25
                      height: 25.0,
                    ),
                    Row(
                      children: [
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: kPrimaryColor,
                              ),
                              height: 48.0,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 28.0),
                              child: TextButton(
                                  onPressed: () {},
                                  child: const Center(
                                    child: Text(
                                      'Explore More',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ))),
                        ),
                        const SizedBox(
                          //White space 10
                          width: 10.0,
                        ),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: kPrimaryColor,
                                ),
                                color: kSecondaryColor,
                              ),
                              height: 48.0,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 28.0),
                              child: TextButton(
                                onPressed: () =>
                                    scrollToSection(Globals.educationKey),
                                child: const Center(
                                  child: Text(
                                    'NEXT >',
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                //White space 25
                height: 25.0,
              ),
              Expanded(
                flex: constraints.maxWidth > 720 ? 1 : 0,
                child: Image.asset(
                  'assets/sliderr.png',
                  fit: BoxFit.fitWidth,

                  //set width to 0 to avoid Render errors in smaller screens
                  width: constraints.maxWidth > 720 ? null : 350.0,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
