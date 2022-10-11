// To parse this JSON data, do
//
//     final verifyOtp = verifyOtpFromJson(jsonString);

import 'dart:convert';

VerifyOtp verifyOtpFromJson(String str) => VerifyOtp.fromJson(json.decode(str));

String verifyOtpToJson(VerifyOtp data) => json.encode(data.toJson());

class VerifyOtp {
  VerifyOtp({
    required this.mobileNumber,
    required this.code,
    required this.serviceSid,
  });

  String mobileNumber;
  String code;
  String serviceSid;

  factory VerifyOtp.fromJson(Map<String, dynamic> json) => VerifyOtp(
        mobileNumber: json["mobileNumber"],
        code: json["code"],
        serviceSid: json["serviceSid"],
      );

  Map<String, dynamic> toJson() => {
        "mobileNumber": mobileNumber,
        "code": code,
        "serviceSid": serviceSid,
      };
}
