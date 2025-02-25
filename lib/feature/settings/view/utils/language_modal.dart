import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:x_im_v00r01/feature/settings/view_model/settings_view_model.dart';
import 'package:x_im_v00r01/product/cache/model/user_cache_model.dart';
import 'package:x_im_v00r01/product/init/product_localization.dart';
import 'package:x_im_v00r01/product/state/view_model/product_view_model.dart';

void showLanguageModal(
  BuildContext context,
  ThemeData theme,
  String current,
  SettingsViewModel settingsViewModel,
) {
  showModalBottomSheet<Container>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(16),
        height: 320,
        decoration: BoxDecoration(
          color: context.watch<ProductViewModel>().state.themeMode ==
                  ThemeMode.dark
              ? Colors.grey.shade900
              : Colors.grey.shade200,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'settings.language.showModal'.tr(),
              style: context.general.textTheme.titleLarge,
            ),
            const SizedBox(height: 32),
            ListTile(
              title: Text('TR', style: theme.textTheme.bodyLarge),
              onTap: () {
                ProductLocalization.updateLanguage(
                  context: context,
                  value: const Locale('tr'),
                );
                settingsViewModel.userCacheOperation.put(
                  'lang',
                  UserCacheModel(language: const Locale('tr')),
                );
                Navigator.pop(context);
              },
              trailing: Icon(
                Icons.check,
                color: current == 'TR' ? Colors.blue : Colors.transparent,
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              title: Text('EN', style: theme.textTheme.bodyLarge),
              onTap: () {
                ProductLocalization.updateLanguage(
                  context: context,
                  value: const Locale('en'),
                );
                settingsViewModel.userCacheOperation.put(
                  'lang',
                  UserCacheModel(language: const Locale('en')),
                );
                Navigator.pop(context);
              },
              trailing: Icon(
                Icons.check,
                color: current == 'EN' ? Colors.blue : Colors.transparent,
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(
                Icons.language,
                color: Colors.orange,
              ),
              title: Text(
                'settings.system'.tr(),
                style: theme.textTheme.bodyLarge,
              ),
              onTap: () {
                final systemLocale = PlatformDispatcher.instance.locale;

                settingsViewModel.userCacheOperation.put(
                  'lang',
                  UserCacheModel(),
                );
                ProductLocalization.updateLanguage(
                  context: context,
                  value: settingsViewModel.userCacheOperation
                          .get('lang')
                          ?.language ??
                      systemLocale,
                );

                Navigator.pop(context);
              },
              trailing: Icon(
                Icons.check,
                color: current ==
                        PlatformDispatcher.instance.locale.languageCode
                            .toUpperCase()
                    ? Colors.blue
                    : Colors.transparent,
              ),
            ),
          ],
        ),
      );
    },
  );
  return;
}
