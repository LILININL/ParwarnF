import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:plawarn/Components/Theme/constants/ScemaTextStyle.dart';
import 'package:plawarn/Components/Theme/constants/ScemaColor.dart';

class ColounmAddSkills extends StatelessWidget {
  const ColounmAddSkills({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(17, 0, 17, 30),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
                child: Container(
                  constraints: const BoxConstraints(
                    maxHeight: double.infinity,
                    minWidth: double.infinity,
                  ),
                  child: GFBorder(
                    dashedLine: const [4, 6],
                    type: GFBorderType.rect,
                    color: blurpimary,
                    child: TextButton(
                      child: const Text(
                        'ทักษะที่ 1',
                        style: SkillsTextStyle18,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Container(
                  constraints: const BoxConstraints(
                    maxHeight: double.infinity,
                    minWidth: double.infinity,
                  ),
                  child: GFBorder(
                    dashedLine: const [4, 6],
                    type: GFBorderType.rect,
                    color: blurpimary,
                    child: TextButton(
                      child: const Text(
                        'ทักษะที่ 2',
                        style: SkillsTextStyle18,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Container(
                  constraints: const BoxConstraints(
                    maxHeight: double.infinity,
                    minWidth: double.infinity,
                  ),
                  child: GFBorder(
                    dashedLine: const [4, 6],
                    type: GFBorderType.rect,
                    color: blurpimary,
                    child: TextButton(
                      child: const Text(
                        'ทักษะที่ 3',
                        style: SkillsTextStyle18,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
