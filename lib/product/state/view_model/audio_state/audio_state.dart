import 'package:equatable/equatable.dart';
import 'package:x_im_v00r01/feature/lullabyHome/model/lulby_model.dart';

final class AudioState extends Equatable {
  const AudioState({
    required this.isLoading,
    required this.isPlaying,
    required this.duration,
    required this.position,
    required this.lullaby,
  });

  final bool? isLoading;
  final bool isPlaying;
  final Duration duration;
  final Duration position;

  final List<LulbyModel> lullaby;

  @override
  List<Object?> get props =>
      [isLoading, isPlaying, duration, position, lullaby];

  AudioState copyWith({
    bool? isLoading,
    bool? isPlaying,
    Duration? duration,
    Duration? position,
    List<LulbyModel>? lullaby,
  }) {
    return AudioState(
      isLoading: isLoading ?? this.isLoading,
      isPlaying: isPlaying ?? this.isPlaying,
      duration: duration ?? this.duration,
      position: position ?? this.position,
      lullaby: lullaby ?? this.lullaby,
    );
  }
}
