import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:x_im_v00r01/product/utility/constans/enums/locales.dart';

@immutable

// Product dil yönetimi (manager)
final class ProductLocalization extends EasyLocalization {
  ProductLocalization({required super.child, super.key})
      : super(
          supportedLocales: _supportedItems,
          path: _translationsPath,
          useOnlyLangCode: true,
        );

  static final List<Locale> _supportedItems = [
    Locales.en.locale,
    Locales.tr.locale,
  ];

  static const String _translationsPath = 'asset/translations';

  static Future<void> updateLanguage({
    required BuildContext context,
    required Locales value,
  }) async {
    context.setLocale(value.locale);
  }
}
