import 'package:gen/gen.dart';

abstract class AuthenticationOperation {
  Future<List<User>> users();
  Future<DenemeResponseModel?> denemeusers();
  Future<LoginResponseModel2?> inlogin(String email, String password);
  Future<LoginResponseModel2?> tokencheck(String token);
  Future<LoginResponseModel2?> inloginWithHttp(String email, String password);
}
