// To parse this JSON data, do
//
//     final skilldata = skilldataFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Skilldata> skilldataFromJson(String str) =>
    List<Skilldata>.from(json.decode(str).map((x) => Skilldata.fromJson(x)));

String skilldataToJson(List<Skilldata> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Skilldata {
  Skilldata({
    required this.id,
    required this.name,
    required this.slug,
    required this.icon,
    required this.color,
    required this.sequence,
    required this.type,
    required this.translations,
    required this.createdAt,
    required this.updatedAt,
    required this.skilldatumId,
  });

  String id;
  String name;
  String slug;
  String icon;
  String color;
  int sequence;
  String type;
  List<Translation> translations;
  DateTime createdAt;
  DateTime updatedAt;
  String skilldatumId;

  factory Skilldata.fromJson(Map<String, dynamic> json) => Skilldata(
        id: json["_id"],
        name: json["name"],
        slug: json["slug"],
        icon: json["icon"],
        color: json["color"],
        sequence: json["sequence"],
        type: json["type"],
        translations: List<Translation>.from(
            json["translations"].map((x) => Translation.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        skilldatumId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "slug": slug,
        "icon": icon,
        "color": color,
        "sequence": sequence,
        "type": type,
        "translations": List<dynamic>.from(translations.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "id": skilldatumId,
      };
}

class Translation {
  Translation({
    required this.lang,
    required this.name,
    required this.id,
  });

  String lang;
  String name;
  String id;

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        lang: json["lang"],
        name: json["name"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "lang": lang,
        "name": name,
        "_id": id,
      };
}
