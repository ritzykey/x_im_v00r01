import 'package:equatable/equatable.dart';

class NameModel extends Equatable {
  const NameModel({required this.title, required this.audioURL});

  factory NameModel.fromJson(Map<String, dynamic> json) {
    return NameModel(
      title: json['title'] as String,
      audioURL: json['audio_url'] as String,
    );
  }

  final String title;
  final String audioURL;

  @override
  List<Object?> get props => [title, audioURL];
}
