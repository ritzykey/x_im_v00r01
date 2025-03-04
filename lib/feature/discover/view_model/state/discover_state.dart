import 'package:equatable/equatable.dart';
import 'package:gen/gen.dart';

final class DiscoverState extends Equatable {
  const DiscoverState({
    required this.currentPage,
    required this.isLoading,
    this.users,
  });

  final bool isLoading;
  final List<User>? users;
  final int currentPage;

  @override
  List<Object?> get props => [isLoading, users, currentPage];

  DiscoverState copyWith({
    bool? isLoading,
    List<User>? users,
    int? currentPage,
  }) {
    return DiscoverState(
      isLoading: isLoading ?? this.isLoading,
      users: users ?? this.users,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
