// To parse this JSON data, do
//
//     final GetTokendata = GetTokendataFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetTokendata GetTokendataFromJson(String str) =>
    GetTokendata.fromJson(json.decode(str));

String GetTokendataToJson(GetTokendata data) => json.encode(data.toJson());

class GetTokendata {
  GetTokendata({
    required this.type,
    required this.accessToken,
  });

  String type;
  String accessToken;

  factory GetTokendata.fromJson(Map<String, dynamic> json) => GetTokendata(
        type: json["type"],
        accessToken: json["accessToken"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "accessToken": accessToken,
      };
}
