// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

List<NotificationModel> notificationModelFromJson(List<dynamic> str) =>
    List<NotificationModel>.from(str.map((x) => NotificationModel.fromJson(x)));

String notificationModelToJson(List<NotificationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotificationModel {
  NotificationModel(
      {this.message,
      this.email,
      this.username,
      this.createdAt,
      this.title,
      this.eventName});

  String? message;
  String? title;
  String? eventName;
  String? email;
  String? username;
  String? eventSlug;
  DateTime? createdAt;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        message: json["message"],
        email: json["email"],
        username: json["username"],
        createdAt: (json["createdAt"] as Timestamp).toDate(),
        title: json["title"],
        eventName: json["eventName"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "email": email,
        "username": username,
        "createdAt": createdAt,
        "title": title,
        "eventName": eventName,
      };
}
