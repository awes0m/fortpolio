import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:som_devprofile/src/home/resume.dart';
import 'data.dart';

class IntroSection extends StatefulWidget {
  const IntroSection({
    Key? key,
    required this.isMobile,
    required this.context,
  }) : super(key: key);

  final bool isMobile;
  final BuildContext context;

  @override
  State<IntroSection> createState() => _IntroSectionState();
}

class _IntroSectionState extends State<IntroSection> {
  final String data = name();
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: widget.isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(data.split(' ').length, (int i) {
                  return SizedBox(
                    width: width - width * 0.4,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Text(
                        data.split(' ')[i],
                        textScaler: const TextScaler.linear(2.5),
                        style: GoogleFonts.novaMono(
                          // letterSpacing: 10.5,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  );
                }),
              )
            //desktop
            : Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(data.split(' ').length, (int i) {
                      return SizedBox(
                        width: width - width * 0.8,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Text(
                            data.split(' ')[i],
                            textScaler: const TextScaler.linear(2.5),
                            style: GoogleFonts.novaMono(
                              // letterSpacing: 10.5,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(width: width / 2.5),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        onHover: (bool value) {
                          setState(() {
                            isHover = value;
                          });
                        },
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: ClipOval(
                            child: data[2] != ''
                                ? Image.asset('assets/contact_me/personal.png',
                                    scale: 0.9)
                                : Image.asset(
                                    'assets/contact_me/constant/picture.png',
                                    scale: 3)),
                      ),
                      const SizedBox(height: 50),
                      const Resume(width: 40),
                    ],
                  ),
                ],
              ));
  }
}
