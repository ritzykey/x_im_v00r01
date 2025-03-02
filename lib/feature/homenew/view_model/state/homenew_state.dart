import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

final class HomenewState extends Equatable {
  const HomenewState({
    required this.isLoading,
    required this.opacity,
    this.content,
    this.users,
    this.imageHeight,
    this.image,
    this.data,
  });

  final bool isLoading;
  final List<User>? users;
  final List<Content>? content;
  final double? opacity;
  final double? imageHeight;
  final Image? image;
  final List<Map<String, dynamic>>? data;

  @override
  List<Object?> get props =>
      [isLoading, users, content, opacity, imageHeight, image, data];

  HomenewState copyWith({
    bool? isLoading,
    List<User>? users,
    List<Content>? content,
    double? opacity,
    double? imageHeight,
    Image? image,
    List<Map<String, dynamic>>? data,
  }) {
    return HomenewState(
      isLoading: isLoading ?? this.isLoading,
      users: users ?? this.users,
      content: content ?? content,
      opacity: opacity ?? this.opacity,
      imageHeight: imageHeight ?? this.imageHeight,
      image: image ?? this.image,
      data: data ?? this.data,
    );
  }
}
