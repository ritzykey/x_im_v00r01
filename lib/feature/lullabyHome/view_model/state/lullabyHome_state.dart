import 'package:equatable/equatable.dart';

final class LullabyHomeState extends Equatable {
  const LullabyHomeState({
    required this.isLoading,
    required this.duration,
    required this.position,
    required this.isPlaying,
  });

  final bool isLoading;
  final Duration duration;
  final Duration position;
  final bool isPlaying;

  @override
  List<Object?> get props => [isLoading, duration, position, isPlaying];

  LullabyHomeState copyWith({
    bool? isLoading,
    Duration? duration,
    Duration? position,
    bool? isPlaying,
  }) {
    return LullabyHomeState(
      isLoading: isLoading ?? this.isLoading,
      duration: duration ?? this.duration,
      position: position ?? this.position,
      isPlaying: isPlaying ?? this.isPlaying,
    );
  }
}
