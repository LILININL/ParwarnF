import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plawarn/modules/skills/page/selectskills/widget/api/skill_data.dart';
import 'package:plawarn/widget/model/dtos/skill/all_skill.dart';

import '../../../../../widget/model/dtos/skill/tags_skill.dart';

class SearchskillallController extends GetxController {
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

  final TextEditingController searchController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  bool isSearching = false;
  Future<List<Skillall>> skill = SkillallRequest.fetchSkill();
  final List searchResult = [];

  void searchOperation(String searchText) {
    searchResult.clear();
    if (searchText.isNotEmpty) {
      skill.then((value) {
        value.forEach((element) {
          if (element.name!.toLowerCase().contains(searchText.toLowerCase())) {
            searchResult.add(element);
          }
        });
      });
    }
  }

  late List<skilladd> childskillid;
  List<String> skillsChecked = [];

  void onSelected(bool selected, String id) {
    if (selected == true && skillsChecked.length <= 3) {
      skillsChecked.add(id);
      childskillid = skillsChecked.map((e) => skilladd(e)).toList();
    } else {
      skillsChecked.remove(id);
      childskillid = skillsChecked.map((e) => skilladd(e)).toList();
    }
  }
}
