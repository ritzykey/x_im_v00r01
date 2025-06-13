// ignore_for_file: public_member_api_docs

import 'package:gen/gen.dart';
import 'package:vexana/vexana.dart';
import 'package:x_im_v00r01/product/service/interface/project_operation.dart';
import 'package:x_im_v00r01/product/service/manager/product_service_path.dart';

final class ProjectService extends ProjectOperation {
  ProjectService(INetworkManager<EmptyModel> networkManager)
      : _networkManager = networkManager;

  final INetworkManager<EmptyModel> _networkManager;

  @override

  // API'den 50 hikayeyi getir
  Future<List<StoryModel>?> fetchStorys() async {
    _networkManager.addBaseHeader(const MapEntry('key', 'value'));
    final response = await _networkManager.send<StoryModel, List<StoryModel>>(
      ProductServicePath.posts.value,
      parseModel: StoryModel(),
      method: RequestType.GET,
    );

    return response.data;
  }

  @override
  Future<DenemeResponseModel?> denemeusers() async {
    _networkManager.addBaseHeader(const MapEntry('key', 'value'));
    final response =
        await _networkManager.send<DenemeResponseModel, DenemeResponseModel>(
      ProductServicePath.userV1.value,
      parseModel: DenemeResponseModel(),
      method: RequestType.GET,
    );

    return response.data;
  }

  @override
  Future<EmptyModel?> tokencheck(String token) async {
    _networkManager.addBaseHeader(MapEntry('Authorization', 'Bearer $token'));
    final response = await _networkManager.send<EmptyModel, EmptyModel>(
      ProductServicePath.secure.value,
      parseModel: const EmptyModel(),
      method: RequestType.GET,
    );

    if (response.data != null) {
      return response.data;
    }
    return null;
  }
}
