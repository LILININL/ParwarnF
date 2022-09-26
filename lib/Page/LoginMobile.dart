import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:plawarn/Page/Homepage.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../Screen/Button/FacebookLogin.dart';
import '../Screen/Button/LineLogin.dart';
import '../Screen/Button/Register.dart';
import '../Screen/InputFrom/InputNumber.dart';
import '../Theme/Scemacolor.dart';

class LoginMobile extends StatefulWidget {
  static const String routeName = '/LoginMobile';

  const LoginMobile({Key? key}) : super(key: key);

  @override
  State<LoginMobile> createState() => _LoginMobileState();
}

bool hasError = false;
String currentText = "";

class _LoginMobileState extends State<LoginMobile> {
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  final formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.blueAccent,
          iconSize: 18,
          onPressed: () {},
        ),
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Text(
              'ยินดีต้อนรับกลับมา',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: 'Noto',
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 30, 0, 0),
            child: RichText(
              text: const TextSpan(
                  text: "เข้าสู่ระบบโดยใช้หมายเลขโทรศัพท์ ",
                  style: TextStyle(
                    color: textblack54,
                    fontSize: 18,
                    fontFamily: 'Noto',
                  )),
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(height: 10),
          FromNumber(formKey: formKey),
          const SizedBox(
            height: 5,
          ),
          const ButtonCon(),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "โดยระบบจะส่ง SMS เพื่อยืนยันในขั้นตอนถัดไป",
                style: TextStyle(
                  color: textblack54,
                  fontSize: 16,
                  fontFamily: 'Noto',
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
          ),
          const Text(
            textAlign: TextAlign.center,
            "หรือ",
            style: TextStyle(
              color: textblack54,
              fontSize: 16,
              fontFamily: 'Noto',
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 40,
          ),
          const LineLogin(),
          const FacebookLogin(),
          SizedBox(
            height: MediaQuery.of(context).size.height / 9.3,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Text(
              textAlign: TextAlign.center,
              " เพิ่งเริ่มใช้ ปลาวาฬ ใช่ไหม",
              style: TextStyle(
                color: textblack,
                fontSize: 16,
                fontFamily: 'Noto',
              ),
            ),
          ),
          const Register(),
        ],
      ),
    );
  }
}

class ButtonCon extends StatelessWidget {
  const ButtonCon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(249, 164, 0, 0.8),
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
                color: Colors.white, offset: Offset(1, -2), blurRadius: 5),
            BoxShadow(color: Colors.white, offset: Offset(-1, 2), blurRadius: 5)
          ]),
      child: ButtonTheme(
        height: 50,
        child: TextButton(
          onPressed: () {},
          child: Center(
              child: Text(
            "ดำเนินการต่อ".toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'NotoSansThai',
            ),
          )),
        ),
      ),
    );
  }
}
