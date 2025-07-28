import 'package:flutter/material.dart';
import 'app.dart';
import 'src/configure_web.dart';
import 'src/json_service.dart';
import 'src/theme/config.dart';
import 'src/theme/custom_theme.dart';

void main() {
  configureApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(_onThemeChanged);
    jsonService.addListener(_onDataLoaded);
    _initializeApp();
  }

  void _onThemeChanged() {
    if (mounted) setState(() {});
  }

  void _onDataLoaded() {
    if (mounted) setState(() {});
  }

  Future<void> _initializeApp() async {
    await jsonService.init();
  }

  @override
  void dispose() {
    currentTheme.removeListener(_onThemeChanged);
    jsonService.removeListener(_onDataLoaded);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return JSONService.hasLoaded
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Som Subhra Pandit - Portfolio',
            theme: CustomTheme.lightTheme,
            darkTheme: CustomTheme.darkTheme,
            themeMode: currentTheme.currentTheme,
            home: const App(),
            // Add performance optimizations
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaler: TextScaler.linear(
                    MediaQuery.of(context)
                        .textScaler
                        .scale(1.0)
                        .clamp(0.8, 1.2),
                  ),
                ),
                child: child!,
              );
            },
          )
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(height: 16),
                    Text(
                      'Loading Portfolio...',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
