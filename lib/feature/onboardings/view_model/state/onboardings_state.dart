import 'package:equatable/equatable.dart';
import 'package:gen/gen.dart';

final class OnboardingsState extends Equatable {
  const OnboardingsState({required this.isLoading, this.model, this.users});

  final bool isLoading;
  final List<User>? users;
  final LoginResponseModel2? model;
  @override
  List<Object?> get props => [isLoading, users, model];

  OnboardingsState copyWith({
    bool? isLoading,
    List<User>? users,
    LoginResponseModel2? model,
  }) {
    return OnboardingsState(
      model: model ?? this.model,
      isLoading: isLoading ?? this.isLoading,
      users: users ?? this.users,
    );
  }
}
