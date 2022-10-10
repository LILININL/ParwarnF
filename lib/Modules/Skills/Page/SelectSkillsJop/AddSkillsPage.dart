import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getwidget/getwidget.dart';
import 'package:plawarn/Components/Theme/constants/ScemaTextStyle.dart';
import 'package:plawarn/Components/Theme/constants/ScemaColor.dart';
import 'package:plawarn/Modules/skills/Page/AddSkill/ColunmAddSkill.dart';
import 'package:plawarn/Modules/skills/Widget/Appbar/SkillAddBar.dart';

class AddSkills extends StatefulWidget {
  const AddSkills({super.key});
  static const String routeName = '/AddSkills';

  @override
  State<AddSkills> createState() => _AddSkillState();
}

class _AddSkillState extends State<AddSkills> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const SkillsAddBar(),
      body: Container(
        constraints: const BoxConstraints(
          maxHeight: double.infinity,
          minWidth: double.infinity,
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/onboard/onboard.png',
                        scale: 2,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(16, 26, 16, 0),
                      child: Text(
                        'เลือกทักษะที่คุณสนใจ โดยระบบจะค้นหางานให้เหมาะสมกับทักษะที่คุณเลือก',
                        style: textStyle18,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const ColounmAddSkills()
          ],
        ),
      ),
      bottomNavigationBar: Container(
        constraints: const BoxConstraints(
          maxHeight: double.infinity,
          minWidth: double.infinity,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
          child: GFButton(
            onPressed: () {
              // Navigator.pushNamed(context, LoginMobile.routeName);
            },
            text: 'เพิ่มทักษะ',
            color: yell,
            textStyle: const TextStyle(fontSize: 18, fontFamily: 'Noto'),
            fullWidthButton: true,
            size: 49,
          ),
        ),
      ),
    );
  }
}
