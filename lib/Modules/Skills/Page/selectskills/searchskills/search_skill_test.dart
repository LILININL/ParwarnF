//Search Page
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:plawarn/modules/skills/page/selectskills/widget/api/skill_data.dart';
import 'package:plawarn/widget/model/dtos/skill/all_skill.dart';
import 'package:plawarn/widget/model/dtos/skill/leader_skill.dart';
import 'package:plawarn/widget/theme/constants/scema_color.dart';
import 'package:plawarn/widget/theme/constants/scema_textstyle.dart';

class Searchskillall extends StatefulWidget {
  const Searchskillall({super.key});

  @override
  State<Searchskillall> createState() => _SearchskillallState();
}

class _SearchskillallState extends State<Searchskillall> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isSearching = false;
  Future<List<Skillall>> skill = SkillallRequest.fetchSkill();

  final List _searchResult = [];
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
            decoration: const InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
                hintText: 'ค้นหาทักษะ',
                hintStyle: TextStyle(color: Colors.grey)),
          ),
        ),
      ),
      body: Container(
        constraints: const BoxConstraints(
          maxHeight: double.infinity,
          minWidth: double.infinity,
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              //Card Checkbox skills
              child: FutureBuilder<List<Skillall>>(
                future: skill,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final skill = snapshot.data![index];
                        return Card(
                          child: ListTile(
                            title: Text(skill.name!),
                            leading: SizedBox(
                              height: 40,
                              width: 40,
                              child: ClipRRect(
                                child: Hero(
                                  tag: 'imgae${skill.id}',
                                  child: FadeInImage.assetNetwork(
                                    placeholder: 'assets/images/loading.gif',
                                    image: skill.icon!,
                                  ),
                                ),
                              ),
                            ),
                            trailing: GFCheckbox(
                              value: skillsChecked.contains(skill.name!),
                              size: 25,
                              onChanged: (value) {
                                print(skill.name!);
                              },
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> skillsChecked = [];
