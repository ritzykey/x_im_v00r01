import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:x_im_v00r01/product/state/container/index.dart';

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
    const Locale.fromSubtags(languageCode: 'en'),
    const Locale.fromSubtags(languageCode: 'tr'),
    const Locale.fromSubtags(countryCode: 'US', languageCode: 'en'),
    const Locale.fromSubtags(countryCode: 'TR', languageCode: 'tr'),
  ];

  static const String _translationsPath = 'asset/translations';

  static Future<void> updateLanguage({
    required BuildContext context,
    required Locale value,
  }) async {
    await context.setLocale(value);
    await ProductStateItems.supabaseClient.rpc<void>(
      'f_set_language',
      params: {
        'p_requested_language': value.languageCode,
      },
    ).then((_) {
      // Language updated successfully
      print('Language updated to ${value.languageCode}');
    }).catchError((error) {
      // Handle error if needed
      print('Error updating language: $error');
    });
  }
}
