// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginresponsemodel2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseModel2 _$LoginResponseModel2FromJson(Map<String, dynamic> json) =>
    LoginResponseModel2(
      user: json['user'] == null
          ? null
          : User2.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] == null
          ? null
          : Token2.fromJson(json['token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseModel2ToJson(
        LoginResponseModel2 instance) =>
    <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
    };

User2 _$User2FromJson(Map<String, dynamic> json) => User2(
      id: json['id'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      image: json['image'] as String?,
    )..fullName = json['fullName'] as String?;

Map<String, dynamic> _$User2ToJson(User2 instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'image': instance.image,
      'fullName': instance.fullName,
    };

Token2 _$Token2FromJson(Map<String, dynamic> json) => Token2(
      prefix: json['prefix'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$Token2ToJson(Token2 instance) => <String, dynamic>{
      'prefix': instance.prefix,
      'token': instance.token,
    };
