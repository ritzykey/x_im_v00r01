import 'package:flutter/material.dart';
import 'package:x_im_v00r01/product/state/base/base_cubit.dart';
import 'package:x_im_v00r01/product/state/view_model/product_state.dart';

final class ProductViewModel extends BaseCubit<ProductState> {
  ProductViewModel() : super(const ProductState());
  int selectedindex = 0;

  /// Change theme mode
  /// [themeMode] is [ThemeMode.light] or [ThemeMode.dark]
  void changeThemeMode(ThemeMode themeMode) {
    emit(state.copyWith(themeMode: themeMode));
  }

  void screenSize(double widthScale, double heightScale) {
    emit(state.copyWith(widthScale: widthScale));
    emit(state.copyWith(heightScale: heightScale));
  }
}
