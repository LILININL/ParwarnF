import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import 'package:plawarn/modules/skills/page/selectskills/widget/api/skill_data.dart';
import 'package:plawarn/modules/skills/page/selectskills/widget/appbar/searchskillbar.dart';
import 'package:plawarn/modules/skills/page/selectskills/widget/bottomsheet/bottom_sheet.dart';
import 'package:plawarn/modules/skills/page/selectskills/widget/cell/grid_cell.dart';
import 'package:plawarn/provider/view/api/check_user.dart';
import 'package:plawarn/provider/view/user_view_model.dart';
import 'package:plawarn/widget/model/dtos/skill/childrens_skill.dart';
import 'package:plawarn/widget/model/dtos/skill/leader_skill.dart';
import 'package:plawarn/widget/theme/constants/scema_color.dart';
import 'package:plawarn/widget/theme/constants/scema_textstyle.dart';

class Selectskill extends StatefulWidget {
  static const String routeName = '/Selectskill';

  @override
  State<Selectskill> createState() => _SelectskillState();
}

String? idkskill;

class _SelectskillState extends State<Selectskill> {
  @override
  void initState() {
    super.initState();
    // getProfile();
    // checkUser();
  }

  gridView(AsyncSnapshot<List<Skilldata>> snapshot) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: snapshot.data!.map((skilldata) {
          return GestureDetector(
            child: GridTile(
              child: Skillcell(skilldata),
            ),
            onTap: () async {
              print('id=${skilldata.id}');
              print('name=${skilldata.name}');
              print('sequence=${skilldata.sequence}');
              setState(() {});
              idkskill = skilldata.id;

              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  context: context,
                  builder: ((builder) => ButtonSheet(
                        skilldata,
                        skilldata.id,
                      )));
            },
          );
        }).toList(),
      ),
    );
  }

  circularProgress() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Searchskillbar(),
      body: Container(
        constraints: const BoxConstraints(
          maxHeight: double.infinity,
          minWidth: double.infinity,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 24, 10, 0),
              child: Text(
                'ทักษะที่เลือก',
                style: titletext18,
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 8, 0, 30),
              child: Text('Tags', style: subtitletext18),
            ),
            Expanded(
                child: Column(
              children: <Widget>[
                Flexible(
                    flex: 1,
                    child: FutureBuilder<List<Skilldata>>(
                      future: SkillRequest.fetchSkill(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (snapshot.hasData) {
                          return gridView(snapshot);
                        }
                        return circularProgress();
                      },
                    )),
              ],
            )),
          ],
        ),
      ),
      backgroundColor: Background,
    );
  }
}
