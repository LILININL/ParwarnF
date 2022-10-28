import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plawarn/page/home_page.dart';
import 'package:plawarn/provider/view/user_view_model.dart';
import 'package:plawarn/widget/theme/constants/scema_color.dart';

class SearcjJobbar extends StatelessWidget implements PreferredSizeWidget {
  const SearcjJobbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        color: Colors.white,
        iconSize: 18,
        onPressed: () => {
          logout(),
          Get.to(() => const HomePage(),
              // duration: const Duration(seconds: 1),
              transition: Transition.rightToLeft)
        },
      ),
      title: const Text(
        'ฉันกำลัง...',
        style: TextStyle(
          fontFamily: 'Noto',
          fontSize: 24,
          color: textwhite,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
