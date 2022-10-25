import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:plawarn/modules/auth/api/mobile_auth/send_otp/send_otp.dart';
import 'package:plawarn/modules/auth/page/verify_otp.dart';
import 'package:plawarn/widget/theme/constants/scema_color.dart';
import 'package:plawarn/widget/theme/constants/scema_textstyle.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ButtonCon extends StatelessWidget {
  const ButtonCon({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
      child: GFButton(
        size: 55,
        onPressed: () async {
          if (phoneNumber == null) {
            return;
          } else {
            await sendotp();
            Get.to(() => const VerifyOtp(),
                duration: const Duration(seconds: 1),
                transition: Transition.rightToLeft);
          }
        },
        text: "ดำเนินการต่อ",
        textStyle: buttonContinua,
        color: yell,
        fullWidthButton: true,
      ),
    );
  }
}

class FromNumber extends StatelessWidget {
  late final GlobalKey<FormState> Numberkey;

  FromNumber({
    Key? key,
    required this.Numberkey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: Numberkey,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: IntlPhoneField(
            disableLengthCheck: false,
            dropdownTextStyle: const TextStyle(
              color: textblack,
              fontSize: 18,
              fontFamily: 'Noto',
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
            invalidNumberMessage:
                'หมายเลขโทรศัพท์ไม่ถูกต้อง ไม่ต้องเติม 0 ในหมายเลข',
            onChanged: (phone) async {
              phoneNumber = phone.completeNumber;
              localcode = phone.countryISOCode;
              SharedPreferences savephone =
                  await SharedPreferences.getInstance();
              await savephone.setString('phone', phoneNumber!);
              await savephone.setString('localcode', localcode!);
              print(phoneNumber);
              print(localcode);
            },
            validator: (phone) {
              if (phone!.completeNumber.isEmpty) {
                return 'กรุณากรอกหมายเลขโทรศัพท์';
              }
              return null;
            },
          )),
    );
  }
}

String? phoneNumber;
String? localcode;
