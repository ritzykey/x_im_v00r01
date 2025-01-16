import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'loginresponsemodel2.g.dart';

@JsonSerializable()
class LoginResponseModel2 extends INetworkModel<LoginResponseModel2>
    with EquatableMixin {
  LoginResponseModel2({this.user, this.token});

  factory LoginResponseModel2.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModel2FromJson(json);
  final User2? user;
  final Token2? token;

  @override
  List<Object?> get props => [user, token];

  @override
  Map<String, dynamic> toJson() => _$LoginResponseModel2ToJson(this);

  @override
  LoginResponseModel2 fromJson(Map<String, dynamic> json) {
    return _$LoginResponseModel2FromJson(json);
  }

  LoginResponseModel2 copyWith({
    User2? user,
    Token2? token,
  }) {
    return LoginResponseModel2(
      user: user ?? this.user,
      token: token ?? this.token,
    );
  }
}

@JsonSerializable()
class User2 {
  User2({
    this.id,
    this.username,
    this.email,
    this.image,
    this.fullName,
  });

  factory User2.fromJson(Map<String, dynamic> json) => _$User2FromJson(json);
  String? id;
  String? username;
  String? email;
  String? image;
  String? fullName;

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$User2ToJson(this);
}

@JsonSerializable()
class Token2 {
  Token2({
    this.prefix,
    this.token,
  });

  factory Token2.fromJson(Map<String, dynamic> json) => _$Token2FromJson(json);
  String? prefix;
  String? token;

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$Token2ToJson(this);
}
