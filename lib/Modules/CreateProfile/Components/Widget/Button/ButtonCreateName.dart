import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:plawarn/Components/Model/CreateProfile/CreateProfile.dart';
import 'package:plawarn/Components/Theme/constants/ScemaColor.dart';

class ButtonSaveCreateName extends StatelessWidget {
  const ButtonSaveCreateName({
    Key? key,
    required this.Namekey,
    required UserName Name,
  })  : _Name = Name,
        super(key: key);

  final GlobalKey<FormState> Namekey;
  final UserName _Name;

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
          onPressed: () {
            if (Namekey.currentState!.validate()) {
              Namekey.currentState!.save();
              Fname = _Name.fristname;
              Lname = _Name.lastname;
              Navigator.pushNamed(context, '/DateOfBirthPage');
              print(_Name.fristname);
              print(_Name.lastname);

              // Namekey.currentState!.reset();
            }
            return null;
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

String? Fname;
String? Lname;
