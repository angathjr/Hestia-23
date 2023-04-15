// To parse this JSON data, do
//
//     final departmentList = departmentListFromJson(jsonString);

import 'dart:convert';

DepartmentModel departmentListFromJson(String str) =>
    DepartmentModel.fromJson(json.decode(str));

String departmentListToJson(DepartmentModel data) => json.encode(data.toJson());

class DepartmentModel {
  DepartmentModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  final int? count;
  final dynamic next;
  final dynamic previous;
  final List<Result>? results;

  factory DepartmentModel.fromJson(Map<String, dynamic> json) => DepartmentModel(
        count: json["count"],
        next: json["next"] ?? ' ',
        previous: json["previous"] ?? ' ',
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.id,
    this.title,
    this.shortForm,
    this.slug,
  });

  final int? id;
  final String? title;
  final String? shortForm;
  final String? slug;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        title: json["title"],
        shortForm: json["short_form"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "short_form": shortForm,
        "slug": slug,
      };
}
