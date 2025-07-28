import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:url_launcher/url_launcher_string.dart';

import '../../../common/common.dart';
import '../../../constants/constants.dart';
import '../../../utils/utils.dart';

class AppAdvert1 extends StatelessWidget {
  const AppAdvert1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Globals.workadvert1Key,
      child: ScreenHelper(
        desktop: _buildUI(context, kDesktopMaxWidth),
        tablet: _buildUI(context, kTabletMaxWidth),
        mobile: _buildUI(context, getMaxWidth(context)),
      ),
    );
  }

  Widget _buildUI(BuildContext context, double width) {
    return Center(
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          constraints: BoxConstraints(
            maxWidth: width,
            minWidth: width,
          ),
          child: Flex(
            direction: constraints.maxWidth > 720
                ? Axis.horizontal
                : Axis
                    .vertical, //directioon of window horizontal if desktop/tablet or vertical if mobile
            children: [
              //Disable Expanded for mobile to avoid Render errors by setting flex to 0
              Expanded(
                flex: constraints.maxWidth > 700 ? 1 : 0,
                child: Image.asset(
                  'assets/winapps.png',
                  //set width to 0 to avoid Render errors in smaller screens
                  width: constraints.maxWidth > 700 ? null : 300.0,
                  height: getMaxheight(context),
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                flex: constraints.maxWidth > 720 ? 1 : 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Windows App-Built With Python',
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
                    const BorderedText(
                      text: 'Drum-ru and Pyiano',
                    ),
                    const SizedBox(
                      //White space 10
                      height: 10.0,
                    ),
                    Text(
                      'Try out this Virtual Drum Set with adjustable RPM, beats . Can save and load beats created \nor\n Try out this Virual Piano with all the notes and tones in placed systematically and can be played with any ordinary PC Keyboard.',
                      style: GoogleFonts.oswald(
                        color: kCaptionColor,
                        fontSize: 15.0,
                        height: 1.5,
                      ),
                    ),
                    const Text('\n(Avaliable for windows only)'),
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
                                  onPressed: () => launchUrlString(
                                      'https://awes0m.itch.io/'),
                                  child: const Center(
                                    child: Text(
                                      'Download from Itch.io',
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
                                    scrollToSection(Globals.workadvert2Key),
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
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
