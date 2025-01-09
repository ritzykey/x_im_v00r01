import 'package:gen/gen.dart';

abstract class AuthenticationOperation {
  Future<List<User>> users();
  Future<List<LoginResponseModel>> login(String email, String password);
}
