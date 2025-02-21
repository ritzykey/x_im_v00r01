import 'package:equatable/equatable.dart';
import 'package:gen/gen.dart';

final class OnboardingsState extends Equatable {
  const OnboardingsState({
    required this.currentPage,
    required this.isCompleted,
    required this.isLoading,
    this.model,
    this.users,
  });

  final bool isLoading;
  final List<User>? users;
  final LoginResponseModel2? model;
  final int currentPage;
  final bool isCompleted;
  @override
  List<Object?> get props =>
      [isLoading, users, model, currentPage, isCompleted];

  OnboardingsState copyWith({
    bool? isLoading,
    List<User>? users,
    LoginResponseModel2? model,
    int? currentPage,
    bool? isCompleted,
  }) {
    return OnboardingsState(
      model: model ?? this.model,
      isLoading: isLoading ?? this.isLoading,
      users: users ?? this.users,
      currentPage: currentPage ?? this.currentPage,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
