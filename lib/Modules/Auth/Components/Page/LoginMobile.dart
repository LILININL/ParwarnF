import 'package:flutter/material.dart';
import 'package:plawarn/Modules/Auth/Components/Appbar/NoTitleBar.dart';
import 'package:plawarn/Components/Theme/constants/ScemaColor.dart';
import 'package:plawarn/Modules/Auth/Components/Widget/Button/FacebookLogin.dart';
import 'package:plawarn/Modules/Auth/Components/Widget/Button/LineLogin.dart';
import 'package:plawarn/Modules/Auth/Components/Widget/Button/Register.dart';
import 'package:plawarn/Modules/Auth/Components/Widget/From/InputNumberForm.dart';

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
      appBar: const NoTitleBar(),
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
