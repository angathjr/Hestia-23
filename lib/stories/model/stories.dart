import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

List<StoryModel> storyModelFromJson(List<dynamic> str) =>
    List<StoryModel>.from(str.map((x) => StoryModel.fromJson(x)));

String storyModelToJson(List<StoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StoryModel {
  StoryModel({
    this.imageUrl,
    this.email,
    this.username,
    this.createdAt,
    this.userImage,
  });

  String? imageUrl;
  String? email;
  String? username;
  DateTime? createdAt;
  String? userImage;

  factory StoryModel.fromJson(Map<String, dynamic> json) => StoryModel(
        imageUrl: json["imageUrl"],
        email: json["email"],
        username: json["username"],
        createdAt: (json["createdAt"] ?? Timestamp.now()).toDate(),
        userImage: json["userImage"],
      );

  Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl,
        "email": email,
        "username": username,
      };
}
