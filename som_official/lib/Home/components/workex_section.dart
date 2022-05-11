import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:som_official/models/workex.dart';
import '../../../utils/constants.dart';
import '../../../utils/screen_helper.dart';

import '../../utils/globals.dart';
import 'component_item_lists/multiple_item_lists.dart';

/// a summary of my Work Experience
class WorkexSection extends StatelessWidget {
  const WorkexSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Globals.workexKey,
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
          /// Section Title- Work Experience
          Text(
            'WORK EXPERIENCE',
            style: GoogleFonts.oswald(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: kDangerColor,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 5.0), //White space 5
          ///lorem text
          Wrap(
            children: [
              /// Section description
              Container(
                constraints: const BoxConstraints(maxWidth: 300.0),
                child: const Text(
                    " Started my First Job as a Graphics Designer for a small company.I worked on designing and developing websites and web applications as an Intern.\nBefore finally joining Wipro Technologies as Security Analyst",
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
                  children: workexList
                      .map((workex) => SizedBox(
                            width: constraints.maxWidth / 2.0 - 20.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// Period/ Duration
                                Text(
                                  workex.period,
                                  style: GoogleFonts.oswald(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: kPrimaryColor,
                                  ),
                                ),
                                const SizedBox(height: 5.0), //White space 5
                                /// School/Institution
                                Text(
                                  workex.description,
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
                                        print('Tapped');
                                      },
                                      child: Text(
                                        workex.linkName,
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
