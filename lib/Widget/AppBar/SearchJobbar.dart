import 'package:flutter/material.dart';
import 'package:plawarn/Theme/Scemacolor.dart';

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
        onPressed: () {
          Navigator.pop(context);
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
