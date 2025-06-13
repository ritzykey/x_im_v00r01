import 'package:equatable/equatable.dart';

class DailyStory extends Equatable {
  const DailyStory({
    required this.translations,
    required this.photoUrl,
  });

  factory DailyStory.fromJson(Map<String, dynamic> json) {
    return DailyStory(
      translations: json['translations'] as Map<String, dynamic>,
      photoUrl: json['photo_url'] as String,
    );
  }

  final Map<String, dynamic> translations;
  final String photoUrl;

  @override
  List<Object?> get props => [translations, photoUrl];
}
