// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plawarn/modules/auth/page/login_mobile.dart';
import 'package:plawarn/modules/searchjop/page/search_jop.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class controller extends StatefulWidget {
//   const controller({super.key});

//   @override
//   State<controller> createState() => _controllerState();
// }

// class _controllerState extends State<controller> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }

//   void checkPreferacne() async {
//     SharedPreferences Token = await SharedPreferences.getInstance();
//     String? token = Token.getString('token');
//     try {
//       if (token == null && token!.isEmpty) {
//         Navigator.pushReplacement(context,
//             MaterialPageRoute(builder: (context) {
//           return const LoginMobile();
//         }));
//       } else {
//         Navigator.pushReplacement(context,
//             MaterialPageRoute(builder: (context) {
//           return const SearchJop();
//         }));
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
// }
// Get X

class controller extends GetxController {
  @override
  void onInit() {
    checkPreferacne();
    super.onInit();
  }

  void checkPreferacne() async {
    SharedPreferences Token = await SharedPreferences.getInstance();
    String? token = Token.getString('token');
    try {
      if (token == null && token!.isEmpty) {
        Get.offAll(() => LoginMobile());
      } else {
        Get.offAll(() => SearchJop());
      }
    } catch (e) {
      print(e);
    }
  }
}
