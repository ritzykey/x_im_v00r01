import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';

class AudioService {
  AudioService() {
    _audioPlayer.onPlayerComplete.listen((event) {
      _isCompleted = true;
    });
  }
  final AudioPlayer _audioPlayer = AudioPlayer();

  /// AudioPlayer instance getter (optional)
  AudioPlayer get instance => _audioPlayer;

  bool _isCompleted = false;
  String? _lastUrl;

  /// Set an audio file from a URL or local path
  Future<void> setUrl(String url) async {
    try {
      await _audioPlayer.setSourceUrl(url);
    } catch (e, stack) {
      log('Error while set source link: $e', stackTrace: stack);
    }
  }

  /// Play an audio file from a URL or local path
  Future<void> play(String url) async {
    try {
      // Aynı URL tekrar oynatılacaksa, yeniden başlat
      if (_isCompleted || _audioPlayer.state == PlayerState.completed) {
        await _audioPlayer.play(UrlSource(_lastUrl!));
        _isCompleted = false;
      }

      if (_audioPlayer.state == PlayerState.playing && _lastUrl == url) {
        log('Already playing.');
        return;
      }

      _lastUrl = url;
      await _audioPlayer.play(UrlSource(url));
    } catch (e, stack) {
      log('Error while playing audio: $e', stackTrace: stack);
    }
  }

  /// Pause currently playing audio
  Future<void> pause() async {
    try {
      await _audioPlayer.pause();
    } catch (e, stack) {
      log('Error while pausing audio: $e', stackTrace: stack);
    }
  }

  /// Resume paused audio
  Future<void> resume() async {
    try {
      // Ses tamamlandıysa başa sar ve yeniden oynat
      if (_isCompleted) {
        await _audioPlayer.seek(Duration.zero);
        await _audioPlayer.resume();
        _isCompleted = false;
      } else {
        await _audioPlayer.resume();
      }
    } catch (e, stack) {
      log('Error while resuming audio: $e', stackTrace: stack);
    }
  }

  /// Stop audio completely
  Future<void> stop() async {
    try {
      await _audioPlayer.stop();
    } catch (e, stack) {
      log('Error while stopping audio: $e', stackTrace: stack);
    }
  }

  /// Seek to a specific position in the audio
  Future<void> seek(Duration position) async {
    try {
      await _audioPlayer.seek(position);
    } catch (e, stack) {
      log('Error while seeking: $e', stackTrace: stack);
    }
  }

  /// Set playback volume (0.0 to 1.0)
  Future<void> setVolume(double volume) async {
    try {
      await _audioPlayer.setVolume(volume);
    } catch (e, stack) {
      log('Error while setting volume: $e', stackTrace: stack);
    }
  }

  /// Dispose the audio player
  Future<void> dispose() async {
    try {
      await _audioPlayer.dispose();
    } catch (e, stack) {
      log('Error while disposing audio player: $e', stackTrace: stack);
    }
  }

  /// Set playback speed (e.g., 1.0 = normal, 0.5 = half speed, 2.0 = double)
  Future<void> setPlaybackRate(double rate) async {
    try {
      await _audioPlayer.setPlaybackRate(rate);
    } catch (e, stack) {
      log('Error while setting playback rate: $e', stackTrace: stack);
    }
  }

  /// Get current position
  Future<Duration?> getPosition() async {
    try {
      return await _audioPlayer.getCurrentPosition();
    } catch (e, stack) {
      log('Error getting current position: $e', stackTrace: stack);
      return null;
    }
  }

  /// Listen to player state changes (e.g., playing, paused)
  Stream<PlayerState> get onPlayerStateChanged =>
      _audioPlayer.onPlayerStateChanged;

  /// Listen to position changes
  Stream<Duration> get onPositionChanged => _audioPlayer.onPositionChanged;

  /// Listen to duration updates
  Stream<Duration?> get onDurationChanged => _audioPlayer.onDurationChanged;

  Stream<void> get onPlayerComplate => _audioPlayer.onPlayerComplete;
}
