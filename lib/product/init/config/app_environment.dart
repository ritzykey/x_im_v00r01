import 'package:flutter/foundation.dart';
import 'package:gen/gen.dart';

final class AppEnvironment {
  AppEnvironment.setup({required AppConfiguration config}) {
    _config = config;
  }

  AppEnvironment.general() {
    _config = kDebugMode ? DevEnv() : ProdEnv();
  }
  static late final AppConfiguration _config;
}

enum AppEnvironmentItems {
  baseurl,
  apiKey;

  String get value {
    try {
      switch (this) {
        case AppEnvironmentItems.baseurl:
          return AppEnvironment._config.baseurl;
        case AppEnvironmentItems.apiKey:
          return AppEnvironment._config.ApiKey;
      }
    } catch (e) {
      throw Exception('AppEnvironment yüklenemedi');
    }
  }
}


// app environemnt manager