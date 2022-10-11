// To parse this JSON data, do
//
//     final userId = userIdFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserId userIdFromJson(String str) => UserId.fromJson(json.decode(str));

String userIdToJson(UserId data) => json.encode(data.toJson());

class UserId {
  UserId({
    required this.dateOfBirth,
    required this.address,
    required this.login,
    required this.device,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.avatar,
    required this.gender,
    required this.bio,
    required this.career,
    required this.type,
    required this.skills,
    required this.addresses,
    required this.experiences,
    required this.socials,
    required this.createdAt,
    required this.updatedAt,
    required this.fullName,
  });

  DateOfBirth dateOfBirth;
  Address address;
  Login login;
  Device device;
  String id;
  String firstName;
  String lastName;
  String mobileNumber;
  String avatar;
  String gender;
  String bio;
  String career;
  String type;
  List<dynamic> skills;
  List<dynamic> addresses;
  List<dynamic> experiences;
  List<dynamic> socials;
  DateTime createdAt;
  DateTime updatedAt;
  String fullName;

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        dateOfBirth: DateOfBirth.fromJson(json["dateOfBirth"]),
        address: Address.fromJson(json["address"]),
        login: Login.fromJson(json["login"]),
        device: Device.fromJson(json["device"]),
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        mobileNumber: json["mobileNumber"],
        avatar: json["avatar"],
        gender: json["gender"],
        bio: json["bio"],
        career: json["career"],
        type: json["type"],
        skills: List<dynamic>.from(json["skills"].map((x) => x)),
        addresses: List<dynamic>.from(json["addresses"].map((x) => x)),
        experiences: List<dynamic>.from(json["experiences"].map((x) => x)),
        socials: List<dynamic>.from(json["socials"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        fullName: json["fullName"],
      );

  Map<String, dynamic> toJson() => {
        "dateOfBirth": dateOfBirth.toJson(),
        "address": address.toJson(),
        "login": login.toJson(),
        "device": device.toJson(),
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "mobileNumber": mobileNumber,
        "avatar": avatar,
        "gender": gender,
        "bio": bio,
        "career": career,
        "type": type,
        "skills": List<dynamic>.from(skills.map((x) => x)),
        "addresses": List<dynamic>.from(addresses.map((x) => x)),
        "experiences": List<dynamic>.from(experiences.map((x) => x)),
        "socials": List<dynamic>.from(socials.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "fullName": fullName,
      };
}

class Address {
  Address({
    required this.fullAddress,
    required this.postcode,
  });

  String fullAddress;
  String postcode;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        fullAddress: json["fullAddress"],
        postcode: json["postcode"],
      );

  Map<String, dynamic> toJson() => {
        "fullAddress": fullAddress,
        "postcode": postcode,
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

class Device {
  Device({
    required this.deviceId,
    required this.deviceName,
    required this.platform,
    required this.pushToken,
  });

  String deviceId;
  String deviceName;
  String platform;
  String pushToken;

  factory Device.fromJson(Map<String, dynamic> json) => Device(
        deviceId: json["deviceId"],
        deviceName: json["deviceName"],
        platform: json["platform"],
        pushToken: json["pushToken"],
      );

  Map<String, dynamic> toJson() => {
        "deviceId": deviceId,
        "deviceName": deviceName,
        "platform": platform,
        "pushToken": pushToken,
      };
}

class Login {
  Login({
    required this.status,
    required this.logonTime,
  });

  String status;
  dynamic logonTime;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        status: json["status"],
        logonTime: json["logonTime"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "logonTime": logonTime,
      };
}
