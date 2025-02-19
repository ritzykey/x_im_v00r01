import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

final class ProductState extends Equatable {
  const ProductState({
    this.widthScale = 1,
    this.heightScale = 1,
    this.themeMode = ThemeMode.light,
    this.selectedindex = 0,
  });

  final ThemeMode themeMode;
  final double widthScale;
  final double heightScale;
  final int selectedindex;

  @override
  List<Object> get props => [themeMode, widthScale, heightScale, selectedindex];

  ProductState copyWith({
    ThemeMode? themeMode,
    double? widthScale,
    double? heightScale,
    int? selectedindex,
  }) {
    return ProductState(
      themeMode: themeMode ?? this.themeMode,
      widthScale: widthScale ?? this.widthScale,
      heightScale: heightScale ?? this.heightScale,
      selectedindex: selectedindex ?? this.selectedindex,
    );
  }
}
