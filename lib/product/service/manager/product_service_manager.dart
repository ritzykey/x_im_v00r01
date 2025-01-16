import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';
import 'package:x_im_v00r01/product/init/config/app_environment.dart';

/// Product network manager
final class ProductNetworkManager extends NetworkManager<EmptyModel> {
  ProductNetworkManager.base()
      : super(
          isEnableLogger: true,
          options: BaseOptions(
            receiveTimeout: const Duration(seconds: 20),
            baseUrl: AppEnvironmentItems.baseurl.value,
          ),
        );

  /// Handle error
  /// [onErrorStatus] is error status code [HttStatus]
  void listenErrorState({required ValueChanged<int> onErrorStatus}) {
    interceptors.add(
      InterceptorsWrapper(
        onError: (e, handler) {
          onErrorStatus(e.response?.statusCode ?? HttpStatus.notFound);
          return handler.next(e);
        },
      ),
    );
  }
}
