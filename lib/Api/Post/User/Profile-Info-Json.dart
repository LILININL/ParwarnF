// To parse this JSON data, do
//
//     final profileInfo = profileInfoFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProfileInfo profileInfoFromJson(String str) =>
    ProfileInfo.fromJson(json.decode(str));

String profileInfoToJson(ProfileInfo data) => json.encode(data.toJson());

class ProfileInfo {
  ProfileInfo({
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.gender,
  });

  String firstName;
  String lastName;
  DateOfBirth dateOfBirth;
  String gender;

  factory ProfileInfo.fromJson(Map<String, dynamic> json) => ProfileInfo(
        firstName: json["firstName"],
        lastName: json["lastName"],
        dateOfBirth: DateOfBirth.fromJson(json["dateOfBirth"]),
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "dateOfBirth": dateOfBirth.toJson(),
        "gender": gender,
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
