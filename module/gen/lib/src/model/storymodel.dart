// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'storymodel.g.dart';

@JsonSerializable()
class StoryModel extends INetworkModel<StoryModel> with EquatableMixin {
  StoryModel({
    this.id,
    this.name,
    this.story,
    this.title,
    this.photoUrl,
    this.birthDate,
    this.createdAt,
  });

  /// Get story from json
  factory StoryModel.fromJson(Map<String, dynamic> json) =>
      _$StoryModelFromJson(json);

  final String? id;
  final String? name;
  final String? story;
  final String? title;
  final String? photoUrl;
  final String? birthDate;
  final String? createdAt;

  @override
  List<Object?> get props => [
        id,
        name,
        story,
        title,
        photoUrl,
        birthDate,
        createdAt,
      ];

  /// Story model to map object
  @override
  Map<String, dynamic> toJson() => _$StoryModelToJson(this);

  @override
  StoryModel fromJson(Map<String, dynamic> json) {
    return _$StoryModelFromJson(json);
  }

  StoryModel copyWith({
    String? id,
    String? name,
    String? story,
    String? title,
    String? photoUrl,
    String? birthDate,
    String? createdAt,
  }) {
    return StoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      story: story ?? this.story,
      title: title ?? this.title,
      photoUrl: photoUrl ?? this.photoUrl,
      birthDate: birthDate ?? this.birthDate,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
