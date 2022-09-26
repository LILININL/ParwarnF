import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:plawarn/Page/Homepage.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

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
  // String initialCountry = 'TH';
  // PhoneNumber number = PhoneNumber(isoCode: 'TH');

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

  // void getPhoneNumber(String phoneNumber) async {
  //   PhoneNumber number =
  //       await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'TH');

  //   setState(() {
  //     this.number = number;
  //   });
  // }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }
}

class Register extends StatelessWidget {
  const Register({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: const Text(
        "สมัครสมาชิก",
        style: TextStyle(
          color: Color.fromRGBO(4, 94, 228, 0.8),
          fontWeight: FontWeight.bold,
          fontSize: 16,
          fontFamily: 'NotoSansThai',
        ),
      ),
    );
  }
}

class FacebookLogin extends StatelessWidget {
  const FacebookLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
      child: GFButton(
        onPressed: () {},
        text: "เข้าสู่ระบบโดยใช้ Facebook",
        textStyle: const TextStyle(
          fontSize: 18,
          fontFamily: 'NotoSansThai',
          fontWeight: FontWeight.bold,
        ),
        textColor: Colors.white,
        color: const Color.fromRGBO(38, 125, 253, 0.8),
        fullWidthButton: true,
        size: 55,
      ),
    );
  }
}

class LineLogin extends StatelessWidget {
  const LineLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
      child: GFButton(
        onPressed: () {},
        text: "เข้าสู่ระบบโดยใช้ Line",
        textStyle: const TextStyle(
          fontSize: 18,
          fontFamily: 'NotoSansThai',
          fontWeight: FontWeight.bold,
        ),
        textColor: Colors.white,
        color: const Color.fromRGBO(9, 202, 72, 0.8),
        fullWidthButton: true,
        size: 55,
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

class FromNumber extends StatelessWidget {
  const FromNumber({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: IntlPhoneField(
            disableLengthCheck: false,
            dropdownTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: 'NotoSansThai',
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: const BorderSide(),
                borderRadius: BorderRadius.circular(5),
              ),
              labelText: 'หมายเลขโทรศัพท์',
            ),
            dropdownIcon: const Icon(
              Icons.arrow_drop_down,
              size: 0,
            ),
            initialCountryCode: 'TH',
            invalidNumberMessage: 'หมายเลขโทรศัพท์ไม่ถูกต้อง',
            onChanged: (phone) {
              print(
                phone.completeNumber,
              );
            },
          )),
    );
  }
}
