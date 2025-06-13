import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:x_im_v00r01/product/init/theme/custom_dark_theme.dart';
import 'package:x_im_v00r01/product/init/theme/custom_light_theme.dart';

enum NetworkStatus { connected, disconnected }

final class ProductState extends Equatable {
  ProductState({
    this.widthScale = 1,
    this.heightScale = 1,
    this.themeMode = ThemeMode.light,
    this.selectedindex = 0,
    this.networkStatus = NetworkStatus.connected,
    this.fontSize = 12.0,
    DateTime? currentDate,
  }) : currentDate = currentDate ?? DateTime.now();

  final ThemeMode themeMode;
  final double widthScale;
  final double heightScale;
  final int selectedindex;
  final NetworkStatus networkStatus;
  final double fontSize;
  final DateTime currentDate;

  ThemeData get darkThemeData => CustomDarkTheme().themeData.copyWith(
        textTheme: CustomDarkTheme().textTheme(fontSize),
      );

  ThemeData get lightThemeData => CustomLightTheme().themeData.copyWith(
        textTheme: CustomLightTheme().textTheme(fontSize),
      );

  @override
  List<Object> get props => [
        themeMode,
        widthScale,
        heightScale,
        selectedindex,
        networkStatus,
        fontSize,
        currentDate,
      ];

  ProductState copyWith({
    ThemeMode? themeMode,
    double? widthScale,
    double? heightScale,
    int? selectedindex,
    NetworkStatus? networkStatus,
    double? fontSize,
    DateTime? currentDate,
  }) {
    return ProductState(
      themeMode: themeMode ?? this.themeMode,
      widthScale: widthScale ?? this.widthScale,
      heightScale: heightScale ?? this.heightScale,
      selectedindex: selectedindex ?? this.selectedindex,
      networkStatus: networkStatus ?? this.networkStatus,
      fontSize: fontSize ?? this.fontSize,
      currentDate: currentDate ?? this.currentDate,
    );
  }
}
