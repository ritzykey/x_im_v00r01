import 'package:core/core.dart';
import 'package:gen/gen.dart';
import 'package:kartal/kartal.dart';

final class UserCacheModel with CacheModel {
  UserCacheModel({required this.user, this.isFirstTime});
  UserCacheModel.empty()
      : user = LoginResponseModel2(),
        isFirstTime = null;
  final LoginResponseModel2 user;
  final bool? isFirstTime; // Opsiyonel alan

  @override
  UserCacheModel fromDynamicJson(dynamic json) {
    final jsonMap = json as Map<String, dynamic>?;
    if (jsonMap == null) {
      CustomLogger.showError<LoginResponseModel2>('Json cannot be null');
      return this;
    }
    return copyWith(
      user: LoginResponseModel2.fromJson(jsonMap),
    );
  }

  @override
  String get id => user.user?.id.toString() ?? '';

  @override
  Map<String, dynamic> toJson() {
    return user.toJson();
  }

  UserCacheModel copyWith({
    LoginResponseModel2? user,
    bool? isFirstTime,
  }) {
    return UserCacheModel(
      user: user ?? this.user,
      isFirstTime: isFirstTime ?? this.isFirstTime,
    );
  }
}
