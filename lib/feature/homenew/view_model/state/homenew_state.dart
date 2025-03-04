import 'package:equatable/equatable.dart';
import 'package:gen/gen.dart';

final class HomenewState extends Equatable {
  const HomenewState({
    required this.isLoading,
    required this.opacity,
    this.content,
    this.users,
    this.placeholder,
    this.storyslist,
  });

  final bool isLoading;
  final List<User>? users;
  final List<Content>? content;
  final double? opacity;
  final bool? placeholder;
  final List<StoryModel>? storyslist;

  @override
  List<Object?> get props =>
      [isLoading, users, content, opacity, placeholder, storyslist];

  HomenewState copyWith({
    bool? isLoading,
    List<User>? users,
    List<Content>? content,
    double? opacity,
    bool? placeholder,
    List<StoryModel>? storyslist,
  }) {
    return HomenewState(
      isLoading: isLoading ?? this.isLoading,
      users: users ?? this.users,
      content: content ?? content,
      opacity: opacity ?? this.opacity,
      placeholder: placeholder ?? this.placeholder,
      storyslist: storyslist ?? this.storyslist,
    );
  }
}
