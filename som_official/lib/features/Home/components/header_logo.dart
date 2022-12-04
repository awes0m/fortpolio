//dependencies
import 'package:flutter/material.dart';
//imports
import 'package:google_fonts/google_fonts.dart';
import 'package:som_official/utils/constants.dart';

class HeaderLogo extends StatelessWidget {
  /// Header logo widget
  const HeaderLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            print(' Logo Tapped');
          },
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: r"$",
                  style: GoogleFonts.syneTactile(
                    // fontStyle: FontStyle.italic,
                    color: kDangerColor,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  )),
              TextSpan(
                  text: "o",
                  style: GoogleFonts.comforter(
                    color: kDangerColor,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  )),
              TextSpan(
                  text: "M",
                  style: GoogleFonts.comforter(
                    color: kDangerColor,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  )),
            ]),
          ),
        ),
      ),
    );
  }
}
