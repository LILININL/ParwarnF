//search skill page

import 'package:flutter/material.dart';
import 'package:plawarn/modules/skills/page/selectskills/widget/api/skill_data.dart';
import 'package:plawarn/widget/model/dtos/skill/all_skill.dart';
import 'package:plawarn/widget/model/dtos/skill/childrens_skill.dart';
import 'package:plawarn/widget/model/dtos/skill/leader_skill.dart';
import 'package:plawarn/widget/theme/constants/scema_color.dart';

class Skillsearch extends StatefulWidget {
  static const String routeName = '/skillsearch';

  @override
  _SkillsearchState createState() => _SkillsearchState();
}

class _SkillsearchState extends State<Skillsearch> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isSearching = false;
  Future<List<Skillall>> skill = SkillallRequest.fetchSkill();
  final List _searchResult = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      if (_searchController.text.isEmpty) {
        setState(() {
          _isSearching = false;
          _searchResult.clear();
        });
      } else {
        setState(() {
          _isSearching = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: TextField(
          focusNode: _focusNode,
          controller: _searchController,
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'ค้นหาทักษะ',
              hintStyle: TextStyle(color: Colors.black, fontSize: 16)),
        ),
      ),
      body: Container(
        child: FutureBuilder<List<Skillall>>(
          future: skill,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final skillc = snapshot.data![index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Text(
                          skillc.name!,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        height: 100,
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: skillc.childrens!.length,
                          itemBuilder: (context, index) {
                            final skillcc = skillc.childrens![index];
                            return Container(
                              width: 100,
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      skillcc.name!,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
