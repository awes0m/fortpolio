//dependencies
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter/material.dart';

import '../../../common/screen_helper.dart';
import '../../../constants/constants.dart';
import '../../../utils/utils.dart';
import '../items/carousel_items.dart';
//imports

class Carousel extends StatelessWidget {
  ///The first section of the resume, it contains the Name, the Job Title and short description of the person
  const Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    double carouselContainerHeight = MediaQuery.of(context).size.height *
        (ScreenHelper.isMobile(context) ? .9 : .95); // 70% of the screen height

    return Container(
      key: Globals.carouselKey,
      height: carouselContainerHeight,
      width: double.infinity,
      color: kSecondaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              alignment: Alignment.center,
              child: FlutterCarousel(
                options: FlutterCarouselOptions(
                  // autoPlay: true, // Auto play the carousel slides
                  autoPlayInterval:
                      const Duration(seconds: 5), // every 5 seconds
                  viewportFraction: 1.0,
                  physics: const NeverScrollableScrollPhysics(),
                  height: carouselContainerHeight,
                  enableInfiniteScroll: true,
                  showIndicator: false,
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
    );
  }
}

/// For big Screens
Widget _buildDesktop(BuildContext context, Widget text, Widget image) {
  return Center(
    child: Container(
      constraints: const BoxConstraints(
        maxWidth: kDesktopMaxWidth,
        minWidth: kDesktopMaxWidth,
      ),
      child: Row(
        children: [
          Expanded(child: text),
          Expanded(child: image),
        ],
      ),
    ),
  );
}

/// for medium screens
Widget _buildTablet(BuildContext context, Widget text, Widget image) {
  return Center(
    child: Container(
      constraints: const BoxConstraints(
        maxWidth: kTabletMaxWidth,
        minWidth: kTabletMaxWidth,
      ),
      child: Row(
        children: [
          Expanded(child: text),
          Expanded(child: image),
        ],
      ),
    ),
  );
}

/// for Small screens
Widget _buildMobile(BuildContext context, Widget text, Widget image) {
  return Container(
    constraints: BoxConstraints(
      maxWidth: getMaxWidth(context),
    ),
    width: double.infinity,
    child: text,
  );
}
