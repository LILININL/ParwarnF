// To parse this JSON data, do
//
//     final childrensSkill = childrensSkillFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ChildrensSkill childrensSkillFromJson(String str) =>
    ChildrensSkill.fromJson(json.decode(str));

String childrensSkillToJson(ChildrensSkill data) => json.encode(data.toJson());

class ChildrensSkill {
  ChildrensSkill({
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
    required this.childrens,
  });

  String? id;
  String? name;
  String? slug;
  String? icon;
  String? color;
  int? sequence;
  String? type;
  List<Translation>? translations;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Children>? childrens;

  factory ChildrensSkill.fromJson(Map<String, dynamic> json) => ChildrensSkill(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        slug: json["slug"] == null ? null : json["slug"],
        icon: json["icon"] == null ? null : json["icon"],
        color: json["color"] == null ? null : json["color"],
        sequence: json["sequence"] == null ? null : json["sequence"],
        type: json["type"] == null ? null : json["type"],
        translations: json["translations"] == null
            ? null
            : List<Translation>.from(
                json["translations"].map((x) => Translation.fromJson(x))),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        childrens: json["childrens"] == null
            ? null
            : List<Children>.from(
                json["childrens"].map((x) => Children.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "slug": slug == null ? null : slug,
        "icon": icon == null ? null : icon,
        "color": color == null ? null : color,
        "sequence": sequence == null ? null : sequence,
        "type": type == null ? null : type,
        "translations": translations == null
            ? null
            : List<dynamic>.from(translations!.map((x) => x.toJson())),
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "childrens": childrens == null
            ? null
            : List<dynamic>.from(childrens!.map((x) => x.toJson())),
      };
}

class Children {
  Children({
    required this.id,
    required this.parent,
    required this.name,
    required this.slug,
    required this.sequence,
    required this.type,
    required this.translations,
    required this.createdAt,
    required this.updatedAt,
  });

  String? id;
  String? parent;
  String? name;
  String? slug;
  int? sequence;
  String? type;
  List<Translation>? translations;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Children.fromJson(Map<String, dynamic> json) => Children(
        id: json["_id"] == null ? null : json["_id"],
        parent: json["parent"] == null ? null : json["parent"],
        name: json["name"] == null ? null : json["name"],
        slug: json["slug"] == null ? null : json["slug"],
        sequence: json["sequence"] == null ? null : json["sequence"],
        type: json["type"] == null ? null : json["type"],
        translations: json["translations"] == null
            ? null
            : List<Translation>.from(
                json["translations"].map((x) => Translation.fromJson(x))),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "parent": parent == null ? null : parent,
        "name": name == null ? null : name,
        "slug": slug == null ? null : slug,
        "sequence": sequence == null ? null : sequence,
        "type": type == null ? null : type,
        "translations": translations == null
            ? null
            : List<dynamic>.from(translations!.map((x) => x.toJson())),
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}

class Translation {
  Translation({
    required this.lang,
    required this.name,
    required this.id,
  });

  String? lang;
  String? name;
  String? id;

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        lang: json["lang"] == null ? null : json["lang"],
        name: json["name"] == null ? null : json["name"],
        id: json["_id"] == null ? null : json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "lang": lang == null ? null : lang,
        "name": name == null ? null : name,
        "_id": id == null ? null : id,
      };
}
