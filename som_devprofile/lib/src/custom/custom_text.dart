import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key,
      required this.text,
      required this.fontSize,
      this.isTextAlignCenter = true,
      required this.color})
      : super(key: key);

  final String text;
  final Color color;
  final double fontSize;
  final bool isTextAlignCenter;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: isTextAlignCenter ? TextAlign.center : TextAlign.left,
        style: GoogleFonts.ubuntuCondensed(
          letterSpacing: 2,
          fontSize: fontSize,
          color: color,
          fontWeight: FontWeight.w500,
        ));
  }
}
