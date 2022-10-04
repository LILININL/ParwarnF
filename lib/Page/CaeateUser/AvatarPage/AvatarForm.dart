import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:plawarn/Theme/Scemacolor.dart';

import '../../../Widget/AppBar/CreateProfile.dart';
import '../../../Widget/Button/ButtonCreateName.dart';
import '../../../Widget/InputFrom/InputNumberForm.dart';

class AvatarForm extends StatefulWidget {
  static const String routeName = '/AvatarForm';
  const AvatarForm({super.key});

  @override
  State<AvatarForm> createState() => _AvatarFormState();
}

class _AvatarFormState extends State<AvatarForm> {
  final Namekey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const Profilebar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Container(
          constraints: const BoxConstraints(
            maxHeight: double.infinity,
            minWidth: double.infinity,
          ),
          child: Expanded(
            child: Column(children: <Widget>[
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 24, 10, 0),
                child: Text('มาเริ่มสร้างโปรไฟล์กันเถอะ', style: titletext24),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 30),
                child: Text('รูปภาพโปรไฟล์ (ไม่บังคับ)', style: subtitletext18),
              ),
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.greenAccent[400],
                  radius: 80,
                  child: const Text(
                    'GeeksForGeeks',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ]),
          ),
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
              return null;
            },
            text: 'ดำเนินการต่อ',
            textStyle: buttonContinua,
            color: yell,
            fullWidthButton: true,
            size: 49,
          ),
        ),
      ),
    );
  }
}
