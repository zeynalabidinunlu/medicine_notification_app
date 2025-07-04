import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff8d3896),
      surfaceTint: Color(0xff903b98),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffa952b1),
      onPrimaryContainer: Color(0xfffffbff),
      secondary: Color(0xff775278),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xfffecefb),
      onSecondaryContainer: Color(0xff7a547a),
      tertiary: Color(0xffa33349),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffc34b61),
      onTertiaryContainer: Color(0xfffffbff),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff7fa),
      onSurface: Color(0xff201920),
      onSurfaceVariant: Color(0xff50434e),
      outline: Color(0xff82737f),
      outlineVariant: Color(0xffd3c1d0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff362e35),
      inversePrimary: Color(0xfffdaaff),
      primaryFixed: Color(0xffffd6fc),
      onPrimaryFixed: Color(0xff36003e),
      primaryFixedDim: Color(0xfffdaaff),
      onPrimaryFixedVariant: Color(0xff74207e),
      secondaryFixed: Color(0xffffd6fc),
      onSecondaryFixed: Color(0xff2e0f31),
      secondaryFixedDim: Color(0xffe6b8e4),
      onSecondaryFixedVariant: Color(0xff5e3a5f),
      tertiaryFixed: Color(0xffffd9dc),
      onTertiaryFixed: Color(0xff400011),
      tertiaryFixedDim: Color(0xffffb2ba),
      onTertiaryFixedVariant: Color(0xff871d35),
      surfaceDim: Color(0xffe3d6df),
      surfaceBright: Color(0xfffff7fa),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffef0f9),
      surfaceContainer: Color(0xfff8eaf3),
      surfaceContainerHigh: Color(0xfff2e4ed),
      surfaceContainerHighest: Color(0xffecdfe8),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff60056c),
      surfaceTint: Color(0xff903b98),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffa04aa8),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff4b2a4d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff876087),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff6f0726),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffba445a),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff7fa),
      onSurface: Color(0xff150f15),
      onSurfaceVariant: Color(0xff3e323e),
      outline: Color(0xff5c4e5a),
      outlineVariant: Color(0xff776975),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff362e35),
      inversePrimary: Color(0xfffdaaff),
      primaryFixed: Color(0xffa04aa8),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff84308e),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff876087),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff6d486e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xffba445a),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff9a2c43),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd0c3cc),
      surfaceBright: Color(0xfffff7fa),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffef0f9),
      surfaceContainer: Color(0xfff2e4ed),
      surfaceContainerHigh: Color(0xffe6d9e2),
      surfaceContainerHighest: Color(0xffdbced7),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff51005c),
      surfaceTint: Color(0xff903b98),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff772381),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff402042),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff603d61),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff5f001d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff8a1f38),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff7fa),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff342833),
      outlineVariant: Color(0xff524551),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff362e35),
      inversePrimary: Color(0xfffdaaff),
      primaryFixed: Color(0xff772381),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff5c0068),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff603d61),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff482649),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff8a1f38),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff6a0323),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc1b5be),
      surfaceBright: Color(0xfffff7fa),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffbedf6),
      surfaceContainer: Color(0xffecdfe8),
      surfaceContainerHigh: Color(0xffded1d9),
      surfaceContainerHighest: Color(0xffd0c3cc),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffdaaff),
      surfaceTint: Color(0xfffdaaff),
      onPrimary: Color(0xff580064),
      primaryContainer: Color(0xffc96ecf),
      onPrimaryContainer: Color(0xff380040),
      secondary: Color(0xffe6b8e4),
      onSecondary: Color(0xff452447),
      secondaryContainer: Color(0xff5e3a5f),
      onSecondaryContainer: Color(0xffd4a7d2),
      tertiary: Color(0xffffb2ba),
      onTertiary: Color(0xff670020),
      tertiaryContainer: Color(0xffe7677c),
      onTertiaryContainer: Color(0xff430012),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff181117),
      onSurface: Color(0xffecdfe8),
      onSurfaceVariant: Color(0xffd3c1d0),
      outline: Color(0xff9c8c99),
      outlineVariant: Color(0xff50434e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffecdfe8),
      inversePrimary: Color(0xff903b98),
      primaryFixed: Color(0xffffd6fc),
      onPrimaryFixed: Color(0xff36003e),
      primaryFixedDim: Color(0xfffdaaff),
      onPrimaryFixedVariant: Color(0xff74207e),
      secondaryFixed: Color(0xffffd6fc),
      onSecondaryFixed: Color(0xff2e0f31),
      secondaryFixedDim: Color(0xffe6b8e4),
      onSecondaryFixedVariant: Color(0xff5e3a5f),
      tertiaryFixed: Color(0xffffd9dc),
      onTertiaryFixed: Color(0xff400011),
      tertiaryFixedDim: Color(0xffffb2ba),
      onTertiaryFixedVariant: Color(0xff871d35),
      surfaceDim: Color(0xff181117),
      surfaceBright: Color(0xff3f373e),
      surfaceContainerLowest: Color(0xff120c12),
      surfaceContainerLow: Color(0xff201920),
      surfaceContainer: Color(0xff241d24),
      surfaceContainerHigh: Color(0xff2f282e),
      surfaceContainerHighest: Color(0xff3a3239),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffccfd),
      surfaceTint: Color(0xfffdaaff),
      onPrimary: Color(0xff460050),
      primaryContainer: Color(0xffc96ecf),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffdcdfa),
      onSecondary: Color(0xff39193c),
      secondaryContainer: Color(0xffad83ac),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffd1d5),
      onTertiary: Color(0xff530018),
      tertiaryContainer: Color(0xffe7677c),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff181117),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffead7e6),
      outline: Color(0xffbeadbb),
      outlineVariant: Color(0xff9c8c99),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffecdfe8),
      inversePrimary: Color(0xff752180),
      primaryFixed: Color(0xffffd6fc),
      onPrimaryFixed: Color(0xff25002b),
      primaryFixedDim: Color(0xfffdaaff),
      onPrimaryFixedVariant: Color(0xff60056c),
      secondaryFixed: Color(0xffffd6fc),
      onSecondaryFixed: Color(0xff220426),
      secondaryFixedDim: Color(0xffe6b8e4),
      onSecondaryFixedVariant: Color(0xff4b2a4d),
      tertiaryFixed: Color(0xffffd9dc),
      onTertiaryFixed: Color(0xff2c0009),
      tertiaryFixedDim: Color(0xffffb2ba),
      onTertiaryFixedVariant: Color(0xff6f0726),
      surfaceDim: Color(0xff181117),
      surfaceBright: Color(0xff4a4249),
      surfaceContainerLowest: Color(0xff0b060b),
      surfaceContainerLow: Color(0xff221b22),
      surfaceContainer: Color(0xff2d262c),
      surfaceContainerHigh: Color(0xff383037),
      surfaceContainerHighest: Color(0xff433b42),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffeafa),
      surfaceTint: Color(0xfffdaaff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xfffca3ff),
      onPrimaryContainer: Color(0xff1b0020),
      secondary: Color(0xffffeafa),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffe2b4e0),
      onSecondaryContainer: Color(0xff1b001f),
      tertiary: Color(0xffffebec),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffffacb5),
      onTertiaryContainer: Color(0xff210006),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff181117),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfffeeaf9),
      outlineVariant: Color(0xffcfbdcc),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffecdfe8),
      inversePrimary: Color(0xff752180),
      primaryFixed: Color(0xffffd6fc),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xfffdaaff),
      onPrimaryFixedVariant: Color(0xff25002b),
      secondaryFixed: Color(0xffffd6fc),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffe6b8e4),
      onSecondaryFixedVariant: Color(0xff220426),
      tertiaryFixed: Color(0xffffd9dc),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffffb2ba),
      onTertiaryFixedVariant: Color(0xff2c0009),
      surfaceDim: Color(0xff181117),
      surfaceBright: Color(0xff564d55),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff241d24),
      surfaceContainer: Color(0xff362e35),
      surfaceContainerHigh: Color(0xff413940),
      surfaceContainerHighest: Color(0xff4d444b),
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

  /// Custom Color 1
  static const customColor1 = ExtendedColor(
    seed: Color(0xffe53982),
    value: Color(0xffe53982),
    light: ColorFamily(
      color: Color(0xffb5035f),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffd72d77),
      onColorContainer: Color(0xfffffbff),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(0xffb5035f),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffd72d77),
      onColorContainer: Color(0xfffffbff),
    ),
    lightHighContrast: ColorFamily(
      color: Color(0xffb5035f),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xffd72d77),
      onColorContainer: Color(0xfffffbff),
    ),
    dark: ColorFamily(
      color: Color(0xffffb1c7),
      onColor: Color(0xff650032),
      colorContainer: Color(0xfffd4c94),
      onColorContainer: Color(0xff340016),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(0xffffb1c7),
      onColor: Color(0xff650032),
      colorContainer: Color(0xfffd4c94),
      onColorContainer: Color(0xff340016),
    ),
    darkHighContrast: ColorFamily(
      color: Color(0xffffb1c7),
      onColor: Color(0xff650032),
      colorContainer: Color(0xfffd4c94),
      onColorContainer: Color(0xff340016),
    ),
  );

  /// Custom Color 2
  static const customColor2 = ExtendedColor(
    seed: Color(0xff4caf50),
    value: Color(0xff4caf50),
    light: ColorFamily(
      color: Color(0xff006e1c),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xff4caf50),
      onColorContainer: Color(0xff003c0b),
    ),
    lightMediumContrast: ColorFamily(
      color: Color(0xff006e1c),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xff4caf50),
      onColorContainer: Color(0xff003c0b),
    ),
    lightHighContrast: ColorFamily(
      color: Color(0xff006e1c),
      onColor: Color(0xffffffff),
      colorContainer: Color(0xff4caf50),
      onColorContainer: Color(0xff003c0b),
    ),
    dark: ColorFamily(
      color: Color(0xff78dc77),
      onColor: Color(0xff00390a),
      colorContainer: Color(0xff4caf50),
      onColorContainer: Color(0xff003c0b),
    ),
    darkMediumContrast: ColorFamily(
      color: Color(0xff78dc77),
      onColor: Color(0xff00390a),
      colorContainer: Color(0xff4caf50),
      onColorContainer: Color(0xff003c0b),
    ),
    darkHighContrast: ColorFamily(
      color: Color(0xff78dc77),
      onColor: Color(0xff00390a),
      colorContainer: Color(0xff4caf50),
      onColorContainer: Color(0xff003c0b),
    ),
  );


  List<ExtendedColor> get extendedColors => [
    customColor1,
    customColor2,
  ];
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
