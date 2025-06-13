import 'package:equatable/equatable.dart';
import 'package:gen/gen.dart';

final class NavigationState extends Equatable {
  const NavigationState({
    required this.isLoading,
    this.users,
    this.selectedindex,
  });

  final bool isLoading;
  final List<User>? users;
  final int? selectedindex;

  @override
  List<Object?> get props => [isLoading, users, selectedindex];

  NavigationState copyWith({
    bool? isLoading,
    List<User>? users,
    int? selectedindex,
  }) {
    return NavigationState(
      isLoading: isLoading ?? this.isLoading,
      users: users ?? this.users,
      selectedindex: selectedindex ?? this.selectedindex,
    );
  }
}
