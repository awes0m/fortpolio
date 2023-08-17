//dependencies

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';
//imports

import '../../../constants/constants.dart';
// ignore: unnecessary_import
import '../../../constants/globals.dart';
import '../../contact_form/contact_form.dart';
import '../models/carousel_item_model.dart';

List<CarouselItemModel> carouselItems = List.generate(
  5,
  (index) => CarouselItemModel(
    text: SizedBox(

        /// All Left side text
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        /// NETWORK ENGINEER/ DEVELOPER text
        Text(
          'NETWORK ENGINEER/ \nDEVELOPER',
          style: GoogleFonts.oswald(
            color: kPrimaryColor,
            fontSize: 16.0,
            fontWeight: FontWeight.w900,
          ),
        ),
        //WhiteSpace
        const SizedBox(height: 18.0),

        /// SOM SUBHRA
        Text(
          "SOM SUBHRA",
          style: GoogleFonts.oswald(
            color: kDangerColor,
            fontSize: 40,
            fontWeight: FontWeight.w900,
            height: 1.3,
          ),
        ),
        //WhiteSpace
        const SizedBox(height: 10.0),

        /// Describing txt
        const Text(
          'CyberSecurity Engineer and Cross-Platform developer , Pan-India',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            color: kCaptionColor,
            fontSize: 15.0,
            height: 1.0,
          ),
        ),
        //WhiteSpace
        const SizedBox(height: 20.0),

        /// Sale Pitch and Contact Button
        SizedBox(
          child: Wrap(
            children: [
              const Text(
                "Experienced in both Cybersecurity and Web Development, I bring a strong background in Network Security, SIEM, Vulnerability Management, and Fullstack Development to the table.\n\n Proficient in a diverse range of programming languages, I embody the qualities of an enthusiastic Go-getter, consistently seeking out challenges and thriving on the need for continuous innovation. ",
                style: TextStyle(
                  color: kCaptionColor,
                  fontSize: 15.0,
                  height: 1.5,
                ),
              ),
              //WhiteSpace
              const SizedBox(height: 20.0),

              /// Contact me texts and buttons
              GestureDetector(
                onTap: () => Navigator.restorablePopAndPushNamed(
                    Globals.navigatorKey.currentContext!,
                    ContactFormPage.routeName),
                child: const MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Text(
                    "Got a Project? Let's talk.",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      height: 1.5,
                      color: kPrimaryColor,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        //WhiteSpace
        const SizedBox(height: 25.0),

        /// Get Started Button
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            height: 40.0,
            child: TextButton(
              //Get Started text button
              onPressed: () => launchUrlString('https://github.com/awes0m'),
              child: const Text(
                "Visit Github",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        )
      ],
    )),

    /// Right side image
    image: SizedBox(
      child: Image.asset(
        'assets/personal.png',
        fit: BoxFit.contain,
      ),
    ),
  ),
);
