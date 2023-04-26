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
    this.id,
    this.venue,
    this.dept,
    this.coordinator1,
    this.coordinator2,
    this.title,
    this.shortTitle,
    this.shortDesc,
    this.slug,
    this.desc,
    this.eventCategory,
    this.prize,
    this.isVisible,
    this.minMembersInTeam,
    this.maxMembersInTeam,
    this.maxTeams,
    this.isTeam,
    this.fees,
    this.isFeesTeam,
    this.collectTeamName,
    this.templateForMail,
    this.image,
    this.certificationTemplate,
    this.coordinatorCertificationTemplate,
    this.winnerCertificationTemplate,
    this.isRegOpen,
    this.isFileUpload,
    this.guidelineFile,
    this.regStart,
    this.regEnd,
    this.eventStart,
    this.eventEnd,
    this.fileSubmissionEnd,
    this.winner1,
    this.winner2,
    this.winner3,
  });

  int? id;
  Venue? venue;
  Dept? dept;
  Coordinator? coordinator1;
  Coordinator? coordinator2;
  String? title;
  String? shortTitle;
  String? shortDesc;
  String? slug;
  String? desc;
  String? eventCategory;
  dynamic? prize;
  bool? isVisible;
  int? minMembersInTeam;
  int? maxMembersInTeam;
  int? maxTeams;
  bool? isTeam;
  int? fees;
  bool? isFeesTeam;
  bool? collectTeamName;
  String? templateForMail;
  String? image;
  String? certificationTemplate;
  String? coordinatorCertificationTemplate;
  String? winnerCertificationTemplate;
  bool? isRegOpen;
  bool? isFileUpload;
  String? guidelineFile;
  DateTime? regStart;
  DateTime? regEnd;
  DateTime? eventStart;
  DateTime? eventEnd;
  DateTime? fileSubmissionEnd;
  String? winner1;
  String? winner2;
  String? winner3;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        id: json["id"],
        venue: json["venue"] == null ? null : Venue.fromJson(json["venue"]),
        dept: json["dept"] == null ? null : Dept.fromJson(json["dept"]),
        coordinator1: json["coordinator_1"] == null
            ? null
            : Coordinator.fromJson(json["coordinator_1"]),
        coordinator2: json["coordinator_2"] == null
            ? null
            : Coordinator.fromJson(json["coordinator_2"]),
        title: json["title"],
        shortTitle: json["short_title"],
        shortDesc: json["short_desc"],
        slug: json["slug"],
        desc: json["desc"],
        eventCategory: json["event_category"],
        prize: json["prize"],
        isVisible: json["is_visible"],
        minMembersInTeam: json["min_members_in_team"],
        maxMembersInTeam: json["max_members_in_team"],
        maxTeams: json["max_teams"],
        isTeam: json["is_team"],
        fees: json["fees"],
        isFeesTeam: json["is_fees_team"],
        collectTeamName: json["collect_team_name"],
        templateForMail: json["template_for_mail"],
        image: json["image"],
        certificationTemplate: json["certification_template"],
        coordinatorCertificationTemplate:
            json["coordinator_certification_template"],
        winnerCertificationTemplate: json["winner_certification_template"],
        isRegOpen: json["is_reg_open"],
        isFileUpload: json["is_file_upload"],
        guidelineFile: json["guideline_file"],
        regStart: json["reg_start"] == null
            ? null
            : DateTime.parse(json["reg_start"]).toLocal(),
        regEnd: json["reg_end"] == null
            ? null
            : DateTime.parse(json["reg_end"]).toLocal(),
        eventStart: json["event_start"] == null
            ? null
            : DateTime.parse(json["event_start"]).toLocal(),
        eventEnd: json["event_end"] == null
            ? null
            : DateTime.parse(json["event_end"]).toLocal(),
        fileSubmissionEnd: json["file_submission_end"] == null
            ? null
            : DateTime.parse(json["file_submission_end"]).toLocal(),
        winner1: json["winner1"],
        winner2: json["winner2"],
        winner3: json["winner3"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "venue": venue?.toJson(),
        "dept": dept?.toJson(),
        "coordinator_1": coordinator1?.toJson(),
        "coordinator_2": coordinator2?.toJson(),
        "title": title,
        "short_title": shortTitle,
        "short_desc": shortDesc,
        "slug": slug,
        "desc": desc,
        "event_category": eventCategory,
        "prize": prize,
        "is_visible": isVisible,
        "min_members_in_team": minMembersInTeam,
        "max_members_in_team": maxMembersInTeam,
        "max_teams": maxTeams,
        "is_team": isTeam,
        "fees": fees,
        "is_fees_team": isFeesTeam,
        "collect_team_name": collectTeamName,
        "template_for_mail": templateForMail,
        "image": image,
        "certification_template": certificationTemplate,
        "coordinator_certification_template": coordinatorCertificationTemplate,
        "winner_certification_template": winnerCertificationTemplate,
        "is_reg_open": isRegOpen,
        "is_file_upload": isFileUpload,
        "guideline_file": guidelineFile,
        "reg_start": regStart?.toIso8601String(),
        "reg_end": regEnd?.toIso8601String(),
        "event_start": eventStart?.toIso8601String(),
        "event_end": eventEnd?.toIso8601String(),
        "file_submission_end": fileSubmissionEnd?.toIso8601String(),
        "winner1": winner1,
        "winner2": winner2,
        "winner3": winner3,
      };
}

class Coordinator {
  Coordinator({
    this.name,
    this.email,
    this.phoneNumber,
  });

  String? name;
  String? email;
  String? phoneNumber;

  factory Coordinator.fromJson(Map<String, dynamic> json) => Coordinator(
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "committee_name": phoneNumber,
      };
}

class Dept {
  Dept({
    this.id,
    this.title,
    this.shortForm,
    this.slug,
  });

  int? id;
  String? title;
  String? shortForm;
  String? slug;

  factory Dept.fromJson(Map<String, dynamic> json) => Dept(
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

class Venue {
  Venue({
    this.id,
    this.title,
    this.slug,
    this.picture,
    this.desc,
    this.shortDesc,
  });

  int? id;
  String? title;
  String? slug;
  String? picture;
  String? desc;
  String? shortDesc;

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        picture: json["picture"],
        desc: json["desc"],
        shortDesc: json["short_desc"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "picture": picture,
        "desc": desc,
        "short_desc": shortDesc,
      };
}
