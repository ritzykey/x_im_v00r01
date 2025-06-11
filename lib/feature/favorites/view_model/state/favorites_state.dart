import 'package:equatable/equatable.dart';

final class FavoritesState extends Equatable {
  const FavoritesState({
    this.isLoading,
  });

  final bool? isLoading;

  @override
  List<Object?> get props => [isLoading];

  FavoritesState copyWith({
    bool? isLoading,
  }) {
    return FavoritesState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
