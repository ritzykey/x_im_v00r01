import 'package:equatable/equatable.dart';
import 'package:gen/gen.dart';

final class LoginState extends Equatable {
  const LoginState({required this.isLoading, this.users});

  final bool isLoading;
  final List<User>? users;

  @override
  List<Object?> get props => [isLoading, users];

  LoginState copyWith({bool? isLoading, List<User>? users}) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      users: users ?? this.users,
    );
  }
}
