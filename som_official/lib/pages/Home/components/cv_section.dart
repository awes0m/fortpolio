import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:som_official/utils/constants.dart';
import 'package:som_official/utils/screen_helper.dart';

import 'component_item_lists/multiple_item_lists.dart';

class CvSection extends StatelessWidget {
  const CvSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ScreenHelper(
        desktop: _buildUI(context, 1000.0),
        tablet: _buildUI(context, 760.0),
        mobile: _buildUI(context, MediaQuery.of(context).size.width * .8),
      ),
    );
  }
}

Widget _buildUI(BuildContext context, double width) {
  // We need the context to get the screen size before the constrains below
  return ResponsiveWrapper(
    maxWidth: width,
    minWidth: width,
    defaultScale: false,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "BETTER EXPERIENCE \nBETTER SECURITY",
              style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 18.0,
                  height: 1.8),
            ),
            GestureDetector(
              onTap: () {
                print(" Download Cv clicked");
              },
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Text(
                  "Download CV",
                  style: GoogleFonts.oswald(
                      color: kPrimaryColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w800,
                      height: 1.8),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 50.0,
        ),
        Container(
          child: LayoutBuilder(
            builder: (_context, constraints) {
              return ResponsiveGridView.builder(
                padding: const EdgeInsets.all(0),
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                alignment: Alignment.topCenter,
                gridDelegate: ResponsiveGridDelegate(
                  // to set the size of the grid
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  maxCrossAxisExtent: ScreenHelper.isTablet(context) ||
                          ScreenHelper.isMobile(context)
                      ? constraints.maxWidth / 2
                      : 250.0, //direction of window all 4 horizontal if desktop/tablet or 2-2 vertical if mobile
                  //Hack to adjust child height
                  childAspectRatio: ScreenHelper.isDesktop(context)
                      ? 1.0
                      : MediaQuery.of(context).size.aspectRatio * 1.5,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: kSecondaryColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              designProcesses[index].imagePath,
                              width: 40.0,
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Text(
                              designProcesses[index].title,
                              style: GoogleFonts.oswald(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 20.0,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          designProcesses[index].subtitle,
                          style: const TextStyle(
                            color: kCaptionColor,
                            height: 1.5,
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: designProcesses.length,
              );
            },
          ),
        ),
      ],
    ),
  );
}
