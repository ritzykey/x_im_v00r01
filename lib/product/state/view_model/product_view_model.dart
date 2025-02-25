import 'package:flutter/material.dart';
import 'package:x_im_v00r01/product/cache/model/user_cache_model.dart';
import 'package:x_im_v00r01/product/init/product_localization.dart';
import 'package:x_im_v00r01/product/state/base/base_cubit.dart';
import 'package:x_im_v00r01/product/state/container/product_state_items.dart';
import 'package:x_im_v00r01/product/state/view_model/product_state.dart';
import 'package:x_im_v00r01/product/utility/constans/enums/locales.dart';

final class ProductViewModel extends BaseCubit<ProductState> {
  ProductViewModel() : super(const ProductState());
  int selectedindex = 0;
  final userCacheOperation = ProductStateItems.productCache.userCacheOperation;

  /// Change theme mode
  /// [themeMode] is [ThemeMode.light] or [ThemeMode.dark]
  void changeThemeMode(ThemeMode themeMode) {
    emit(state.copyWith(themeMode: themeMode));
  }

  void screenSize(double widthScale, double heightScale) {
    emit(state.copyWith(widthScale: widthScale));
    emit(state.copyWith(heightScale: heightScale));
  }

  void themeModeRead() {
    final usercachemodel = userCacheOperation.get('boxthemeMode');
    var thememode = usercachemodel?.themeMode;
    if (thememode == null || thememode == ThemeMode.system) {
      thememode = ThemeMode.system;
      changeThemeMode(thememode);
    } else {
      changeThemeMode(thememode);
    }
  }

  void languageModeRead(BuildContext context) {
    final usercachemodel = userCacheOperation.get('boxlocale');
    final locale = usercachemodel?.locale ?? Locales.tr;
    ProductLocalization.updateLanguage(context: context, value: locale);
  }

  void localesPutHive(Locales locale) {
    userCacheOperation.remove('boxlocale'); // Önce eski veriyi sil
    // ignore: cascade_invocations
    userCacheOperation.put(
      'boxlocale',
      UserCacheModel(
        locale: locale,
      ),
    );
  }
}
