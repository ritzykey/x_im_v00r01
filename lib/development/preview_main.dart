import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';
import 'package:x_im_v00r01/product/init/application_initialize.dart';
import 'package:x_im_v00r01/product/init/product_localization.dart';
import 'package:x_im_v00r01/product/init/theme/custom_dark_theme.dart';
import 'package:x_im_v00r01/product/init/theme/custom_light_theme.dart';
import 'package:x_im_v00r01/product/navigation/deeplink/app_router.dart';

Future<void> main() async {
  await AplicationInitiliaze().make();
  runApp(
    DevicePreview(
      builder: (context) => ProductLocalization(child: const MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      builder: CustomResponsive.build,
      theme: CustomLightTheme().themeData,
      darkTheme: CustomDarkTheme().themeData,
      themeMode: ThemeMode.light,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
