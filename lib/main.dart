import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgets/widgets.dart';
import 'package:x_im_v00r01/product/init/application_initialize.dart';
import 'package:x_im_v00r01/product/init/product_localization.dart';
import 'package:x_im_v00r01/product/init/state_initialize.dart';
import 'package:x_im_v00r01/product/init/theme/custom_dark_theme.dart';
import 'package:x_im_v00r01/product/init/theme/custom_light_theme.dart';
import 'package:x_im_v00r01/product/navigation/deeplink/app_router.dart';
import 'package:x_im_v00r01/product/state/view_model/product_view_model.dart';

Future<void> main() async {
  await AplicationInitiliaze().make();
  runApp(ProductLocalization(child: const StateInitialize(child: MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = MediaQuery.of(context).platformBrightness;
    final width = size.width;
    final height = size.height;
    final widthScale = size.width / 375; // Ekran genişliğine göre ölçek
    final heightScale = size.height / 643; // Ekran yüksekliğine göre ölçek
    print('height: $height, width: $width');
    context.read<ProductViewModel>().screenSize(widthScale, heightScale);
    context.read<ProductViewModel>().themeModeRead();
    context.read<ProductViewModel>().languageModeRead(context);
    final systemLocale = PlatformDispatcher.instance.locale;
    print('system locale: $systemLocale');

    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      builder: CustomResponsive.build,
      theme: CustomLightTheme().themeData,
      darkTheme: CustomDarkTheme().themeData,
      themeMode: context.watch<ProductViewModel>().state.themeMode,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
