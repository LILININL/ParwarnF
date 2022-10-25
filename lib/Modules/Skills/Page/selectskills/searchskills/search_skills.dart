//search skill page

import 'package:flutter/material.dart';
import 'package:plawarn/modules/skills/page/selectskills/widget/api/skill_data.dart';
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
  Future<List<ChildrensSkill>> childrensSkill = getSkill();
  final List<ChildrensSkill> _searchResult = [];

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        setState(() {
          _isSearching = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.blueAccent,
            iconSize: 18,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        elevation: 0,
        leadingWidth: 30,
        title: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: colord,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: colorc)),
          child: TextField(
            focusNode: _focusNode,
            controller: _searchController,
            onTap: () {
              setState(() {
                _isSearching = true;
              });
            },
            decoration: const InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
                hintText: 'ค้นหาทักษะ',
                hintStyle: TextStyle(color: Colors.grey)),
          ),
        ),
      ),
      body: _isSearching ? _buildSearch() : _buildSearchResult(),
    );
  }

  Widget _buildSearch() {
    return FutureBuilder<List<ChildrensSkill>>(
      future: childrensSkill,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final ChildrensSkill skill = snapshot.data![index];
              return ListTile(
                title: Text(skill.name!),
                onTap: () {
                  setState(() {
                    _isSearching = false;
                    _searchController.text = skill.name!;
                    _searchResult.add(skill);
                  });
                },
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  } //end build search

  Widget _buildSearchResult() {
    return ListView.builder(
      itemCount: _searchResult.length,
      itemBuilder: (context, index) {
        final ChildrensSkill skill = _searchResult[index];
        return ListTile(
          title: Text(skill.name!),
          onTap: () {
            setState(() {
              _searchResult.removeAt(index);
            });
          },
        );
      },
    );
  } //end build search result
}
