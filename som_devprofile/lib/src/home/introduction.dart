import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Introduction extends StatelessWidget {
  const Introduction({
    Key? key,
    required this.word,
    required this.textScaleFactor,
  }) : super(key: key);

  final String word;
  final double textScaleFactor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Text(
        word,
        textScaler: TextScaler.linear(textScaleFactor),
        style: GoogleFonts.dmMono(
          letterSpacing: 2,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
