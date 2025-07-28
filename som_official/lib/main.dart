// imports
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:som_official/presentation/views/contact_form_view.dart';

import 'constants/constants.dart';
import 'presentation/views/home_view.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Som Subhra", //title text
      debugShowCheckedModeBanner: false, //remove debug banner
      themeMode: ThemeMode.dark, //set theme mode
      darkTheme: Theme.of(context).copyWith(
        platform: TargetPlatform.android, //set platform
        scaffoldBackgroundColor: kSecondaryColor,
        primaryColor: kPrimaryColor,
        canvasColor: kSecondaryColor,
        textTheme: GoogleFonts.latoTextTheme(), //set text theme
      ),
      builder: (context, widget) => ResponsiveBreakpoints.builder(
        child: ClampingScrollWrapper.builder(context, widget!),
        breakpoints: [
          const Breakpoint(start: 0, end: 479, name: MOBILE),
          const Breakpoint(start: 480, end: 799, name: TABLET),
          const Breakpoint(start: 800, end: 1199, name: DESKTOP),
          const Breakpoint(start: 1200, end: double.infinity, name: "4K"),
        ],
      ),
      initialRoute: HomeView.routeName,
      navigatorKey: Globals.navigatorKey,
      routes: {
        HomeView.routeName: (context) => const HomeView(),
        ContactFormView.routeName: (context) => const ContactFormView(),
      },
      //set home page
    );
  }
}
