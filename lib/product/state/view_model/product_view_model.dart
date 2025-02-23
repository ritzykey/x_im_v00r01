import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:x_im_v00r01/product/cache/model/user_cache_model.dart';
import 'package:x_im_v00r01/product/state/base/base_cubit.dart';
import 'package:x_im_v00r01/product/state/container/index.dart';
import 'package:x_im_v00r01/product/state/view_model/product_state.dart';

final class ProductViewModel extends BaseCubit<ProductState> {
  ProductViewModel()  : 
        super(const ProductState());

  final HiveCacheOperation<UserCacheModel> userCacheOperation = ProductStateItems.productCache.userCacheOperation;

  int selectedindex = 0;

  Future<UserCacheModel> getSettings() async {
    final settings = userCacheOperation.get('settings');
    return settings ?? UserCacheModel(user: LoginResponseModel2());
  }

  /// Change theme mode
  /// [themeMode] is [ThemeMode.light] or [ThemeMode.dark]
  void changeThemeMode(ThemeMode themeMode) {
    //print(userCacheOperation.getAll());
    emit(state.copyWith(themeMode: themeMode));
  }

  void screenSize(double widthScale, double heightScale) {
    emit(state.copyWith(widthScale: widthScale));
    emit(state.copyWith(heightScale: heightScale));
  }
}
