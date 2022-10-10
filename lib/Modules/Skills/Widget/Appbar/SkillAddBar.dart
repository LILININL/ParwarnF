import 'package:flutter/material.dart';
import 'package:plawarn/Components/Theme/constants/ScemaTextStyle.dart';
import 'package:plawarn/Components/Theme/constants/ScemaColor.dart';

class SkillsAddBar extends StatelessWidget implements PreferredSizeWidget {
  const SkillsAddBar({
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
      title: const Text('ทักษะ', style: appbartitle),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
