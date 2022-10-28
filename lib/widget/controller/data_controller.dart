// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plawarn/modules/auth/api/mobile_auth/send_verify/send_verify.dart';
import 'package:plawarn/modules/createprofile/widget/page/namepage/name_page.dart';

import 'package:plawarn/modules/searchjop/page/search_jop.dart';
import 'package:plawarn/page/home_page.dart';
import 'package:plawarn/provider/view/api/check_user.dart';
import 'package:plawarn/provider/view/user_view_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

class checkPre extends GetxController {
  var isDataLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    checkComeback();
  }

  checkComeback() async {
    SharedPreferences Token = await SharedPreferences.getInstance();
    SharedPreferences uid = await SharedPreferences.getInstance();
    String? iduser = uid.getString('Uid');
    String? token = Token.getString('token');
    try {
      if (token == null && token!.isEmpty || iduser == null && iduser == '') {
        Get.offAll(() => const HomePage());
      }
      await getProfile();
      if (namecheck.toString() == "") {
        await logout();
        Get.offAll(() => const HomePage());
      } else {
        Get.offAll(() => const SearchJop());
      }
    } catch (e) {
      print(e);
    }
  }
}
