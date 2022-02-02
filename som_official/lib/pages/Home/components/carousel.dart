//dependencies
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
//imports
import 'component_item_lists/carousel_items.dart';
import '../../../utils/constants.dart';
import '../../../utils/screen_helper.dart';

class Carousel extends StatelessWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CarouselController carouselController = CarouselController();

    double carouselContainerHeight = MediaQuery.of(context).size.height *
        (ScreenHelper.isMobile(context) ? .7 : .85); // 70% of the screen height

    return Container(
      height: carouselContainerHeight,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              alignment: Alignment.center,
              child: CarouselSlider(
                carouselController: carouselController,
                options: CarouselOptions(
                  // autoPlay: true, // Auto play the carousel slides
                  // autoPlayInterval: const Duration(seconds: 5), // every 5 seconds
                  viewportFraction: 1,
                  scrollPhysics: const NeverScrollableScrollPhysics(),
                  height: carouselContainerHeight,
                ),
                items: List.generate(
                  5,
                  (index) => Builder(
                    builder: (BuildContext context) {
                      return Container(
                        constraints: BoxConstraints(
                          minHeight: carouselContainerHeight,
                        ),
                        child: ScreenHelper(
                          desktop: _buildDesktop(
                              context,
                              carouselItems[index].text,
                              carouselItems[index].image),
                          mobile: _buildMobile(
                              context,
                              carouselItems[index].text,
                              carouselItems[index].image),
                          tablet: _buildTablet(
                              context,
                              carouselItems[index].text,
                              carouselItems[index].image),
                        ),
                      );
                    },
                  ),
                ).toList(),
              )),
        ],
      ),
      color: kSecondaryColor,
    );
  }
}

//For big Screens
Widget _buildDesktop(BuildContext context, Widget text, Widget image) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: 1000.0,
      minWidth: 1000.0,
      defaultScale: false,
      child: Row(
        children: [
          Expanded(child: text),
          Expanded(child: image),
        ],
      ),
    ),
  );
}

// for medium screens
Widget _buildTablet(BuildContext context, Widget text, Widget image) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: 760.0,
      minWidth: 760.0,
      defaultScale: false,
      child: Row(
        children: [
          Expanded(child: text),
          Expanded(child: image),
        ],
      ),
    ),
  );
}

//for Small screens
Widget _buildMobile(BuildContext context, Widget text, Widget image) {
  return Container(
    constraints: BoxConstraints(
      maxWidth: MediaQuery.of(context).size.width * .7,
    ),
    width: double.infinity,
    child: text,
  );
}
