import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../utils/constants.dart';
import '../../../utils/screen_helper.dart';

import '../../utils/globals.dart';
import 'component_item_lists/multiple_item_lists.dart';

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
          Text(
            'EDUCATION',
            style: GoogleFonts.oswald(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              height: 1.3,
            ),
          ),
          const SizedBox(
            //White space 5
            height: 5.0,
          ),
          //lorem text
          Wrap(
            children: [
              Container(
                constraints: const BoxConstraints(maxWidth: 300.0),
                child: const Text(
                    "Lorem ipsum quatro tredemill , this is getting weird as i cant think of anything to write but i think this should be pretty long enough to be readable ",
                    style: TextStyle(
                      color: Colors.white,
                      height: 1.5,
                    )),
              ),
            ],
          ),
          const SizedBox(
            //White space 40
            height: 40,
          ),
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
                                Text(
                                  education.period,
                                  style: GoogleFonts.oswald(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  //White space 5
                                  height: 5.0,
                                ),
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
                                const SizedBox(
                                  //White space 20
                                  height: 20.0,
                                ),
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                      onTap: () {
                                        print('Tapped');
                                      },
                                      child: Text(
                                        education.linkName,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      )),
                                ),
                                const SizedBox(
                                  //White space 40
                                  height: 40.0,
                                ),
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
