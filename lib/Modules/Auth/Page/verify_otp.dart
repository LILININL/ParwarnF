// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:plawarn/modules/auth/api/mobile_auth/send_verify/send_verify.dart';
import 'package:plawarn/modules/auth/widget/appbar/notitle_bar.dart';
import 'package:plawarn/modules/auth/widget/from/input_number_form.dart';
import 'package:plawarn/modules/createprofile/widget/page/namepage/name_page.dart';
import 'package:plawarn/modules/searchjop/page/search_jop.dart';
import 'package:plawarn/provider/view/api/check_user.dart';
import 'package:plawarn/widget/theme/constants/scema_color.dart';
import 'package:plawarn/widget/theme/constants/scema_textstyle.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyOtp extends StatefulWidget {
  static const String routeName = '/verifyotp';

  const VerifyOtp({
    Key? key,
  }) : super(key: key);

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

//
class _VerifyOtpState extends State<VerifyOtp> {
  TextEditingController? otpnumber = TextEditingController();

  StreamController<ErrorAnimationType>? errorController;
  bool hasError = false;
  String? currentText;

  final otpkey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const NoTitleBar(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          constraints: const BoxConstraints(
            maxHeight: double.infinity,
            minWidth: double.infinity,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Text(
                  'ยืนยันหรัส 6 หลัก',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    fontFamily: 'Noto',
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              //
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: RichText(
                  text: TextSpan(
                    text: "โปรดกรอกรหัสยืนยัน 6 หลักที่ส่งไปยังหมายเลข \n",
                    children: [
                      // const WidgetSpan(
                      //     child: Image(
                      //   image: AssetImage('assets/icons/Thailandic.png'),
                      //   height: 28,
                      //   width: 28,
                      //   alignment: Alignment.topCenter,
                      // )),
                      //เบอร์มือถือ
                      TextSpan(
                        text: phoneNumber,
                        style: const TextStyle(
                          color: blurpimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontFamily: 'Noto',
                        ),
                      ),
                    ],
                    style: textStyle18bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Form(
                key: otpkey,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10),
                    child: PinCodeTextField(
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 6,
                      obscureText: true,
                      obscuringCharacter: '*',
                      // obscuringWidget: const FlutterLogo(
                      //   size: 24,
                      // ),
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v!.length < 6) {
                          return "กรุณากรอกรหัสยืนยันให้ครบทุกช่อง!";
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(10),
                          fieldHeight: 50,
                          fieldWidth: 50,
                          errorBorderColor: Colors.red,
                          borderWidth: 1,
                          inactiveColor: graycolor),
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: false,
                      errorAnimationController: errorController,
                      controller: otpnumber,
                      keyboardType: TextInputType.number,
                      onCompleted: (v) {
                        debugPrint("Completed");
                      },
                      onTap: () {
                        print("Pressed");
                      },
                      onChanged: (value) {
                        debugPrint(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        debugPrint("Allowing to paste $text");
                        return true;
                      },
                    )),
              ),

              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: GFButton(
                  color: yell,
                  fullWidthButton: true,
                  size: 50,
                  onPressed: () async {
                    final SharedPreferences saveuid =
                        await SharedPreferences.getInstance();
                    final String? Uid = saveuid.getString('Uid');
                    otpkey.currentState!.validate();
                    // 123456 ก่อนนะครับ
                    if (currentText?.length != 6 || currentText != "123456") {
                      errorController!.add(ErrorAnimationType.shake);
                      setState(() {
                        hasError = false;
                        //รหัสไม่ถูกต้อง
                      });
                    } else {
                      await sendverify();
                      await getProfile();
                      if (namecheck != null || namecheck != "") {
                        Get.to(() => const SearchJop(),
                            duration: const Duration(seconds: 1),
                            transition: Transition.rightToLeft);
                      }
                      if (namecheck == null || namecheck == "") {
                        Get.to(() => const NamePage(),
                            duration: const Duration(seconds: 1),
                            transition: Transition.rightToLeft);
                      }
                    }
                  },
                  text: "เข้าสู่ระบบ",
                  textStyle: buttonContinua,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "ยังไม่ได้รับรหัสใช่ไหม ?",
                    style: TextStyle(
                      color: textblack54,
                      fontSize: 18,
                      fontFamily: 'Noto',
                    ),
                  ),
                  TextButton(
                    onPressed: () => snackBar("ขอรหัส OPT ใหม่"),
                    child: const Text(
                      "ขอรหัส OPT ใหม่",
                      style: TextStyle(
                        color: blurpimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        fontFamily: 'Noto',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 120,
        color: Colors.transparent,
        child: const Center(
          child: Text(
            "เมื่อดำเนินการต่อคุณได้ยอมรับ เงื่อนไขและข้อตกลง \n และนโยบายความเป็นส่วนตัวของ ปลาวาฬ แล้ว",
            style: textStyle16bold,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
