import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff000000),
      surfaceTint: Color(0xff4e6449),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff0c200b),
      onPrimaryContainer: Color(0xff728a6d),
      secondary: Color(0xff586154),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffdce6d5),
      onSecondaryContainer: Color(0xff5e675a),
      tertiary: Color(0xff000000),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff0e1d2b),
      onTertiaryContainer: Color(0xff778597),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffbf9f5),
      onSurface: Color(0xff1b1c1a),
      onSurfaceVariant: Color(0xff434841),
      outline: Color(0xff747970),
      outlineVariant: Color(0xffc3c8be),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff30312e),
      inversePrimary: Color(0xffb4cead),
      primaryFixed: Color(0xffd0eac8),
      onPrimaryFixed: Color(0xff0c200b),
      primaryFixedDim: Color(0xffb4cead),
      onPrimaryFixedVariant: Color(0xff364c33),
      secondaryFixed: Color(0xffdce6d5),
      onSecondaryFixed: Color(0xff151e14),
      secondaryFixedDim: Color(0xffc0c9ba),
      onSecondaryFixedVariant: Color(0xff40493d),
      tertiaryFixed: Color(0xffd5e4f8),
      onTertiaryFixed: Color(0xff0e1d2b),
      tertiaryFixedDim: Color(0xffb9c8dc),
      onTertiaryFixedVariant: Color(0xff3a4858),
      surfaceDim: Color(0xffdbdad6),
      surfaceBright: Color(0xfffbf9f5),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff5f4ef),
      surfaceContainer: Color(0xffefeeea),
      surfaceContainerHigh: Color(0xffe9e8e4),
      surfaceContainerHighest: Color(0xffe3e2de),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff000000),
      surfaceTint: Color(0xff4e6449),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff0c200b),
      onPrimaryContainer: Color(0xff95ae8e),
      secondary: Color(0xff30392d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff667062),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff000000),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff0e1d2b),
      onTertiaryContainer: Color(0xff99a8bb),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffbf9f5),
      onSurface: Color(0xff10120f),
      onSurfaceVariant: Color(0xff333831),
      outline: Color(0xff4f544c),
      outlineVariant: Color(0xff6a6e66),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff30312e),
      inversePrimary: Color(0xffb4cead),
      primaryFixed: Color(0xff5c7357),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff445a40),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff667062),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff4e574b),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff606e80),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff485667),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc7c6c3),
      surfaceBright: Color(0xfffbf9f5),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff5f4ef),
      surfaceContainer: Color(0xffe9e8e4),
      surfaceContainerHigh: Color(0xffdeddd9),
      surfaceContainerHighest: Color(0xffd2d2ce),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff000000),
      surfaceTint: Color(0xff4e6449),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff0c200b),
      onPrimaryContainer: Color(0xffbed7b6),
      secondary: Color(0xff262e24),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff434c40),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff000000),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff0e1d2b),
      onTertiaryContainer: Color(0xffc3d2e6),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffbf9f5),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff292d27),
      outlineVariant: Color(0xff464b43),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff30312e),
      inversePrimary: Color(0xffb4cead),
      primaryFixed: Color(0xff394f35),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff233820),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff434c40),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff2c352a),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff3c4a5b),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff263443),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb9b9b5),
      surfaceBright: Color(0xfffbf9f5),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f1ec),
      surfaceContainer: Color(0xffe3e2de),
      surfaceContainerHigh: Color(0xffd5d4d0),
      surfaceContainerHighest: Color(0xffc7c6c3),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffb4cead),
      surfaceTint: Color(0xffb4cead),
      onPrimary: Color(0xff20351e),
      primaryContainer: Color(0xff000f01),
      onPrimaryContainer: Color(0xff698064),
      secondary: Color(0xffc0c9ba),
      onSecondary: Color(0xff2a3328),
      secondaryContainer: Color(0xff424c40),
      onSecondaryContainer: Color(0xffb1bbac),
      tertiary: Color(0xffb9c8dc),
      onTertiary: Color(0xff233241),
      tertiaryContainer: Color(0xff000c1a),
      onTertiaryContainer: Color(0xff6d7b8d),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff121412),
      onSurface: Color(0xffe3e2de),
      onSurfaceVariant: Color(0xffc3c8be),
      outline: Color(0xff8d9289),
      outlineVariant: Color(0xff434841),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe3e2de),
      inversePrimary: Color(0xff4e6449),
      primaryFixed: Color(0xffd0eac8),
      onPrimaryFixed: Color(0xff0c200b),
      primaryFixedDim: Color(0xffb4cead),
      onPrimaryFixedVariant: Color(0xff364c33),
      secondaryFixed: Color(0xffdce6d5),
      onSecondaryFixed: Color(0xff151e14),
      secondaryFixedDim: Color(0xffc0c9ba),
      onSecondaryFixedVariant: Color(0xff40493d),
      tertiaryFixed: Color(0xffd5e4f8),
      onTertiaryFixed: Color(0xff0e1d2b),
      tertiaryFixedDim: Color(0xffb9c8dc),
      onTertiaryFixedVariant: Color(0xff3a4858),
      surfaceDim: Color(0xff121412),
      surfaceBright: Color(0xff383937),
      surfaceContainerLowest: Color(0xff0d0f0c),
      surfaceContainerLow: Color(0xff1b1c1a),
      surfaceContainer: Color(0xff1f201e),
      surfaceContainerHigh: Color(0xff292a28),
      surfaceContainerHighest: Color(0xff343532),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffcae4c2),
      surfaceTint: Color(0xffb4cead),
      onPrimary: Color(0xff162a14),
      primaryContainer: Color(0xff7f9779),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffd5dfcf),
      onSecondary: Color(0xff1f281d),
      secondaryContainer: Color(0xff8a9485),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffcfdef2),
      onTertiary: Color(0xff182736),
      tertiaryContainer: Color(0xff8392a4),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff121412),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd9ded4),
      outline: Color(0xffafb3aa),
      outlineVariant: Color(0xff8d9289),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe3e2de),
      inversePrimary: Color(0xff384d34),
      primaryFixed: Color(0xffd0eac8),
      onPrimaryFixed: Color(0xff031503),
      primaryFixedDim: Color(0xffb4cead),
      onPrimaryFixedVariant: Color(0xff263b24),
      secondaryFixed: Color(0xffdce6d5),
      onSecondaryFixed: Color(0xff0b130a),
      secondaryFixedDim: Color(0xffc0c9ba),
      onSecondaryFixedVariant: Color(0xff30392d),
      tertiaryFixed: Color(0xffd5e4f8),
      onTertiaryFixed: Color(0xff041220),
      tertiaryFixedDim: Color(0xffb9c8dc),
      onTertiaryFixedVariant: Color(0xff293747),
      surfaceDim: Color(0xff121412),
      surfaceBright: Color(0xff444542),
      surfaceContainerLowest: Color(0xff070806),
      surfaceContainerLow: Color(0xff1d1e1c),
      surfaceContainer: Color(0xff272826),
      surfaceContainerHigh: Color(0xff323330),
      surfaceContainerHighest: Color(0xff3d3e3b),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffddf7d5),
      surfaceTint: Color(0xffb4cead),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffb0caa9),
      onPrimaryContainer: Color(0xff000f01),
      secondary: Color(0xffe9f3e2),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffbcc6b6),
      onSecondaryContainer: Color(0xff060d05),
      tertiary: Color(0xffe7f1ff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffb5c4d8),
      onTertiaryContainer: Color(0xff000c1a),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff121412),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffedf1e7),
      outlineVariant: Color(0xffc0c4ba),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe3e2de),
      inversePrimary: Color(0xff384d34),
      primaryFixed: Color(0xffd0eac8),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffb4cead),
      onPrimaryFixedVariant: Color(0xff031503),
      secondaryFixed: Color(0xffdce6d5),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffc0c9ba),
      onSecondaryFixedVariant: Color(0xff0b130a),
      tertiaryFixed: Color(0xffd5e4f8),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffb9c8dc),
      onTertiaryFixedVariant: Color(0xff041220),
      surfaceDim: Color(0xff121412),
      surfaceBright: Color(0xff50504d),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1f201e),
      surfaceContainer: Color(0xff30312e),
      surfaceContainerHigh: Color(0xff3b3c39),
      surfaceContainerHighest: Color(0xff464744),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
