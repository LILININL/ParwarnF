import 'package:flutter/material.dart';
import 'package:plawarn/modules/auth/widget/appbar/notitle_bar.dart';
import 'package:plawarn/modules/auth/widget/button/facebook_login.dart';
import 'package:plawarn/modules/auth/widget/button/line_login.dart';
import 'package:plawarn/modules/auth/widget/button/register_button.dart';
import 'package:plawarn/modules/auth/widget/from/input_number_form.dart';
import 'package:plawarn/widget/theme/constants/scema_color.dart';
import 'package:plawarn/widget/theme/constants/scema_textstyle.dart';

class LoginMobile extends StatefulWidget {
  static const String routeName = '/loginmobile';

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
          ],
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 300,
        color: Colors.transparent,
        child: Column(
          children: const <Widget>[
            Center(
              child: Text(
                textAlign: TextAlign.center,
                "หรือ",
                style: textStyle16,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            LineLogin(),
            FacebookLogin(),
            SizedBox(
              height: 35,
            ),
            Text(
              textAlign: TextAlign.center,
              " เพิ่งเริ่มใช้ ปลาวาฬ ใช่ไหม",
              style: textStyle16,
            ),
            Center(child: Register()),
          ],
        ),
      ),
    );
  }
}
