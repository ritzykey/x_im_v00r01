import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:gen/gen.dart';
import 'package:vexana/vexana.dart';
import 'package:x_im_v00r01/product/init/config/app_environment.dart';
import 'package:x_im_v00r01/product/service/manager/product_service_manager.dart';
import 'package:x_im_v00r01/product/service/manager/product_service_path.dart';

void main() {
  late final ProductNetworkManager manager;
  setUp(() {
    AppEnvironment.general();
    manager = ProductNetworkManager.base();
  });
  test('get users items from api', () async {
    //manager. 1.senin içinde hangi türde parse yapacağın
    //2.olarak ne türde döneceğini ister
    final response = await manager.send<User, List<User>>(
      ProductServicePath.posts.value,
      parseModel: User(),
      method: RequestType.GET,
    );
    print(response.data);
    expect(response.data, isNotNull);
  });

  test('get users items from api with error', () async {
    manager.listenErrorState(
      onErrorStatus: (value) {
        if (value == HttpStatus.unauthorized) {}
        expect(value, isNotNull);
      },
    );
    final response = await manager.send<User, List<User>>(
      ProductServicePath.userV1.value,
      parseModel: User(),
      method: RequestType.GET,
    );

    print(response.data);
    expect(response.data, null);
  });
}
