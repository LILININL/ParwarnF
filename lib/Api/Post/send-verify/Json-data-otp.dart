// To parse this JSON data, do
//
//     final getDataOtp = getDataOtpFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetDataOtp getDataOtpFromJson(String str) =>
    GetDataOtp.fromJson(json.decode(str));

String getDataOtpToJson(GetDataOtp data) => json.encode(data.toJson());

class GetDataOtp {
  GetDataOtp({
    required this.type,
    required this.accessToken,
  });

  String type;
  String accessToken;

  factory GetDataOtp.fromJson(Map<String, dynamic> json) => GetDataOtp(
        type: json["type"],
        accessToken: json["accessToken"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "accessToken": accessToken,
      };
}
