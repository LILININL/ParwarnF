import 'package:flutter/material.dart';
import 'package:plawarn/modules/skills/page/selectskills/widget/api/skill_data.dart';

import 'package:plawarn/widget/model/dtos/skill/leader_skill.dart';
import 'package:plawarn/widget/theme/constants/scema_textstyle.dart';

class ButtonSheet extends StatefulWidget {
  @required
  final Skilldata skilldata;
  const ButtonSheet(this.skilldata, {super.key});

  @override
  State<ButtonSheet> createState() => _ButtonSheetState();
}

class _ButtonSheetState extends State<ButtonSheet> {
  @override
  void initState() {
    super.initState();
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
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  //checkbox flutter
                  Text("data"),
                  ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        child: Row(
                          children: [],
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
