
import 'dart:convert';

List<DepartmentModel> departmentModelFromJson(List<dynamic> str) => List<DepartmentModel>.from(str.map((x) => DepartmentModel.fromJson(x)));

String departmentModelToJson(List<DepartmentModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DepartmentModel {
  DepartmentModel({
    this.id,
    this.title,
    this.shortForm,
    this.slug,
  });

  final int? id;
  final String? title;
  final String? shortForm;
  final String? slug;

  factory DepartmentModel.fromJson(Map<String, dynamic> json) => DepartmentModel(
    id: json["id"]?? 0,
    title: json["title"]?? '',
    shortForm: json["short_form"]??'',
    slug: json["slug"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "short_form": shortForm,
    "slug": slug,
  };
}
