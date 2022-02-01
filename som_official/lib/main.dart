import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:som_official/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Som Subhra",
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: Theme.of(context).copyWith(
        platform: TargetPlatform.android,
        scaffoldBackgroundColor: kSecondaryColor,
        primaryColor: kPrimaryColor,
        canvasColor: kSecondaryColor,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
    );
  }
}
