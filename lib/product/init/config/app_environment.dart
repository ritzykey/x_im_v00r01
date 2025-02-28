import 'package:flutter/foundation.dart';
import 'package:gen/gen.dart';

final class AppEnvironment {
  AppEnvironment.setup({required AppConfiguration config}) {
    _config = config;
  }

  AppEnvironment.general() {
    print('kDebugMode $kDebugMode');
    _config = kDebugMode ? DevEnv() : ProdEnv();
  }
  static late final AppConfiguration _config;
}

enum AppEnvironmentItems {
  baseurl,
  apiKey,
  supaUrl,
  anonKey;

  String get value {
    try {
      switch (this) {
        case AppEnvironmentItems.baseurl:
          return AppEnvironment._config.baseurl;
        case AppEnvironmentItems.apiKey:
          return AppEnvironment._config.ApiKey;
        case AppEnvironmentItems.supaUrl:
          return AppEnvironment._config.supaURL;
        case AppEnvironmentItems.anonKey:
          return AppEnvironment._config.anonKey;
      }
    } catch (e) {
      throw Exception('AppEnvironment yüklenemedi');
    }
  }
}


// app environemnt manager