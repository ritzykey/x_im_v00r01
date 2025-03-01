import 'package:equatable/equatable.dart';
import 'package:gen/gen.dart';

final class HomenewState extends Equatable {
  const HomenewState({
    required this.isLoading,
    required this.opacity,
    this.content,
    this.users,
  });

  final bool isLoading;
  final List<User>? users;
  final List<Content>? content;
  final double? opacity;

  @override
  List<Object?> get props => [isLoading, users, content, opacity];

  HomenewState copyWith({
    bool? isLoading,
    List<User>? users,
    List<Content>? content,
    double? opacity,
  }) {
    return HomenewState(
      isLoading: isLoading ?? this.isLoading,
      users: users ?? this.users,
      content: content ?? content,
      opacity: opacity ?? this.opacity,
    );
  }
}
