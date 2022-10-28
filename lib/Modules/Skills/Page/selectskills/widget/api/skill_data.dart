import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:plawarn/widget/model/dtos/skill/all_skill.dart';
import 'package:plawarn/widget/model/dtos/skill/childrens_skill.dart';
import 'package:plawarn/widget/model/dtos/skill/leader_skill.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../select_skills.dart';

class SkillRequest {
  static const String url = 'https://api2.plawarn.com/skills';
  static List<Skilldata> pasrseSkill(String res) {
    final result = json.decode(res)['data'];
    return result.map<Skilldata>((json) => Skilldata.fromJson(json)).toList();
  }

  static Future<List<Skilldata>> fetchSkill() async {
    await Future.delayed(const Duration(seconds: 1));
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

Future<List<ChildrensSkill>> getSkill() async {
  await Future.delayed(const Duration(seconds: 1));
  String url = 'https://api2.plawarn.com/skills/$idkskill';
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
  final result = json.decode(res.body)['childrens'];
  return result
      .map<ChildrensSkill>((json) => ChildrensSkill.fromJson(json))
      .toList();
}

//dio
// Future<List<ChildrensSkill>> getSkill() async {
//   await Future.delayed(const Duration(seconds: 1));
//   String url = 'https://api2.plawarn.com/skills/$idkskill';
//   SharedPreferences saveToken = await SharedPreferences.getInstance();
//   final token = saveToken.getString('token');
//   SharedPreferences saveType = await SharedPreferences.getInstance();
//   final type = saveType.getString('type');
//   var headers = {
//     'content-type': 'application/json; charset=utf-8',
//     'accept': '*/*\'',
//     'Authorization': '$type $token'
//   };

//   final res = await Dio().get(url, options: Options(headers: headers));
//   final result = res.data['childrens'] as List;
//   return result.map((e) => ChildrensSkill.fromJson(e)).toList();
// }
//Dio Option

// Future<List<Skillall>> getSkillall() async {
//   await Future.delayed(const Duration(seconds: 1));
//   String url = 'https://api2.plawarn.com/skills/all';
//   SharedPreferences saveToken = await SharedPreferences.getInstance();
//   final token = saveToken.getString('token');
//   SharedPreferences saveType = await SharedPreferences.getInstance();
//   final type = saveType.getString('type');
//   var headers = {
//     'content-type': 'application/json; charset=utf-8',
//     'accept': '*/*\'',
//     'Authorization': '$type $token'
//   };

//   final res = await Dio().get(url, options: Options(headers: headers));
//   final result = res.data['data'] as List;
//   return result.map((e) => Skillall.fromJson(e)).toList();
// }

class SkillallRequest {
  static const String url = 'https://api2.plawarn.com/skills/all';
  static List<Skillall> pasrseSkill(String res) {
    final result = json.decode(res)['data'];
    return result.map<Skillall>((json) => Skillall.fromJson(json)).toList();
  }

  static Future<List<Skillall>> fetchSkill() async {
    // await Future.delayed(const Duration(seconds: 1));
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
