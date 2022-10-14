import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:plawarn/modules/auth/api/mobile_auth/send_otp/send_otp.dart';
import 'package:plawarn/widget/theme/constants/scema_color.dart';
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
      decoration: BoxDecoration(
          color: yell,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
                color: Colors.white, offset: Offset(1, -2), blurRadius: 5),
            BoxShadow(color: Colors.white, offset: Offset(-1, 2), blurRadius: 5)
          ]),
      child: ButtonTheme(
        height: 50,
        child: TextButton(
          onPressed: () async {
            if (phoneNumber == null) {
              return null;
            } else {
              await sendotp();
              print(phoneNumber);
              print(localcode);
            }
            if (serviceid!.isEmpty) {
              return null;
            }
            Navigator.pushNamed(context, '/VerifyOtp');
          },
          child: Center(
              child: Text(
            "ดำเนินการต่อ".toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Noto',
            ),
          )),
        ),
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