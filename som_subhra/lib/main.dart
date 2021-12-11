import 'package:flutter/material.dart';

import 'functions/noScrollGlow.dart';
import 'screens/scroll_screen_detail.dart';
import 'screens/scroll_screen_hero.dart';
import 'utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fortpolio',
      theme: themeData,
      home: const Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double _scrollPosition = 0;

//returns true to cancel notification bubbling
  bool updateOffsetAccordingToScroll(ScrollNotification scrollNotification) {
    if (scrollNotification is ScrollUpdateNotification) {
      setState(() => _scrollPosition = scrollNotification.metrics.pixels);
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Material(
      child: NotificationListener<ScrollNotification>(
        onNotification: updateOffsetAccordingToScroll,
        child: ScrollConfiguration(
          behavior: NoScrollGlow(),
          child: Stack(children: <Widget>[
            ScrollScreenHero(
                scrollPosition: _scrollPosition, height: height, width: width),
            ScrollScreenDetail(height: height, width: width)
          ]),
        ),
      ),
    );
  }
}
