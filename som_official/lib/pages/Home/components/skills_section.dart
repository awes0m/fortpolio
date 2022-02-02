//dependencies
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
//imports
import 'component_item_lists/multiple_item_lists.dart';
import '../../../utils/constants.dart';
import '../../../utils/screen_helper.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        mobile: _buildUi(context, MediaQuery.of(context).size.width * .8),
        desktop: _buildUi(context, 1000),
        tablet: _buildUi(context, 760),
      ),
    );
  }
}

Widget _buildUi(BuildContext context, double width) {
  return Center(
    child: LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            child: Flex(
              direction: ScreenHelper.isMobile(context)
                  ? Axis.vertical
                  : Axis.horizontal,
              children: [
                Expanded(
                  flex: ScreenHelper.isMobile(context) ? 0 : 2,
                  child: Image.asset(
                    "assets/person_small.png",
                    width: 300.0,
                  ),
                ),
                const SizedBox(
                  //horizontal spacing 50
                  width: 50.0,
                ),
                Expanded(
                    flex: ScreenHelper.isMobile(context) ? 0 : 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Skills",
                          style: GoogleFonts.oswald(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 28.0,
                            height: 1.3,
                          ),
                        ),
                        const SizedBox(
                          //vertical spacing 10
                          height: 10,
                        ),
                        const Text(
                          "This is all the skills listed below ,more will be added in due time",
                          style: TextStyle(
                            color: kCaptionColor,
                            fontSize: 16.0,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(
                          //vertical spacing 15
                          height: 15,
                        ),
                        Column(
                          children: skills
                              .map((skill) => Container(
                                    margin: const EdgeInsets.only(bottom: 15.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: skill.percentage,
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                                left: 10.0),
                                            alignment: Alignment.centerLeft,
                                            height: 38.0,
                                            child: Text(skill.skillName),
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        Expanded(
                                          //remaining Blank part
                                          flex: 100 - skill.percentage,
                                          child: const Divider(
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(
                                          //vertical spacing 10
                                          width: 10.0,
                                        ),
                                        Text("${skill.percentage}%",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.0,
                                              height: 1.5,
                                            ))
                                      ],
                                    ),
                                  ))
                              .toList(),
                        )
                      ],
                    ))
              ],
            ));
      },
    ),
  );
}
