import 'package:equatable/equatable.dart';

final class LullabiesListState extends Equatable {
  const LullabiesListState({
    this.isLoading,
  });

  final bool? isLoading;

  @override
  List<Object?> get props => [isLoading];

  LullabiesListState copyWith({
    bool? isLoading,
  }) {
    return LullabiesListState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
