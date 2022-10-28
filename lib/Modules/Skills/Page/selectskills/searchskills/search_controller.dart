import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plawarn/modules/skills/page/selectskills/widget/api/skill_data.dart';
import 'package:plawarn/widget/model/dtos/skill/all_skill.dart';

class SearchskillallController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  bool isSearching = false;
  Future<List<Skillall>> skill = SkillallRequest.fetchSkill();
  final List searchResult = [];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
