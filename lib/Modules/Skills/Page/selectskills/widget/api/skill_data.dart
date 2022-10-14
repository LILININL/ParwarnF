import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:plawarn/widget/model/dtos/skill/leader_skill.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NetRequest {
  static const String url = 'https://api2.plawarn.com/skills';
  static List<Skilldata> pasrseSkill(String res) {
    final result = json.decode(res)['data'];
    return result.map<Skilldata>((json) => Skilldata.fromJson(json)).toList();
  }

  static Future<List<Skilldata>> fetchSkill() async {
    SharedPreferences saveToken = await SharedPreferences.getInstance();
    final token = saveToken.getString('token');
    SharedPreferences saveType = await SharedPreferences.getInstance();
    final type = saveType.getString('type');
    var headers = {
      'content-type': 'application/json; charset=utf-8',
      'accept': '*/*\'',
      'Authorization': '$type $token'
    };
    final res = await http.get(Uri.parse(url), headers: headers);
    if (res.statusCode == 200) {
      return compute(pasrseSkill, res.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
