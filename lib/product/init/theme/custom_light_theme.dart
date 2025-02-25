import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:x_im_v00r01/product/init/theme/custom_color_scheme.dart';
import 'package:x_im_v00r01/product/init/theme/custom_theme.dart';

/// Custom light theme for project design
final class CustomLightTheme implements CustomTheme {
  // TODO: Canlıa çkmadan önce güncellenbilir hali yerine constana çevir
  //2vb6 16.dakikayı izlersin

  @override
  ThemeData get themeData => ThemeData.light().copyWith(
        colorScheme: CustomColorScheme.lightColorScheme,
        floatingActionButtonTheme: floatingActionButtonThemeData,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );

  TextTheme textTheme(double fontSize) {
    return GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme).copyWith(
      titleSmall: ThemeData.light()
          .textTheme
          .titleSmall
          ?.copyWith(fontSize: fontSize + 2),
      titleMedium: ThemeData.light()
          .textTheme
          .titleSmall
          ?.copyWith(fontSize: fontSize + 2),
      titleLarge: ThemeData.light()
          .textTheme
          .titleSmall
          ?.copyWith(fontSize: fontSize + 8),
      bodySmall:
          ThemeData.light().textTheme.bodySmall?.copyWith(fontSize: fontSize),
      bodyMedium: ThemeData.light()
          .textTheme
          .bodyMedium
          ?.copyWith(fontSize: fontSize + 2),
      bodyLarge: ThemeData.light()
          .textTheme
          .bodyLarge
          ?.copyWith(fontSize: fontSize + 4),
    );
  }

  @override
  FloatingActionButtonThemeData get floatingActionButtonThemeData =>
      const FloatingActionButtonThemeData(
        backgroundColor: Colors.pink,
      );
  //özelleştrimek istediğin komponentin değerlerini gir
}
