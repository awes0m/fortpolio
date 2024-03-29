import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../../common/screen_helper.dart';
import '../../../constants/constants.dart';
import '../../../utils/utils.dart';
import '../items/user_details_lists.dart';

class CvSection extends StatelessWidget {
  const CvSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: Globals.cvSectionKey,
      width: double.infinity,
      child: ScreenHelper(
        desktop: _buildUI(context, kDesktopMaxWidth),
        tablet: _buildUI(context, kTabletMaxWidth),
        mobile: _buildUI(context, getMaxWidth(context)),
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
              "CODING CONFIDENCE \nCRAFTING SECURITY",
              style: GoogleFonts.oswald(
                  color: kDangerColor,
                  fontWeight: FontWeight.w800,
                  fontSize: 18.0,
                  height: 1.8),
            ),

            /// download CV- Link to Google Drive CV
            GestureDetector(
              onTap: () {
                // print(" Download Cv clicked");
                launchUrl(Uri.parse(cvDownloadUrl));
              },
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: kPrimaryColor,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
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
            ),
          ],
        ),
        const SizedBox(height: 50.0),
        SizedBox(
          child: LayoutBuilder(
            builder: (_context, constraints) {
              return ResponsiveGridView.builder(
                padding: const EdgeInsets.all(0),
                shrinkWrap: true,
                //Now to disable GridView's scrolling
                physics: const NeverScrollableScrollPhysics(),
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
                                color: kDangerColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 20.0,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 15.0),
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
