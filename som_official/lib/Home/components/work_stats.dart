import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:som_official/models/stats.dart';
import 'package:som_official/utils/constants.dart';
import 'package:som_official/utils/screen_helper.dart';

List<Stat> stats = [
  Stat(count: "3", text: "Companies"),
  Stat(count: "3", text: "Projects"),
  Stat(count: "10", text: "Certifications"),
  Stat(count: "3", text: "Years\nexperience"),
];

class WorkStats extends StatelessWidget {
  const WorkStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ScreenHelper(
        desktop: _buildUI(context, kDesktopMaxWidth),
        tablet: _buildUI(context, kTabletMaxWidth),
        mobile: _buildUI(context, getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUI(BuildContext context, double width) {
    return SizedBox(
      child: ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        defaultScale: false,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Wrap(
              spacing: 20.0,
              runSpacing: 20.0,
              children: stats.map((stat) {
                int index = stats.indexOf(stat);
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  //direction of window all 4 horizontal if desktop/tablet or 2-2 vertical if mobile
                  width: ScreenHelper.isMobile(context)
                      ? constraints.maxWidth / 2 - 20
                      : constraints.maxWidth / 4 - 20,
                  height: 100,
                  color: kSecondaryColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        stats[index].count,
                        style: GoogleFonts.oswald(
                          fontSize: 32.0,
                          fontWeight: FontWeight.w700,
                          color: kPrimaryColor,
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Text(
                        stats[index].text,
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: kCaptionColor,
                        ),
                      )
                    ],
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
