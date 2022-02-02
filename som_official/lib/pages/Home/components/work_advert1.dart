import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:som_official/utils/constants.dart';
import 'package:som_official/utils/screen_helper.dart';

class WorkAdvert1 extends StatelessWidget {
  const WorkAdvert1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ScreenHelper(
      desktop: _buildUI(context, 1000.0),
      tablet: _buildUI(context, 760),
      mobile: _buildUI(context, MediaQuery.of(context).size.width * .8),
    ));
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
                child: Image.asset(
                  'assets/ios.png',
                  //set width to 0 to avoid Render errors in smaller screens
                  width: constraints.maxWidth > 720 ? null : 350.0,
                ),
              ),
              Expanded(
                flex: constraints.maxWidth > 720 ? 1 : 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cross-Platform App',
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
                    Text(
                      'TRAVEL SHOP APP',
                      style: GoogleFonts.oswald(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 35.0,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(
                      //White space 10
                      height: 10.0,
                    ),
                    Text(
                      'A travel shop app that helps you to find the best deals for your next trip.Lorem ipsum quatro tredemill , this is getting weird as i cant think of anything to write but i think this should be pretty long enough to be readable',
                      style: GoogleFonts.oswald(
                        color: kCaptionColor,
                        fontSize: 15.0,
                        height: 1.5,
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
                        SizedBox(
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
                                onPressed: () {},
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
