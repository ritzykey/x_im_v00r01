import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseAuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

// Başlangıç durumu
class AuthInitial extends BaseAuthState {}

// Kullanıcı oturum açtığında
class AuthAuthenticated extends BaseAuthState {
  final User user;

  AuthAuthenticated(this.user);

  @override
  List<Object?> get props => [user];
}

// Kullanıcı çıkış yaptığında
class AuthUnauthenticated extends BaseAuthState {}

// Hata durumu
class AuthError extends BaseAuthState {
  final String message;

  AuthError(this.message);

  @override
  List<Object?> get props => [message];
}
