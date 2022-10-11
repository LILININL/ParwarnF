import 'package:flutter/material.dart';
import 'package:plawarn/widget/theme/constants/scema_textstyle.dart';

class Profilebar extends StatelessWidget implements PreferredSizeWidget {
  const Profilebar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        color: Colors.blueAccent,
        iconSize: 18,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: const Text('สร้างโปรไฟล์', style: appbartitle),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
