// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserModel userModelFromJson(Map<String, dynamic> str) =>
    UserModel.fromJson(str);

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.username,
    required this.phoneNumber,
    required this.name,
    required this.url,
    required this.email,
    required this.profileImage,
    required this.collegeName,
    required this.deptName,
    required this.isCompleted,
    required this.accommodation,
  });

  final String username;
  final String phoneNumber;
  final String name;
  final String url;
  final String email;
  final String profileImage;
  final String collegeName;
  final String deptName;
  final bool isCompleted;
  final bool accommodation;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        username: json["username"] ?? '',
        phoneNumber: json["phone_number"] ?? '',
        name: json["name"] ?? '',
        url: json["url"] ?? '',
        email: json["email"] ?? '',
        profileImage: json["profile_image"] ?? '',
        collegeName: json["college_name"] ?? '',
        deptName: json["dept_name"] ?? '',
        isCompleted: json["is_completed"] ?? false,
        accommodation: json["accommodation"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "phone_number": phoneNumber,
        "name": name,
        "url": url,
        "email": email,
        "profile_image": profileImage,
        "college_name": collegeName,
        "dept_name": deptName,
        "is_completed": isCompleted,
        "accommodation": accommodation,
      };
}
