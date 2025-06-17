import 'package:equatable/equatable.dart';

class LulbyModel extends Equatable {
  const LulbyModel({
    required this.title,
    required this.audioURL,
    required this.artist,
    this.coverURL,
  });

  factory LulbyModel.fromJson(Map<String, dynamic> json) {
    return LulbyModel(
      title: json['title'] as String,
      audioURL: json['audio_url'] as String,
      artist: json['artist'] as String,
      coverURL: json['cover_url'] as String,
    );
  }

  final String title;
  final String audioURL;
  final String artist;
  final String? coverURL;

  @override
  List<Object?> get props => [title, audioURL, artist, coverURL];
}
