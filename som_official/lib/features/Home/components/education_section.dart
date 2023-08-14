import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../common/screen_helper.dart';
import '../../../constants/constants.dart';
import '../../../constants/globals.dart';
import 'items/multiple_item_lists.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Globals.educationKey,
      child: ScreenHelper(
        desktop: _buildUi(context, kDesktopMaxWidth),
        tablet: _buildUi(context, kTabletMaxWidth),
        mobile: _buildUi(context, getMobileMaxWidth(context)),
      ),
    );
  }
}

Widget _buildUi(BuildContext context, double width) {
  return Container(
    alignment: Alignment.center,
    child: ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /// Section Title- EDUCATION
          Text(
            'EDUCATION',
            style: GoogleFonts.oswald(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: kDangerColor,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 5.0), //White space 5
          ///Section Description text
          Wrap(
            children: [
              /// Section description
              Container(
                constraints: const BoxConstraints(maxWidth: 300.0),
                child: const Text(
                    "Educated in Sciences for foundation, holding a degree in Engineering that has equipped me with a structured and analytical mindset,deep curiosity and a rigorous approach to problem-solving",
                    style: TextStyle(
                      color: kDangerColor,
                      height: 1.5,
                    )),
              ),
            ],
          ),
          const SizedBox(height: 40), //White space 40
          /// Displays individual item's Period, Title, and Description
          LayoutBuilder(
            builder: (context, constraints) {
              return SizedBox(
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: educationList
                      .map((education) => SizedBox(
                            width: constraints.maxWidth / 2.0 - 20.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// Period/ Duration
                                Text(
                                  education.period,
                                  style: GoogleFonts.oswald(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: kPrimaryColor,
                                  ),
                                ),
                                const SizedBox(height: 5.0), //White space 5
                                /// School/Institution
                                Text(
                                  education.description,
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: kCaptionColor,
                                    height: 1.5,
                                  ),
                                ),
                                const SizedBox(height: 20.0), //White space 20
                                /// Link /Website
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                      onTap: () {
                                        // TODO: Link to website
                                      },
                                      child: Text(
                                        education.linkName,
                                        style: const TextStyle(
                                          color: kDangerColor,
                                        ),
                                      )),
                                ),
                                const SizedBox(height: 40.0), //White space 40
                              ],
                            ),
                          ))
                      .toList(),
                ),
              );
            },
          )
        ],
      ),
    ),
  );
}
