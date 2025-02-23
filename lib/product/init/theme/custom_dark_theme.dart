import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:x_im_v00r01/product/init/theme/custom_color_scheme.dart';
import 'package:x_im_v00r01/product/init/theme/custom_theme.dart';

/// Custom light theme for project design
final class CustomDarkTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData.dark().copyWith(
        colorScheme: CustomColorScheme.darkColorScheme,
        floatingActionButtonTheme: floatingActionButtonThemeData,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );

  TextTheme textTheme(double fontSize) {
    return GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme).copyWith(
      titleSmall: ThemeData.dark()
          .textTheme
          .titleSmall
          ?.copyWith(fontSize: fontSize + 2),
      titleMedium: ThemeData.dark()
          .textTheme
          .titleSmall
          ?.copyWith(fontSize: fontSize + 2),
      titleLarge: ThemeData.dark()
          .textTheme
          .titleSmall
          ?.copyWith(fontSize: fontSize + 8),
      bodySmall:
          ThemeData.dark().textTheme.bodySmall?.copyWith(fontSize: fontSize),
      bodyMedium: ThemeData.dark()
          .textTheme
          .bodyMedium
          ?.copyWith(fontSize: fontSize + 2),
      bodyLarge: ThemeData.dark()
          .textTheme
          .bodyLarge
          ?.copyWith(fontSize: fontSize + 4),
    );
  }

  @override
  final FloatingActionButtonThemeData floatingActionButtonThemeData =
      const FloatingActionButtonThemeData();
}
