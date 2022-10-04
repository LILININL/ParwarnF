import 'package:flutter/material.dart';
import 'package:plawarn/Model/Json/CreateProfile/CreateProfile.dart';
import 'package:plawarn/Theme/Scemacolor.dart';
import 'package:plawarn/Widget/InputFrom/InputCreateNameForm.dart';

import '../../../Widget/AppBar/CreateProfile.dart';
import '../../../Widget/Button/ButtonCreateName.dart';

class NameForm extends StatefulWidget {
  static const String routeName = '/NameForm';
  const NameForm({super.key});

  @override
  State<NameForm> createState() => _NameFormState();
}

class _NameFormState extends State<NameForm> {
  UserName _Name = UserName();
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
            child: Column(children: <Widget>[
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 24, 10, 0),
                child: Text('มาเริ่มสร้างโปรไฟล์กันเถอะ', style: titletext24),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: Text('ชื่อของคุณ', style: subtitletext18),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: InputCreateNameFrom(Namekey: Namekey, Name: _Name),
              )),
            ]),
          ),
        ),
        backgroundColor: Background,
        bottomNavigationBar:
            ButtonSaveCreateName(Namekey: Namekey, Name: _Name));
  }
}
