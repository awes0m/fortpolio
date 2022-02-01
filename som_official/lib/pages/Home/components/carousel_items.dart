//dependencies
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//imports
import '../../../models/carousel_item_model.dart';
import '../../../utils/constants.dart';

List<CarouselItemModel> carouselItems = List.generate(
  5,
  (index) => CarouselItemModel(
    text: Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'PRODUCT DESIGNER',
          style: GoogleFonts.oswald(
            color: kPrimaryColor,
            fontSize: 16.0,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(
          height: 18.0,
        ),
        Text(
          "SOM \nSUBHRA",
          style: GoogleFonts.oswald(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.w900,
            height: 1.3,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        const Text(
          'Network Security and Application dev expert based in Kolkata',
          style: TextStyle(
            color: kCaptionColor,
            fontSize: 15.0,
            height: 1.0,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Container(
          child: Wrap(
            children: [
              const Text(
                "Need a full custom website along with a custom application? ",
                style: TextStyle(
                  color: kCaptionColor,
                  fontSize: 15.0,
                  height: 1.5,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Text(
                    "Got a Project? Let's talk.",
                    style: TextStyle(
                      height: 1.5,
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 25.0,
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            height: 40.0,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "Get Started",
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
    image: Container(
      child: Image.asset(
        'assets/person.png',
        fit: BoxFit.contain,
      ),
    ),
  ),
);
