import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';
import 'package:x_im_v00r01/product/utility/constans/enums/locales.dart';

final class UserCacheModel with CacheModel {
  UserCacheModel({this.user, this.isFirstTime, this.themeMode, this.locale});

  UserCacheModel.empty()
      : user = LoginResponseModel2(),
        isFirstTime = true,
        themeMode = null, // Default theme mode
        locale = null; // Default locale
  final LoginResponseModel2? user;
  final bool? isFirstTime; // Opsiyonel alan
  final ThemeMode? themeMode; // Opsiyonel alan
  final Locales? locale; // Opsiyonel alan

  @override
  UserCacheModel fromDynamicJson(dynamic json) {
    final jsonMap = json as Map<String, dynamic>?;
    if (jsonMap == null) {
      CustomLogger.showError<LoginResponseModel2>('Json cannot be null');
      return this;
    }
    return copyWith(
      user: LoginResponseModel2.fromJson(jsonMap),
      isFirstTime: jsonMap['isFirstTime'] as bool?, // isFirstTime'ı al!
      themeMode: ThemeMode.values[(jsonMap['themeMode'] as int?) ?? 0],
      locale: Locales.values[(jsonMap['locale'] as int?) ?? 0], // locale'i al!
    );
  }

  @override
  String get id => user?.user?.id.toString() ?? '';

  @override
  Map<String, dynamic> toJson() {
    return {
      ...?user?.toJson(),
      'isFirstTime': isFirstTime,
      'themeMode': themeMode?.index, // themeMode'i al!
      'locale': locale?.index, // locale'i al!
    };
  }

  UserCacheModel copyWith({
    LoginResponseModel2? user,
    bool? isFirstTime,
    ThemeMode? themeMode,
    Locales? locale,
  }) {
    return UserCacheModel(
      user: user ?? this.user,
      isFirstTime: isFirstTime ?? this.isFirstTime,
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
    );
  }
}
