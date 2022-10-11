// To parse this JSON data, do
//
//     final authFacebook = authFacebookFromJson(jsonString);

import 'dart:convert';

AuthFacebook authFacebookFromJson(String str) =>
    AuthFacebook.fromJson(json.decode(str));

String authFacebookToJson(AuthFacebook data) => json.encode(data.toJson());

class AuthFacebook {
  AuthFacebook({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
  });

  String id;
  String email;
  String firstName;
  String lastName;
  String gender;

  factory AuthFacebook.fromJson(Map<String, dynamic> json) => AuthFacebook(
        id: json["id"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "gender": gender,
      };
}
