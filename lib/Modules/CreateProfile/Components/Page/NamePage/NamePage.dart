import 'package:flutter/material.dart';
import 'package:plawarn/Components/Model/dtos/CreateProfile/CreateProfile.dart';
import 'package:plawarn/Components/Theme/constants/ScemaTextStyle.dart';

import 'package:plawarn/Modules/CreateProfile/Components/Appbar/CreateProfile.dart';
import 'package:plawarn/Modules/CreateProfile/Components/Widget/Button/ButtonCreateName.dart';
import 'package:plawarn/Modules/CreateProfile/Components/Widget/Form/InputCreateNameForm.dart';

class NamePage extends StatefulWidget {
  static const String routeName = '/NamePage';
  const NamePage({super.key});

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
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
        // backgroundColor: Background,
        bottomNavigationBar:
            ButtonSaveCreateName(Namekey: Namekey, Name: _Name));
  }
}
