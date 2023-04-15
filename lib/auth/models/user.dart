// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

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

  UserModel copyWith({
    String? username,
    String? phoneNumber,
    String? name,
    String? url,
    String? email,
    String? profileImage,
    String? collegeName,
    String? deptName,
    bool? isCompleted,
    bool? accommodation,
  }) {
    return UserModel(
      username: username ?? this.username,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      name: name ?? this.name,
      url: url ?? this.url,
      email: email ?? this.email,
      profileImage: profileImage ?? this.profileImage,
      collegeName: collegeName ?? this.collegeName,
      deptName: deptName ?? this.deptName,
      isCompleted: isCompleted ?? this.isCompleted,
      accommodation: accommodation ?? this.accommodation,
    );
  }
}
