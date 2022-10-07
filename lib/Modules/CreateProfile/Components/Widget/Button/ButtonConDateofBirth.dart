import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'package:plawarn/Components/Theme/constants/ScemaColor.dart';
import 'package:plawarn/Modules/CreateProfile/Components/Api/Profile-Info.dart';

class ButtonConDateofBirth extends StatelessWidget {
  const ButtonConDateofBirth({
    Key? key,
    required this.day,
    required this.defalutMonth,
    required this.year,
    required this.defalutGender,
  }) : super(key: key);

  final day;
  final defalutMonth;
  final year;
  final defalutGender;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: double.infinity,
        minWidth: double.infinity,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
        child: GFButton(
          onPressed: () async {
            D = day;
            M = defalutMonth;
            Y = year;
            G = defalutGender;

            // await sendProfile();
            Navigator.pushNamed(context, '/AvatarPage');
          },
          text: 'ดำเนินการต่อ',
          textStyle: const TextStyle(
              fontFamily: 'Noto',
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold),
          color: yell,
          fullWidthButton: true,
          size: 49,
        ),
      ),
    );
  }
}

String? D;
String? M;
String? Y;
String? G;
