import 'package:core/core.dart';
import 'package:flutter/material.dart';

class SettingsCacheModel with CacheModel {
  SettingsCacheModel({this.themeMode, this.language});

  SettingsCacheModel.empty()
      : themeMode = ThemeMode.light,
        language = const Locale('en');

  final ThemeMode? themeMode;
  final Locale? language;

  @override
  Map<String, dynamic> toJson() {
    return {
      'themeMode': themeMode.toString().split('.').last,
      'language': language?.languageCode,
    };
  }

  @override
  SettingsCacheModel fromDynamicJson(json) {
    final jsonMap = json as Map<String, dynamic>?;
    if (jsonMap == null) {
      throw Exception('Json cannot be null');
    }
    return copyWith(
      themeMode: _stringToThemeMode(jsonMap['themeMode'] as String?),
      language: jsonMap['language'] != null
          ? Locale(jsonMap['language'].toString())
          : null,
    );
  }

  @override
  // TODO: implement id
  String get id => '';

  SettingsCacheModel copyWith({ThemeMode? themeMode, Locale? language}) {
    return SettingsCacheModel(
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
