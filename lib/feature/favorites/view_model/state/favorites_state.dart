import 'package:equatable/equatable.dart';
import 'package:gen/gen.dart';

final class FavoritesState extends Equatable {
  const FavoritesState({
    this.isLoading,
    this.favoriteStories,
  });

  final bool? isLoading;
  final List<StoryModel>? favoriteStories;

  @override
  List<Object?> get props => [isLoading, favoriteStories];

  FavoritesState copyWith({
    bool? isLoading,
    List<StoryModel>? favoriteStories,
  }) {
    return FavoritesState(
      isLoading: isLoading ?? this.isLoading,
      favoriteStories: favoriteStories ?? this.favoriteStories,
    );
  }
}
