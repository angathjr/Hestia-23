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
    this.eventName,
    this.createdAt,
    this.userImage,
    required this.isVerified,
  });

  String? imageUrl;
  String? email;
  String? username;
  String? eventName;
  DateTime? createdAt;
  String? userImage;
  bool isVerified;

  factory StoryModel.fromJson(Map<String, dynamic> json) => StoryModel(
        imageUrl: json["imageUrl"],
        email: json["email"],
        username: json["username"],
        eventName: json["eventName"] ?? "EVENT NAME", //TODO
        createdAt: (json["createdAt"] ?? Timestamp.now()).toDate(),
        userImage: json["userImage"],
        isVerified: json['isVerified'] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl,
        "email": email,
        "username": username,
        "eventName": eventName,
        "isVerified": isVerified,
      };
}
