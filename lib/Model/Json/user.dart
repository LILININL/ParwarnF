// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.email,
    required this.mobileNumber,
    required this.firstName,
    required this.lastName,
    required this.avatar,
    required this.dateOfBirth,
    required this.gender,
    required this.type,
    required this.bio,
    required this.skills,
    required this.experiences,
  });

  String email;
  String mobileNumber;
  String firstName;
  String lastName;
  String avatar;
  DateOfBirth dateOfBirth;
  String gender;
  String type;
  String bio;
  List<Skill> skills;
  List<Experience> experiences;

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        mobileNumber: json["mobileNumber"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        avatar: json["avatar"],
        dateOfBirth: DateOfBirth.fromJson(json["dateOfBirth"]),
        gender: json["gender"],
        type: json["type"],
        bio: json["bio"],
        skills: List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
        experiences: List<Experience>.from(
            json["experiences"].map((x) => Experience.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "mobileNumber": mobileNumber,
        "firstName": firstName,
        "lastName": lastName,
        "avatar": avatar,
        "dateOfBirth": dateOfBirth.toJson(),
        "gender": gender,
        "type": type,
        "bio": bio,
        "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
        "experiences": List<dynamic>.from(experiences.map((x) => x.toJson())),
      };
}

class DateOfBirth {
  DateOfBirth({
    required this.date,
    required this.month,
    required this.year,
  });

  String date;
  String month;
  String year;

  factory DateOfBirth.fromJson(Map<String, dynamic> json) => DateOfBirth(
        date: json["date"],
        month: json["month"],
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "month": month,
        "year": year,
      };
}

class Experience {
  Experience({
    required this.company,
    required this.title,
    required this.startYear,
    required this.startMonth,
    required this.endYear,
    required this.endMonth,
    required this.currently,
  });

  String company;
  String title;
  int startYear;
  int startMonth;
  int endYear;
  int endMonth;
  bool currently;

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        company: json["company"],
        title: json["title"],
        startYear: json["startYear"],
        startMonth: json["startMonth"],
        endYear: json["endYear"],
        endMonth: json["endMonth"],
        currently: json["currently"],
      );

  Map<String, dynamic> toJson() => {
        "company": company,
        "title": title,
        "startYear": startYear,
        "startMonth": startMonth,
        "endYear": endYear,
        "endMonth": endMonth,
        "currently": currently,
      };
}

class Skill {
  Skill({
    required this.parent,
    required this.childrens,
    required this.wageRate,
  });

  String parent;
  List<String> childrens;
  int wageRate;

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        parent: json["parent"],
        childrens: List<String>.from(json["childrens"].map((x) => x)),
        wageRate: json["wageRate"],
      );

  Map<String, dynamic> toJson() => {
        "parent": parent,
        "childrens": List<dynamic>.from(childrens.map((x) => x)),
        "wageRate": wageRate,
      };
}
