// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends INetworkModel<User> with EquatableMixin {
  User({this.userId, this.id, this.title, this.body});

  /// Get user from json
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  /*
   işleyiş sırasından bakarsan 1. factory contructure çalışır  _$UserFromJson(json) tetiklenir ,
   sonrasında bu fonksiyon aldığı parametreleri user clasının constucterına atar,
   sonrasında this.user ıd gibi olan constucterlar class içerisinde bulunan final int?userid
   ye atamayı yapar .
  */
  @override
  List<Object?> get props => [userId, id, title, body];

  /// User model to map object
  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  User fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  User copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return User(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}


// {
//     "userId": 1,
//     "id": 1,
//     "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
//     "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
//   }
