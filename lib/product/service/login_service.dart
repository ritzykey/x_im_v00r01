// ignore_for_file: public_member_api_docs

import 'package:gen/gen.dart';
import 'package:vexana/vexana.dart';
import 'package:x_im_v00r01/product/service/interface/authenction_operation.dart';
import 'package:x_im_v00r01/product/service/manager/product_service_path.dart';

final class LoginService extends AuthenticationOperation {
  LoginService(INetworkManager<EmptyModel> networkManager)
      : _networkManager = networkManager;

  final INetworkManager<EmptyModel> _networkManager;

  @override
  Future<List<User>> users() async {
    _networkManager.addBaseHeader(const MapEntry('key', 'value'));
    final response = await _networkManager.send<User, List<User>>(
      ProductServicePath.posts.value,
      parseModel: User(),
      method: RequestType.GET,
    );

    return response.data ?? [];
  }

  @override
  Future<List<LoginResponseModel>> login(String email, String password) async {
    final response = await _networkManager
        .send<LoginResponseModel, List<LoginResponseModel>>(
      ProductServicePath.login.value,
      parseModel: LoginResponseModel(),
      method: RequestType.POST,
      data: {
        'email': email,
        'password': password,
      },
    );

    if (response.data != null) {
      return response.data ?? [];
    }
    return [];
  }
}
