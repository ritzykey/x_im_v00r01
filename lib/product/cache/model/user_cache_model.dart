import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

final class UserCacheModel with CacheModel {
  UserCacheModel({
    this.user,
    this.isFirstTime,
    this.themeMode,
    this.language,
  });

  UserCacheModel.empty()
      : user = LoginResponseModel2(),
        isFirstTime = true,
        themeMode = ThemeMode.light,
        language = null;

  final LoginResponseModel2? user;
  final bool? isFirstTime; // Opsiyonel alan
  final ThemeMode? themeMode;
  final Locale? language;

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
      themeMode: _stringToThemeMode(jsonMap['themeMode'] as String?),
      language: jsonMap['language'] != null
          ? Locale(jsonMap['language'].toString())
          : null,
    );
  }

  @override
  String get id => user?.user?.id.toString() ?? '';

  @override
  Map<String, dynamic> toJson() {
    return {
      ...(user ?? LoginResponseModel2()).toJson(),
      'isFirstTime': isFirstTime,
      'themeMode': themeMode.toString().split('.').last,
      'language': language?.languageCode,
    };
  }

  UserCacheModel copyWith({
    LoginResponseModel2? user,
    bool? isFirstTime,
    ThemeMode? themeMode,
    Locale? language,
  }) {
    return UserCacheModel(
      user: user ?? this.user,
      isFirstTime: isFirstTime ?? this.isFirstTime,
      themeMode: themeMode ?? this.themeMode,
      language: language ?? this.language,
    );
  }

  /// **Enum String'den ThemeMode'a çevirme**
  ThemeMode? _stringToThemeMode(String? themeModeString) {
    switch (themeModeString) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
        return ThemeMode.system;
      default:
        return null;
    }
  }
}
