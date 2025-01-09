import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'login.g.dart';

@JsonSerializable()
class LoginResponseModel extends INetworkModel<LoginResponseModel>
    with EquatableMixin {
  LoginResponseModel({this.token, this.roles});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
  final String? token;
  final String? roles;

  @override
  List<Object?> get props => [token, roles];

  @override
  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);

  @override
  LoginResponseModel fromJson(Map<String, dynamic> json) {
    return _$LoginResponseModelFromJson(json);
  }

  LoginResponseModel copyWith({
    String? token,
    String? roles,
  }) {
    return LoginResponseModel(
      token: token ?? this.token,
      roles: roles ?? this.roles,
    );
  }
}
