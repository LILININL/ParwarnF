import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plawarn/modules/auth/api/mobile_auth/send_verify/send_verify.dart';
import 'package:plawarn/modules/createprofile/widget/page/namepage/name_page.dart';
import 'package:plawarn/modules/searchjop/page/search_jop.dart';
import 'package:plawarn/page/home_page.dart';
import 'package:plawarn/provider/view/api/check_user.dart';

import 'package:plawarn/widget/model/dtos/token/token_data.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class Userview with ChangeNotifier {
//   Future<bool> saveUser(Useridview user) async {
//     final SharedPreferences sp = await SharedPreferences.getInstance();
//     sp.setString('userid', user.id.toString());
//     sp.setString('Fullname', user.fullName.toString());
//     sp.setString('Fname', user.firstName.toString());
//     sp.setString('Lname', user.lastName.toString());
//     notifyListeners();
//     return true;
//   }
// }

// Future<Useridview> getUser() async {
//   final SharedPreferences sp = await SharedPreferences.getInstance();
//   final String? userid = sp.getString('userid');
//   final String? fullname = sp.getString('Fullname');
//   final String? firstname = sp.getString('Fname');
//   final String? lastName = sp.getString('Lname');
//   final String? address = sp.getString('address');
//   return Useridview(
//     id: userid.toString(),
//     fullName: fullname.toString(),
//     firstName: firstname.toString(),
//     lastName: lastName.toString(),
//     avatar: '',
//     gender: '',
//     mobileNumber: '',
//   );
// }
// ทดสอบ ลองย้ายมาไว้ ในไฟล์นี้ดู ว่าจะได้ไม่ต้องเรียกใช้ไฟล์อื่น ยังไม่เสร็จ!
class Tokenview with ChangeNotifier {
  Future<bool> saveUser(GetTokendata token) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('type', token.type.toString());
    sp.setString('token', token.accessToken.toString());
    notifyListeners();
    return true;
  }
}

Future<GetTokendata> getToken() async {
  final SharedPreferences sp = await SharedPreferences.getInstance();
  final String? type = sp.getString('type');
  final String? token = sp.getString('token');
  return GetTokendata(accessToken: token.toString(), type: type.toString());
}

Future<bool> remove() async {
  final SharedPreferences Token = await SharedPreferences.getInstance();
  Token.clear();
  print(token);
  return true;
}

Future<Object> checkUser() async {
  final SharedPreferences saveuid = await SharedPreferences.getInstance();
  final String? Uid = saveuid.getString('Uid');
  await getProfile();
  if (Uid == null && Uid!.isEmpty) {
    print('ไปสร้างโปรไฟล์ใหม่');
    return true;
  }
  if (Uid.isNotEmpty) {
    print('รับค่าโปรไฟล์ไปต่อหน้าสกิล');
    return true;
  } else {
    print('ไม่มีค่า');
    return false;
  }
}
