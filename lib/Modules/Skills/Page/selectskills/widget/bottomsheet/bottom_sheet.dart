import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:plawarn/modules/skills/page/selectskills/widget/api/skill_data.dart';
import 'package:plawarn/modules/skills/page/selectskills/widget/bottomsheet/data_controller.dart';
import 'package:plawarn/widget/model/dtos/skill/childrens_skill.dart';
import 'package:plawarn/widget/model/dtos/skill/leader_skill.dart';
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

  @override
  void initState() {
    super.initState();
    getSkill();
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      constraints: const BoxConstraints(
        maxHeight: double.infinity,
        minWidth: double.infinity,
      ),
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
            child: Text('เลือกทักษะที่คุณสามารถทำได้', style: subtitletext18),
          ),
          Container(
            constraints: const BoxConstraints(
              maxHeight: double.infinity,
              minWidth: double.infinity,
            ),
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 15, 0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FutureBuilder(
                      future: childrensSkill,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(snapshot.data![index].name!),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return const CircularProgressIndicator();
                      },
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
