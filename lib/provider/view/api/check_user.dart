import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:plawarn/modules/auth/api/mobile_auth/send_verify/send_verify.dart';
import 'package:plawarn/modules/createprofile/widget/utils/button/button_createname.dart';
import 'package:plawarn/modules/createprofile/widget/utils/button/button_dateofbirth.dart';
import 'package:plawarn/widget/model/dtos/user/user_id_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? Uid;

Future<dynamic> getProfile() async {
  const url = 'https://api2.plawarn.com/profile';
  var headers = {
    'content-type': 'application/json; charset=utf-8',
    'accept': '*/*\'',
    'Authorization': '$type $token'
  };
  try {
    final res = await http.get(Uri.parse(url), headers: headers);

    var data = UserId.fromJson(json.decode(res.body));
    Uid = data.id;
    SharedPreferences saveuid = await SharedPreferences.getInstance();
    await saveuid.setString('Uid', Uid!);
    print(Uid);
    print(res.body);
  } catch (er) {
    print(er);
  }
}
