import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:x_im_v00r01/product/init/theme/custom_color_scheme.dart';
import 'package:x_im_v00r01/product/init/theme/custom_theme.dart';

/// Custom light theme for project design
final class CustomDarkTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.poppins().fontFamily,
        colorScheme: CustomColorScheme.darkColorScheme,
        floatingActionButtonTheme: floatingActionButtonThemeData,
        textTheme: const TextTheme(
          bodySmall: TextStyle(fontSize: 16),
          bodyMedium: TextStyle(fontSize: 20),
          bodyLarge: TextStyle(fontSize: 24),
        ),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );

  @override
  final FloatingActionButtonThemeData floatingActionButtonThemeData =
      const FloatingActionButtonThemeData();
}
