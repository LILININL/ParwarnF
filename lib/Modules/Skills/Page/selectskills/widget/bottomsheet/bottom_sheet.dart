import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:plawarn/modules/skills/page/selectskills/widget/api/skill_data.dart';
import 'package:plawarn/widget/model/dtos/skill/childrens_skill.dart';
import 'package:plawarn/widget/model/dtos/skill/leader_skill.dart';
import 'package:plawarn/widget/theme/constants/scema_color.dart';
import 'package:plawarn/widget/theme/constants/scema_textstyle.dart';

class ButtonSheet extends StatefulWidget {
  @required
  final Skilldata skilldata;

  const ButtonSheet(
    this.skilldata,
    String name, {
    super.key,
  });

  @override
  State<ButtonSheet> createState() => _ButtonSheetState();
}

class _ButtonSheetState extends State<ButtonSheet> {
  Future<List<ChildrensSkill>> childrensSkill = getSkill();
  List<String> skillsChecked = [];
  @override
  void initState() {
    super.initState();
    // getSkill();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      constraints: const BoxConstraints(
        maxHeight: double.infinity,
        minWidth: double.infinity,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 24, 10, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: ClipRRect(
                      child: Hero(
                        tag: 'imgae${widget.skilldata.id}',
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/images/loading.gif',
                          image: widget.skilldata.icon,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      widget.skilldata.name,
                      style: textStyle24bold,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: Text('เลือกทักษะที่คุณสามารถทำได้มากสุด 3 รายการ',
                  style: subtitletext18),
            ),
            Container(
              constraints: const BoxConstraints(
                maxHeight: double.infinity,
                minWidth: double.infinity,
              ),
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: Column(children: <Widget>[
                  FutureBuilder<List<ChildrensSkill>>(
                    future: childrensSkill,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return GFCheckboxListTile(
                              position: GFPosition.start,
                              inactiveBgColor: colorE,
                              activeBorderColor: colorG,
                              size: 25,
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              margin: const EdgeInsets.all(0),
                              value: skillsChecked
                                  .contains(snapshot.data![index].name!),
                              onChanged: (val) {
                                _onSelected(val, snapshot.data![index].name!,
                                    snapshot.data![index].type!);
                              },
                              title: Text(snapshot.data![index].name!,
                                  style: textStyle18),
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return circularProgressCenter();
                    },
                  ),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: GFButton(
                position: GFPosition.start,
                onPressed: () {
                  setState(() {
                    print(skillsChecked);
                  });

                  // Navigator.pop(context);
                },
                text: 'ยืนยัน',
                color: yell,
                textStyle: const TextStyle(fontSize: 18, fontFamily: 'Noto'),
                fullWidthButton: true,
                size: 49,
              ),
            )
          ],
        ),
      ),
    );
  }

  circularProgressCenter() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(30),
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(yell),
        ),
      ),
    );
  }

  late List<skilladd> childskillid;

  void _onSelected(bool selected, String id, String parent) {
    if (selected == true && skillsChecked.length <= 2) {
      setState(() {
        skillsChecked.add(id);
        childskillid = skillsChecked.map((e) => skilladd(e)).toList();
      });
    } else {
      setState(() {
        skillsChecked.remove(id);
        childskillid = skillsChecked.map((e) => skilladd(e)).toList();
      });
    }
  }
}

class skilladd {
  String? id;
  skilladd(this.id);
}
