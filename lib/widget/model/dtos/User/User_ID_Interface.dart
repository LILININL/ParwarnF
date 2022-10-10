// To parse this JSON data, do
//
//     final userIdInterface = userIdInterfaceFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UserIdInterface userIdInterfaceFromJson(String str) =>
    UserIdInterface.fromJson(json.decode(str));

String userIdInterfaceToJson(UserIdInterface data) =>
    json.encode(data.toJson());

class UserIdInterface {
  UserIdInterface({
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
    required this.identityVerification,
    required this.agreement,
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
  List<Skill> skills;
  List<dynamic> addresses;
  List<Experience> experiences;
  List<dynamic> socials;
  DateTime createdAt;
  DateTime updatedAt;
  IdentityVerification identityVerification;
  Agreement agreement;
  String fullName;

  factory UserIdInterface.fromJson(Map<String, dynamic> json) =>
      UserIdInterface(
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
        skills: List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
        addresses: List<dynamic>.from(json["addresses"].map((x) => x)),
        experiences: List<Experience>.from(
            json["experiences"].map((x) => Experience.fromJson(x))),
        socials: List<dynamic>.from(json["socials"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        identityVerification:
            IdentityVerification.fromJson(json["identityVerification"]),
        agreement: Agreement.fromJson(json["agreement"]),
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
        "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
        "addresses": List<dynamic>.from(addresses.map((x) => x)),
        "experiences": List<dynamic>.from(experiences.map((x) => x.toJson())),
        "socials": List<dynamic>.from(socials.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "identityVerification": identityVerification.toJson(),
        "agreement": agreement.toJson(),
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

class Agreement {
  Agreement({
    required this.id,
    required this.eSignature,
    required this.updatedAt,
  });

  String id;
  String eSignature;
  DateTime updatedAt;

  factory Agreement.fromJson(Map<String, dynamic> json) => Agreement(
        id: json["_id"],
        eSignature: json["eSignature"],
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "eSignature": eSignature,
        "updatedAt": updatedAt.toIso8601String(),
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

class Experience {
  Experience({
    required this.company,
    required this.title,
    required this.startYear,
    required this.startMonth,
    required this.endYear,
    required this.endMonth,
    required this.currently,
    required this.id,
    required this.updatedAt,
    required this.createdAt,
  });

  String company;
  String title;
  int startYear;
  int startMonth;
  int endYear;
  int endMonth;
  String currently;
  String id;
  DateTime updatedAt;
  DateTime createdAt;

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        company: json["company"],
        title: json["title"],
        startYear: json["startYear"],
        startMonth: json["startMonth"],
        endYear: json["endYear"],
        endMonth: json["endMonth"],
        currently: json["currently"],
        id: json["_id"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "company": company,
        "title": title,
        "startYear": startYear,
        "startMonth": startMonth,
        "endYear": endYear,
        "endMonth": endMonth,
        "currently": currently,
        "_id": id,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
      };
}

class IdentityVerification {
  IdentityVerification({
    required this.note,
    required this.address,
    required this.firstName,
    required this.gender,
    required this.lastName,
    required this.number,
    required this.postcode,
    required this.prefix,
    required this.type,
    required this.updatedAt,
    required this.document1,
    required this.document2,
    required this.status,
  });

  dynamic note;
  String address;
  String firstName;
  String gender;
  String lastName;
  int number;
  String postcode;
  String prefix;
  String type;
  DateTime updatedAt;
  String document1;
  String document2;
  String status;

  factory IdentityVerification.fromJson(Map<String, dynamic> json) =>
      IdentityVerification(
        note: json["note"],
        address: json["address"],
        firstName: json["firstName"],
        gender: json["gender"],
        lastName: json["lastName"],
        number: json["number"],
        postcode: json["postcode"],
        prefix: json["prefix"],
        type: json["type"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        document1: json["document1"],
        document2: json["document2"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "note": note,
        "address": address,
        "firstName": firstName,
        "gender": gender,
        "lastName": lastName,
        "number": number,
        "postcode": postcode,
        "prefix": prefix,
        "type": type,
        "updatedAt": updatedAt.toIso8601String(),
        "document1": document1,
        "document2": document2,
        "status": status,
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

class Skill {
  Skill({
    required this.location,
    required this.parent,
    required this.childrens,
    required this.wageRate,
    required this.id,
    required this.updatedAt,
    required this.createdAt,
  });

  Location location;
  Parent parent;
  List<Parent> childrens;
  int wageRate;
  String id;
  DateTime updatedAt;
  DateTime createdAt;

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        location: Location.fromJson(json["location"]),
        parent: Parent.fromJson(json["parent"]),
        childrens:
            List<Parent>.from(json["childrens"].map((x) => Parent.fromJson(x))),
        wageRate: json["wageRate"],
        id: json["_id"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "parent": parent.toJson(),
        "childrens": List<dynamic>.from(childrens.map((x) => x.toJson())),
        "wageRate": wageRate,
        "_id": id,
        "updatedAt": updatedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
      };
}

class Parent {
  Parent({
    required this.id,
    required this.parent,
    required this.name,
    required this.slug,
    required this.sequence,
    required this.type,
    required this.translations,
    required this.createdAt,
    required this.updatedAt,
    required this.icon,
    required this.color,
  });

  String id;
  String parent;
  String name;
  String slug;
  int sequence;
  String type;
  List<Translation> translations;
  DateTime createdAt;
  DateTime updatedAt;
  String icon;
  String color;

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        id: json["_id"],
        parent: json["parent"] == null ? null : json["parent"],
        name: json["name"],
        slug: json["slug"],
        sequence: json["sequence"],
        type: json["type"],
        translations: List<Translation>.from(
            json["translations"].map((x) => Translation.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        icon: json["icon"] == null ? null : json["icon"],
        color: json["color"] == null ? null : json["color"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "parent": parent == null ? null : parent,
        "name": name,
        "slug": slug,
        "sequence": sequence,
        "type": type,
        "translations": List<dynamic>.from(translations.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "icon": icon == null ? null : icon,
        "color": color == null ? null : color,
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

class Location {
  Location({
    required this.all,
    required this.provinces,
  });

  bool all;
  List<dynamic> provinces;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        all: json["all"],
        provinces: List<dynamic>.from(json["provinces"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "all": all,
        "provinces": List<dynamic>.from(provinces.map((x) => x)),
      };
}
