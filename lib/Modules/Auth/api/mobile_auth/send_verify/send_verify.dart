import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:plawarn/modules/auth/api/mobile_auth/send_otp/send_otp.dart';
import 'package:plawarn/modules/auth/widget/from/input_number_form.dart';
import 'package:plawarn/widget/model/dtos/token/token_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? token;
String? type;

Future<dynamic> sendverify() async {
  const url = 'https://api2.plawarn.com/auth/verify-otp';
  try {
    final res = await http.post(Uri.parse(url), body: {
      "mobileNumber": phoneNumber,
      "code": '1234',
      "serviceSid": serviceid,
    });
    var data = GetTokendata.fromJson(json.decode(res.body));
    token = data.accessToken;
    type = data.type;
    SharedPreferences saveToken = await SharedPreferences.getInstance();
    await saveToken.setString('token', token!);
    await saveToken.setString('type', type!);
    print(serviceid);
    print(res.body);
  } catch (er) {
    print(er);
  }
}
