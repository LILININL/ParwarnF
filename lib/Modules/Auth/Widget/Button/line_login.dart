import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:plawarn/widget/theme/constants/scema_textstyle.dart';

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
        textStyle: buttonContinua,
        textColor: Colors.white,
        color: const Color.fromRGBO(9, 202, 72, 0.8),
        fullWidthButton: true,
        size: 55,
      ),
    );
  }
}
