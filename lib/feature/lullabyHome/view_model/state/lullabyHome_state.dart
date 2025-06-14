import 'package:equatable/equatable.dart';

final class LullabyHomeState extends Equatable {
  const LullabyHomeState({
    this.isLoading,
  });

  final bool? isLoading;

  @override
  List<Object?> get props => [isLoading];

  LullabyHomeState copyWith({
    bool? isLoading,
  }) {
    return LullabyHomeState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
