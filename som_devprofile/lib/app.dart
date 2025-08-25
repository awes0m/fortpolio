import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'src/navigation/nav_bar.dart';
import 'src/navigation/bottom_nav_bar.dart';
import 'src/animations/section_animation.dart';
import 'theme/theme_button.dart';
import 'tabs/tabs.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static const double _breakpoint = 1000.0;
  static const int _itemCount = 7;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isDesktop = constraints.maxWidth >= _breakpoint;

        return Scaffold(
          appBar: isDesktop ? _buildAppBar(context) : null,
          floatingActionButton:
              !isDesktop ? _buildFloatingActionButton(context) : null,
          body: _buildBody(context, isDesktop),
          bottomNavigationBar: !isDesktop ? const BottomNavBar() : null,
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
      child: const NavBar(isDarkModeBtnVisible: true),
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: const ThemeButton(),
    );
  }

  Widget _buildBody(BuildContext context, bool isDesktop) {
    return ScrollablePositionedList.builder(
      physics: const BouncingScrollPhysics(),
      // Remove minCacheExtent: double.infinity for better performance
      minCacheExtent: MediaQuery.of(context).size.height * 2,
      shrinkWrap: false, // Better performance
      itemCount: _itemCount,
      itemScrollController: scroll,
      itemPositionsListener: itemPositionsListener,
      itemBuilder: (context, index) {
        // Add key for better performance during rebuilds
        return KeyedSubtree(
          key: ValueKey('section_$index'),
          child: AnimatedSection(
            delay: Duration(milliseconds: index * 200),
            animationType: _getAnimationType(index),
            child: webHeaderList[index],
          ),
        );
      },
    );
  }

  AnimationType _getAnimationType(int index) {
    switch (index) {
      case 0: // Home
        return AnimationType.fadeInUp;
      case 1: // What I Do
        return AnimationType.scaleIn;
      case 2: // Education
        return AnimationType.fadeInUp;
      case 3: // Experience
        return AnimationType.typewriter;
      case 4: // Projects
        return AnimationType.scaleIn;
      case 5: // Certifications
        return AnimationType.fadeInUp;
      case 6: // Contact
        return AnimationType.fadeIn;
      default:
        return AnimationType.fadeInUp;
    }
  }
}
