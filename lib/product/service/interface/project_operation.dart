import 'package:gen/gen.dart';
import 'package:vexana/vexana.dart';

abstract class ProjectOperation {
  // Future<List<User>> users();
  Future<DenemeResponseModel?> denemeusers();
  // Future<LoginResponseModel2?> inlogin(String email, String password);
  Future<EmptyModel?> tokencheck(String token);
  // Future<LoginResponseModel2?> inloginWithHttp(String email, String password);
}
