import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../Theme/ScemaColor.dart';
import '../class/Language.dart';
import 'LoginMobile.dart';

var Number = TextEditingController();
var code = [];

class HomePage extends StatefulWidget {
  static const String routeName = '/home';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _changeLanguage(Language language) {
    print(language.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Image.asset(
                        'assets/images/logo-horizontal.png',
                        scale: 1,
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: DropdownButton(
                          icon: Image.asset(
                            'assets/flag/th.png',
                            scale: 3,
                          ),
                          underline: const SizedBox(),
                          items: Language.languageList()
                              .map<DropdownMenuItem<Language>>(
                                  (lang) => DropdownMenuItem(
                                      value: lang,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(lang.flag),
                                          Text(lang.name)
                                        ],
                                      )))
                              .toList(),
                          onChanged: (Language? language) {
                            _changeLanguage(language!);
                          }, // Row>,
                        ),
                      )),
                ],
              ),
              const SizedBox(
                height: 260,
              ),
              onboard(),
            ],
          ),
        ),
        bottomNavigationBar: buttonbotopmbar(context));
  }

  Container onboard() {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 600,
        minWidth: double.infinity,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const <Widget>[
            Image(
              image: AssetImage('assets/images/onboard/onboard.png'),
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 5),
              child: Text(
                'ยินดีต้อนรับเข้าสู่ ปลาวาฬ',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Noto'),
              ),
            ),
            Text(
              'เราเป็นตลาดกลางแรงงานเพื่อเชื่อมต่อระหว่างผู้ใช้แรงงานและนายจ้าง',
              style: TextStyle(
                  fontSize: 20, color: Colors.black, fontFamily: 'Noto'),
            ),
          ],
        ),
      ),
    );
  }
}

Container buttonbotopmbar(BuildContext context) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: GFButton(
        onPressed: () {
          Navigator.pushNamed(context, LoginMobile.routeName);
        },
        text: 'เข้าสู่ระบบ',
        color: yell,
        textStyle: const TextStyle(fontSize: 18, fontFamily: 'Noto'),
        fullWidthButton: true,
        size: 49,
      ),
    ),
  );
}
