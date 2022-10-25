import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:plawarn/modules/createprofile/widget/page/dateofbirthpage/dateofbirth_page.dart';
import 'package:plawarn/widget/model/dtos/createprofile/create_profile.dart';
import 'package:plawarn/widget/theme/constants/scema_color.dart';

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
              Get.to(() => const DateOfBirthPage(),
                  // duration: const Duration(seconds: 1),
                  transition: Transition.rightToLeft);

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
