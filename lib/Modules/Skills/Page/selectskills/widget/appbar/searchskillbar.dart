import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:plawarn/Modules/Skills/Page/selectskills/searchskills/search_skill_test.dart';
import 'package:plawarn/widget/theme/constants/scema_color.dart';

class Searchskillbar extends StatelessWidget implements PreferredSizeWidget {
  const Searchskillbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      backgroundColor: Colors.white,
      leading: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.blueAccent,
          iconSize: 18,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      elevation: 0,
      leadingWidth: 30,
      title: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: colord,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: colorc)),
        child: TextField(
          onTap: () {
            Get.to(() => Searchskillall(),
                // duration: const Duration(seconds: 1),
                transition: Transition.rightToLeft);
          },
          decoration: const InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search),
              hintText: 'ค้นหาทักษะ',
              hintStyle: TextStyle(color: Colors.grey)),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
