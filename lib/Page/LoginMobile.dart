import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl_phone_field/phone_number.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:plawarn/Page/Homepage.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../Api/Get/user.dart';
import '../Api/Post/sendotp/SendOtp.dart';
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

class _LoginMobileState extends State<LoginMobile> {
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  final Numberkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // PostPhoneNumber();
    // fetchuser();
  }

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
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        constraints: const BoxConstraints(
          maxHeight: double.infinity,
          minWidth: double.infinity,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Text(
                'ยินดีต้อนรับกลับมา',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  fontFamily: 'Noto',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
              child: RichText(
                text: const TextSpan(
                    text: "เข้าสู่ระบบโดยใช้หมายเลขโทรศัพท์ ",
                    style: TextStyle(
                      color: textblack54,
                      fontSize: 18,
                      fontFamily: 'Noto',
                    )),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 10),
            FromNumber(
              Numberkey: Numberkey,
            ),
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
              height: MediaQuery.of(context).size.height / 7,
            ),
            const Center(
              child: Text(
                textAlign: TextAlign.center,
                "หรือ",
                style: TextStyle(
                  color: textblack54,
                  fontSize: 16,
                  fontFamily: 'Noto',
                ),
              ),
            ),
            const LineLogin(),
            const FacebookLogin(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            const Center(
              child: Padding(
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
            ),
            const Center(child: Register()),
          ],
        ),
      ),
    );
  }
}
