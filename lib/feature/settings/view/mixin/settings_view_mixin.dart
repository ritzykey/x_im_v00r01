import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_im_v00r01/feature/settings/view/settings_view.dart';
import 'package:x_im_v00r01/feature/settings/view_model/settings_view_model.dart';
import 'package:x_im_v00r01/product/cache/model/user_cache_model.dart';
import 'package:x_im_v00r01/product/service/manager/index.dart';
import 'package:x_im_v00r01/product/service/project_service.dart';
import 'package:x_im_v00r01/product/state/base/base_state.dart';
import 'package:x_im_v00r01/product/state/container/product_state_items.dart';
import 'package:x_im_v00r01/product/state/view_model/product_view_model.dart';

// manage your home view screen
mixin SettingsViewMixin on BaseState<SettingsView> {
  @override
  late final ProductNetworkManager productNetworkManager;
  late final ProductNetworkErrorManager productNetworkErrorManager;

  late final SettingsViewModel settingsViewModel;

  @override
  void initState() {
    // TODO: implement activate
    super.initState();
    productNetworkErrorManager = ProductNetworkErrorManager(context);
    ProductStateItems.productNetworkManager.listenErrorState(
      onErrorStatus: productNetworkErrorManager.handleError,
    );
    settingsViewModel = SettingsViewModel(
      operationService: ProjectService(ProductStateItems.productNetworkManager),
      userCacheOperation: ProductStateItems.productCache.userCacheOperation,
    );
  }

  late String themeModeName;

  String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  String capitalizeThemeModeName(BuildContext context) {
    return capitalize(
      (context
                  .read<ProductViewModel>()
                  .userCacheOperation
                  .get('themeMode') ??
              UserCacheModel(themeMode: ThemeMode.system))
          .themeMode
          .toString()
          .split('.')
          .last,
    );
  }

  String capitalizeLanguageName(BuildContext context) {
    themeModeName = capitalize(
      (context
                  .watch<ProductViewModel>()
                  .userCacheOperation
                  .get('themeMode') ??
              UserCacheModel(themeMode: ThemeMode.system))
          .themeMode
          .toString()
          .split('.')
          .last,
    );

    if (context.locale.languageCode == 'tr') {
      if (themeModeName == 'System') {
        return 'Sistem';
      } else if (themeModeName == 'Light') {
        return 'Açık';
      } else if (themeModeName == 'Dark') {
        return 'Koyu';
      }
    }
    return themeModeName;
  }
}
