// To parse this JSON data, do
//
//     final eventModel = eventModelFromJson(jsonString);

import 'dart:convert';

List<EventModel> eventModelFromJson(List<dynamic> str) =>
    List<EventModel>.from(str.map((x) => EventModel.fromJson(x)));

String eventModelToJson(List<EventModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EventModel {
  EventModel({
    required this.id,
    required this.title,
    required this.shortTitle,
    required this.shortDesc,
    required this.slug,
    required this.desc,
    required this.eventCategory,
    required this.isTeam,
    required this.image,
  });

  final int id;
  final String title;
  final String shortTitle;
  final String shortDesc;
  final String slug;
  final String desc;
  final String eventCategory;
  final bool isTeam;
  final String image;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        id: json["id"] ?? 0,
        title: json["title"] ?? '',
        shortTitle: json["short_title"] ?? '',
        shortDesc: json["short_desc"] ?? '',
        slug: json["slug"] ?? '',
        desc: json["desc"] ?? '',
        eventCategory: json["event_category"] ?? '',
        isTeam: json["is_team"] ?? false,
        image: json["image"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "short_title": shortTitle,
        "short_desc": shortDesc,
        "slug": slug,
        "desc": desc,
        "event_category": eventCategory,
        "is_team": isTeam,
        "image": image,
      };
}
