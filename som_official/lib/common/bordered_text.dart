import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/constants.dart';

class BorderedText extends StatelessWidget {
  final String text;
  const BorderedText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: GoogleFonts.oswald(
            fontWeight: FontWeight.w900,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 4
              ..color = kDangerColor,
            fontSize: 35.0,
            height: 1.3,
          ),
        ),
        Text(
          text,
          style: GoogleFonts.oswald(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 35.0,
            height: 1.3,
          ),
        ),
      ],
    );
  }
}
