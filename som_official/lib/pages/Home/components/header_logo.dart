//dependencies
import 'package:flutter/material.dart';
//imports
import 'package:google_fonts/google_fonts.dart';

//header logo widget
class HeaderLogo extends StatelessWidget {
  const HeaderLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  )),
              TextSpan(
                  text: ".",
                  style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  )),
              TextSpan(
                  text: "m",
                  style: GoogleFonts.oswald(
                    color: Colors.white,
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
