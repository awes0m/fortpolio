//dependencies
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:som_official/utils/constants.dart';
//imports
import '../../models/testimonial.dart';
import '../../utils/globals.dart';
import '../../utils/screen_helper.dart';

final List<Testimonial> testimonials = [
  Testimonial(
    personname: 'jENNY DOE',
    profilephoto: 'assets/female.png',
    text: "Lovely app, I'm using it everyday. I'm a big fan of it.",
    occupation: "PRODUCT DESIGNER",
  ),
  Testimonial(
      personname: 'KEN WILLIAMS',
      profilephoto: 'assets/male.png',
      text: "Lovely app, I'm using it everyday. I'm a big fan of it.",
      occupation: "PRODUCT DESIGNER"),
];

class Testimonials extends StatelessWidget {
  const Testimonials({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Globals.testimonialsKey,
      child: ScreenHelper(
        desktop: _buildUI(context, kDesktopMaxWidth),
        tablet: _buildUI(context, kTabletMaxWidth),
        mobile: _buildUI(context, getMobileMaxWidth(context)),
      ),
    );
  }
}

Widget _buildUI(BuildContext context, double width) {
  return Center(child: LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) {
      return ResponsiveWrapper(
          maxWidth: width,
          minWidth: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "TESTIMONIALS",
                style: GoogleFonts.oswald(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  height: 1.3,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ), //space between text and image 5
              Container(
                constraints: const BoxConstraints(
                  maxWidth: 400.0,
                ),
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text:
                            'This is the Portfolio section. It is a place where you can showcase your work. You can have a look at my works here',
                        style: TextStyle(
                          color: Colors.white,
                          height: 1.3,
                        ),
                      ),
                      TextSpan(
                        text: "\nClick here to contact us!",
                        style: GoogleFonts.oswald(
                          fontWeight: FontWeight.w700,
                          color: kPrimaryColor,
                          height: 1.8,
                        ),
                      ),
                      TextSpan(
                        text: "\nPlease subscribe to my youtube channel!",
                        style: GoogleFonts.oswald(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          height: 1.8,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Flex(
                direction: ScreenHelper.isMobile(context)
                    ? Axis.vertical
                    : Axis.horizontal,
                children: testimonials.map((testimonial) {
                  return Expanded(
                    flex: ScreenHelper.isMobile(context) ? 0 : 1,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 50.0),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Image.asset(
                              "assets/quote.png",
                              width: 50.0,
                            ),
                          ),
                          const SizedBox(
                            //space between 10
                            height: 15.0,
                          ),
                          Text(
                            testimonial.text,
                            style: const TextStyle(
                              color: kCaptionColor,
                              height: 1.8,
                            ),
                          ),
                          const SizedBox(
                            //space between 10
                            height: 15.0,
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 25.0,
                                backgroundColor: Colors.transparent,
                                backgroundImage:
                                    AssetImage(testimonial.profilephoto),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    testimonial.personname,
                                    style: GoogleFonts.oswald(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Text(
                                    testimonial.occupation,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4.0,
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ));
    },
  ));
}
