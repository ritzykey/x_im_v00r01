import 'package:equatable/equatable.dart';

class LegendaryFootballer extends Equatable {
  const LegendaryFootballer({
    required this.fullName,
    required this.photoUrl,
  });

  factory LegendaryFootballer.fromJson(Map<String, dynamic> json) {
    return LegendaryFootballer(
      fullName: json['full_name'] as String,
      photoUrl: json['photo_url'] as String,
    );
  }

  final String fullName;
  final String photoUrl;

  @override
  List<Object?> get props => [fullName, photoUrl];
}