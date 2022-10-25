import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:plawarn/widget/theme/constants/scema_textstyle.dart';

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
        textStyle: buttonContinua,
        textColor: Colors.white,
        color: const Color.fromRGBO(38, 125, 253, 0.8),
        fullWidthButton: true,
        size: 55,
      ),
    );
  }
}
