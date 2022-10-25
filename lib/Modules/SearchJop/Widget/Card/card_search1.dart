import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:plawarn/modules/skills/page/addskill/skill_add.dart';
import 'package:plawarn/widget/theme/constants/scema_textstyle.dart';

class CardSearch1 extends StatelessWidget {
  const CardSearch1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GFCard(
        image: Image.asset(
            height: MediaQuery.of(context).size.height * 0.13,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            'assets/images/profile/avatar/looking-for-jobs-vector.png'),
        showImage: true,
        titlePosition: GFPosition.end,
        title: const GFListTile(
          title: Center(
            child: Text(
              'ค้นหางาน',
              style: titletext24,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        content: const Text(
          "ได้งานตรงใจ! ค้นหางานที่คุณต้องการหรือให้ Plawarn แนะนำ ฟรีไม่มีค่าใช้จ่าย",
          style: subtitletext16,
          textAlign: TextAlign.center,
        ),
        buttonBar: GFButtonBar(
          children: <Widget>[
            GFButton(
              size: 49,
              fullWidthButton: true,
              onPressed: () {
                Get.to(() => const Addskill(),
                    // duration: const Duration(seconds: 1),
                    transition: Transition.rightToLeft);
              },
              text: 'เริ่มเลย',
              textStyle: buttonContinua,
            ),
          ],
        ),
      ),
    );
  }
}
