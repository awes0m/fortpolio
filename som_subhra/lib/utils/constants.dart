import 'package:flutter/material.dart';

const kHeroImage =
    "https://images.unsplash.com/photo-1487088678257-3a541e6e3922?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80";

var themeData = ThemeData(
  primarySwatch: Colors.blue,
  colorScheme: const ColorScheme(
    primary: Colors.blue,
    primaryVariant: Colors.blue,
    secondary: Colors.blueAccent,
    secondaryVariant: Colors.lightBlueAccent,
    surface: Colors.white,
    background: Colors.greenAccent,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    onBackground: Colors.white,
    onError: Colors.orange,
    brightness: Brightness.light,
  ),
);
