import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_view/photo_view.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:super_tooltip/super_tooltip.dart';

import '../../../common/screen_helper.dart';
import '../../../constants/constants.dart';
import '../../../utils/utils.dart';

class CertificationsSection extends StatefulWidget {
  const CertificationsSection({Key? key}) : super(key: key);

  @override
  State<CertificationsSection> createState() => _CertificationsSectionState();
}

class _CertificationsSectionState extends State<CertificationsSection> {
  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(context, kDesktopMaxWidth),
      tablet: _buildUi(context, kTabletMaxWidth),
      mobile: _buildUi(context, getMaxWidth(context)),
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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// Section Title- CERTIFICATIONS
            Text(
              'CERTIFICATIONS',
              style: GoogleFonts.oswald(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: kDangerColor,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 30),
            Wrap(
              runSpacing: 50,
              spacing: 50,
              children: certificationsList.map((certificate) {
                return SuperTooltip(
                  content: SizedBox(
                    width: getMaxWidth(context) / 2,
                    height: getMaxheight(context) * .7,
                    child: ListView(
                      children: [
                        Text(certificate.title),
                        SizedBox(
                          height: getMaxheight(context) * .7 - 50,
                          child: PhotoView(
                            imageProvider: AssetImage(
                              certificate.imagePath,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  child: Container(
                    height: 70.0,
                    child: Image.asset(certificate.logoImagePath),
                    constraints: BoxConstraints(
                      maxWidth: ScreenHelper.isMobile(context)
                          //max 3 per row in mobile and 5 per row in desktop
                          ? constraints.maxWidth / 3 - 50.0
                          : constraints.maxWidth / 5 - 50.0,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 70),
            Text(
              'PORTFOLIO APPS',
              style: GoogleFonts.oswald(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: kDangerColor,
                height: 1.3,
              ),
            )
          ],
        );
      },
    ),
  ));
}
