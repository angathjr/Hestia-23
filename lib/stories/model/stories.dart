import 'dart:convert';

List<StoryModel> storyModelFromJson(List<dynamic> str) =>
    List<StoryModel>.from(str.map((x) => StoryModel.fromJson(x)));

String storyModelToJson(List<StoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StoryModel {
  StoryModel({
    this.imageUrl,
    this.email,
    this.username,
  });

  String? imageUrl;
  String? email;
  String? username;

  factory StoryModel.fromJson(Map<String, dynamic> json) => StoryModel(
        imageUrl: json["imageUrl"],
        email: json["email"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl,
        "email": email,
        "username": username,
      };
}
