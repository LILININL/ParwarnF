import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:plawarn/Components/Theme/constants/ScemaTextStyle.dart';
import 'package:plawarn/Components/Theme/constants/ScemaColor.dart';

class CardSearch2 extends StatelessWidget {
  const CardSearch2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GFCard(
        borderRadius: BorderRadius.circular(10),
        image: Image.asset(
            height: MediaQuery.of(context).size.height * 0.13,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            'assets/images/profile/avatar/post-job-vector.png'),
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
              color: yell,
              size: 49,
              fullWidthButton: true,
              onPressed: () {
                // Navigator.pushNamed(context, '/SearchJop');
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
