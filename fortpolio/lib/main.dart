import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'theme/app_theme.dart';
import 'pages/landing_page.dart';
import 'pages/painting_detail_page.dart';
import 'pages/hero_page.dart';

void main() {
  // Riverpod root scope
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // ROUTING: Default Flutter routing with onGenerateRoute to support /painting/:id
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Walkman Gallery',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      // Named routes
      routes: {
        '/': (context) => const HeroPage(), // initial: Hero/About page
        '/gallery': (context) => const LandingPage(),
      },
      // Handle dynamic routes like /painting/:id
      onGenerateRoute: (settings) {
        final name = settings.name ?? '/';
        if (name.startsWith('/painting/')) {
          final id = name.split('/').last;
          return PageRouteBuilder(
            settings: settings,
            pageBuilder: (_, __, ___) => PaintingDetailPage(itemId: id),
            transitionsBuilder: (_, animation, __, child) {
              // Smooth fade transition between pages
              return FadeTransition(opacity: animation, child: child);
            },
          );
        }
        // Fallback
        return MaterialPageRoute(builder: (_) => const HeroPage());
      },
    );
  }
}
