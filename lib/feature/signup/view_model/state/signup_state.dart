import 'package:equatable/equatable.dart';
import 'package:gen/gen.dart';

final class SignupState extends Equatable {
  const SignupState({required this.isLoading, this.users});

  final bool isLoading;
  final List<User>? users;

  @override
  List<Object?> get props => [isLoading, users];

  SignupState copyWith({bool? isLoading, List<User>? users}) {
    return SignupState(
      isLoading: isLoading ?? this.isLoading,
      users: users ?? this.users,
    );
  }
}
