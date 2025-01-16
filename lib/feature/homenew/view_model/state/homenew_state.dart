import 'package:equatable/equatable.dart';
import 'package:gen/gen.dart';

final class HomenewState extends Equatable {
  const HomenewState({required this.isLoading, this.content, this.users});

  final bool isLoading;
  final List<User>? users;
  final List<Content>? content;

  @override
  List<Object?> get props => [isLoading, users, content];

  HomenewState copyWith({
    bool? isLoading,
    List<User>? users,
    List<Content>? content,
  }) {
    return HomenewState(
      isLoading: isLoading ?? this.isLoading,
      users: users ?? this.users,
      content: content ?? content,
    );
  }
}
