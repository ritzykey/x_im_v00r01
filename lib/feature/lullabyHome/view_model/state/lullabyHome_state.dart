import 'package:equatable/equatable.dart';
import 'package:x_im_v00r01/feature/lullabyHome/model/lulby_model.dart';

final class LullabyHomeState extends Equatable {
  const LullabyHomeState({
    required this.isLoading,
    required this.duration,
    required this.position,
    required this.isPlaying,
    this.lullaby,
  });

  final bool isLoading;
  final Duration duration;
  final Duration position;
  final bool isPlaying;
  final List<LulbyModel>? lullaby;

  @override
  List<Object?> get props =>
      [isLoading, duration, position, isPlaying, lullaby];

  LullabyHomeState copyWith({
    bool? isLoading,
    Duration? duration,
    Duration? position,
    bool? isPlaying,
    List<LulbyModel>? lullaby,
  }) {
    return LullabyHomeState(
      isLoading: isLoading ?? this.isLoading,
      duration: duration ?? this.duration,
      position: position ?? this.position,
      isPlaying: isPlaying ?? this.isPlaying,
      lullaby: lullaby ?? this.lullaby,
    );
  }
}
