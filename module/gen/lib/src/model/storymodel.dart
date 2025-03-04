// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'storymodel.g.dart';

@JsonSerializable()
class StoryModel extends INetworkModel<StoryModel> with EquatableMixin {
  StoryModel({
    /*this.storyId,
    this.title,
    this.content,
    this.createdAt,
    this.imageBase64,*/
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  /// Get user from json
  factory StoryModel.fromJson(Map<String, dynamic> json) =>
      _$StoryModelFromJson(json);
  /*final String? storyId;
  final String? title;
  final String? content;
  final String? createdAt;
  final String? imageBase64; // Base64 image için String alanı ekledik*/
  final int? userId;
  final String? id;
  final String? title;
  final String? body;

  /*
   işleyiş sırasından bakarsan 1. factory contructure çalışır  _$UserFromJson(json) tetiklenir ,
   sonrasında bu fonksiyon aldığı parametreleri user clasının constucterına atar,
   sonrasında this.user ıd gibi olan constucterlar class içerisinde bulunan final int?userid
   ye atamayı yapar .
  */
  @override
  //List<Object?> get props => [storyId, title, content, createdAt, imageBase64];
  List<Object?> get props => [userId, id, title, body];

  /// User model to map object
  @override
  Map<String, dynamic> toJson() => _$StoryModelToJson(this);

  @override
  StoryModel fromJson(Map<String, dynamic> json) {
    return _$StoryModelFromJson(json);
  }

  StoryModel copyWith({
    int? userId,
    String? id,
    String? title,
    String? body,

    /*String? storyId,
    String? title,
    String? content,
    String? createdAt,
    String? imageBase64,*/
  }) {
    return StoryModel(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      /*storyId: storyId ?? this.storyId,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      imageBase64: imageBase64 ?? this.imageBase64,*/
    );
  }
}
