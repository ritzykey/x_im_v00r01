import 'package:equatable/equatable.dart';
import 'package:gen/gen.dart';
import 'package:x_im_v00r01/feature/discover/model/daily_story.dart';
import 'package:x_im_v00r01/feature/discover/model/legendary_footballer.dart';

final class DiscoverState extends Equatable {
  const DiscoverState({
    required this.currentPage,
    required this.isLoading,
    this.users,
    this.stories,
    this.legendaryFootballers,
  });

  final bool isLoading;
  final List<User>? users;
  final int currentPage;
  final List<DailyStory>? stories;
  final List<LegendaryFootballer>? legendaryFootballers;

  @override
  List<Object?> get props =>
      [isLoading, users, currentPage, stories, legendaryFootballers];

  DiscoverState copyWith({
    bool? isLoading,
    List<User>? users,
    int? currentPage,
    List<DailyStory>? stories,
    List<LegendaryFootballer>? legendaryFootballers,
  }) {
    return DiscoverState(
      isLoading: isLoading ?? this.isLoading,
      users: users ?? this.users,
      currentPage: currentPage ?? this.currentPage,
      stories: stories ?? this.stories,
      legendaryFootballers: legendaryFootballers ?? this.legendaryFootballers,
    );
  }
}
