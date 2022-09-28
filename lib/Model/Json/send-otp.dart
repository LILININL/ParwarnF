// To parse this JSON data, do
//
//     final sendOtp = sendOtpFromJson(jsonString);

import 'dart:convert';

SendOtp sendOtpFromJson(String str) => SendOtp.fromJson(json.decode(str));

String sendOtpToJson(SendOtp data) => json.encode(data.toJson());

class SendOtp {
  SendOtp({
    required this.mobileNumber,
    required this.locale,
  });

  String mobileNumber;
  String locale;

  factory SendOtp.fromJson(Map<String, dynamic> json) => SendOtp(
        mobileNumber: json["mobileNumber"],
        locale: json["locale"],
      );

  Map<String, dynamic> toJson() => {
        "mobileNumber": mobileNumber,
        "locale": locale,
      };
}
