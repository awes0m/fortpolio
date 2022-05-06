import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:som_official/utils/constants.dart';
import 'package:som_official/utils/screen_helper.dart';

final List<String> certificationsLogo = [
  "assets/brand1.png",
  "assets/brand2.png",
  "assets/brand3.png",
  "assets/brand4.png",
  "assets/brand5.png",
];

class CertificationsSection extends StatelessWidget {
  const CertificationsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(context, kDesktopMaxWidth),
      tablet: _buildUi(context, kTabletMaxWidth),
      mobile: _buildUi(context, getMobileMaxWidth(context)),
    );
  }
}

Widget _buildUi(BuildContext context, double width) {
  return Center(
      child: ResponsiveWrapper(
    minWidth: width,
    maxWidth: width,
    defaultScale: false,
    child: LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Wrap(
          runSpacing: 50,
          spacing: 50,
          children: certificationsLogo.map((logo) {
            return Container(
              height: 20.0,
              child: Image.asset(logo),
              constraints: BoxConstraints(
                maxWidth: ScreenHelper.isMobile(context)
                    //max 3 per row in mobile and 5 per row in desktop
                    ? constraints.maxWidth / 3 - 50.0
                    : constraints.maxWidth / 5 - 50.0,
              ),
            );
          }).toList(),
        );
      },
    ),
  ));
}
