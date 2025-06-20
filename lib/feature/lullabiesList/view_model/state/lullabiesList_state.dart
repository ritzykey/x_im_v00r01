import 'package:equatable/equatable.dart';

final class LullabiesListState extends Equatable {
  const LullabiesListState({
    required this.favoriteIds,
    this.isLoading,
  });

  final bool? isLoading;
  final List<String> favoriteIds;

  @override
  List<Object?> get props => [isLoading, favoriteIds];

  LullabiesListState copyWith({
    bool? isLoading,
    List<String>? favoriteIds,
  }) {
    return LullabiesListState(
      isLoading: isLoading ?? this.isLoading,
      favoriteIds: favoriteIds ?? this.favoriteIds,
    );
  }
}
