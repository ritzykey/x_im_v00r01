import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum NetworkStatus { connected, disconnected }

final class ProductState extends Equatable {
  const ProductState({
    this.widthScale = 1,
    this.heightScale = 1,
    this.themeMode = ThemeMode.light,
    this.selectedindex = 0,
    this.networkStatus = NetworkStatus.connected,
  });

  final ThemeMode themeMode;
  final double widthScale;
  final double heightScale;
  final int selectedindex;
  final NetworkStatus networkStatus;

  @override
  List<Object> get props =>
      [themeMode, widthScale, heightScale, selectedindex, networkStatus];

  ProductState copyWith({
    ThemeMode? themeMode,
    double? widthScale,
    double? heightScale,
    int? selectedindex,
    NetworkStatus? networkStatus,
  }) {
    return ProductState(
      themeMode: themeMode ?? this.themeMode,
      widthScale: widthScale ?? this.widthScale,
      heightScale: heightScale ?? this.heightScale,
      selectedindex: selectedindex ?? this.selectedindex,
      networkStatus: networkStatus ?? this.networkStatus,
    );
  }
}
