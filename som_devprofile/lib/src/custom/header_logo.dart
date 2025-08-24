//dependencies
import 'package:flutter/material.dart';
//imports
import 'package:google_fonts/google_fonts.dart';

class HeaderLogo extends StatelessWidget {
  /// Header logo widget
  const HeaderLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            // print(' Logo Tapped');
          },
          child: RichText(
            selectionColor: Theme.of(context).scaffoldBackgroundColor,
            text: TextSpan(children: [
              TextSpan(
                  text: r"$",
                  style: GoogleFonts.syneTactile(
                    fontStyle: FontStyle.italic,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  )),
              TextSpan(
                  text: "o",
                  style: GoogleFonts.comforter(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  )),
              TextSpan(
                  text: "M",
                  style: GoogleFonts.comforter(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  )),
            ]),
          ),
        ),
      ),
    );
  }
}
