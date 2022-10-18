import 'package:flutter/material.dart';
import 'package:plawarn/modules/createprofile/widget/utils/appbar/create_profile.dart';
import 'package:plawarn/modules/createprofile/widget/utils/button/button_createname.dart';
import 'package:plawarn/modules/createprofile/widget/utils/form/inputcreatename_form.dart';
import 'package:plawarn/provider/view/api/check_user.dart';
import 'package:plawarn/provider/view/user_view_model.dart';
import 'package:plawarn/widget/model/dtos/createprofile/create_profile.dart';

import 'package:plawarn/widget/theme/constants/scema_textstyle.dart';

class NamePage extends StatefulWidget {
  static const String routeName = '/NamePage';
  const NamePage({super.key});

  @override
  State<NamePage> createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  @override
  void initState() {
    super.initState();
    checkUser();
    getProfile();
    // checkPreferacne();
  }

  UserName name = UserName();
  final namekey = GlobalKey<FormState>();

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
                child: InputCreateNameFrom(Namekey: namekey, Name: name),
              )),
            ]),
          ),
        ),
        // backgroundColor: Background,
        bottomNavigationBar:
            ButtonSaveCreateName(Namekey: namekey, Name: name));
  }
}
