// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import 'package:plawarn/modules/auth/page/login_mobile.dart';
import 'package:plawarn/widget/controller/data_controller.dart';
import 'package:plawarn/widget/model/dtos/ListData/Language.dart';
import 'package:plawarn/widget/theme/constants/scema_color.dart';

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
  void initState() {
    super.initState();
    // check.checkComeback();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Background,
        body: SafeArea(
          child: Container(
            constraints: const BoxConstraints(
              maxHeight: double.infinity,
              minWidth: double.infinity,
            ),
            child: Column(
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.start,

                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Image.asset(
                          'assets/logo/logo-horizontal.png',
                          scale: 1,
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 20, 0),
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton(
                                icon: Image.asset(
                                  'assets/flag/th.png',
                                  scale: 3,
                                ),

                                items: Language.languageList()
                                    .map<DropdownMenuItem<Language>>(
                                        (lang) => DropdownMenuItem(
                                            value: lang,
                                            child: Row(
                                              // mainAxisAlignment:
                                              //     MainAxisAlignment
                                              //         .spaceBetween,
                                              children: <Widget>[
                                                Text(lang.flag),

                                                // Text(lang.name)
                                              ],
                                            )))
                                    .toList(),
                                onChanged: (Language? language) {
                                  _changeLanguage(language!);
                                }, // Row>,
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomSheet: onboard(),
        bottomNavigationBar: buttonbotopmbar(context));
  }

  Container onboard() {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 480,
        minWidth: double.infinity,
      ),
      color: Colors.transparent,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const <Widget>[
              Image(
                image: AssetImage('assets/images/onboard/onboard.png'),
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 5),
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
      ),
    );
  }
}
//

Container buttonbotopmbar(BuildContext context) {
  return Container(
    constraints: const BoxConstraints(
      maxHeight: double.infinity,
      minWidth: double.infinity,
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
      child: GFButton(
        onPressed: () {
          Get.to(() => const LoginMobile(),
              // duration: const Duration(seconds: 1),
              transition: Transition.rightToLeft);
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
