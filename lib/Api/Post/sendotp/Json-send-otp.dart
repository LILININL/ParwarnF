// To parse this JSON data, do
//
//     final getSendOtp = getSendOtpFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetSendOtp getSendOtpFromJson(String str) =>
    GetSendOtp.fromJson(json.decode(str));

String getSendOtpToJson(GetSendOtp data) => json.encode(data.toJson());

class GetSendOtp {
  GetSendOtp({
    required this.mobileNumber,
    required this.serviceSid,
    required this.status,
    required this.sendedAt,
    required this.locale,
  });

  String mobileNumber;
  String serviceSid;
  String status;
  DateTime sendedAt;
  String locale;

  factory GetSendOtp.fromJson(Map<String, dynamic> json) => GetSendOtp(
        mobileNumber: json["mobileNumber"],
        serviceSid: json["serviceSid"],
        status: json["status"],
        sendedAt: DateTime.parse(json["sendedAt"]),
        locale: json["locale"],
      );

  Map<String, dynamic> toJson() => {
        "mobileNumber": mobileNumber,
        "serviceSid": serviceSid,
        "status": status,
        "sendedAt": sendedAt.toIso8601String(),
        "locale": locale,
      };
}
