// ignore_for_file: public_member_api_docs

import 'dart:convert';

import 'package:gen/gen.dart';
import 'package:http/http.dart' as http;
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
  Future<LoginResponseModel2?> inlogin(String email, String password) async {
    _networkManager.clearHeader();
    final response =
        await _networkManager.send<LoginResponseModel2, LoginResponseModel2>(
      ProductServicePath.login.value,
      parseModel: LoginResponseModel2(),
      method: RequestType.POST,
      data: {
        'email': email,
        'password': password,
      },
      expiration: const Duration(seconds: 3),
    );
    if (response.data != null) {
      return response.data;
    }
    return null;
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

  @override
  Future<LoginResponseModel2?> inloginWithHttp(
    String email,
    String password,
  ) async {
    final url = Uri.parse(ProductServicePath.login.value); // Endpoint URL
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json', // Header
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        // Yanıtın body kısmını JSON olarak çözümleyin
        final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

        // Yanıtı modele dönüştürün
        return LoginResponseModel2.fromJson(jsonResponse);
      } else {
        print('Hata: Status Code ${response.statusCode}');
        print('Hata Mesajı: ${response.body}');
      }
    } catch (e) {
      print('İstek sırasında hata oluştu: $e');
    }
    return null; // Eğer bir hata oluşursa veya yanıt geçersizse null döner
  }
}
