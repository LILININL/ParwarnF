import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:plawarn/Components/Model/dtos/Token/Token-data.dart';

import 'package:plawarn/Modules/Auth/Components/Widget/From/InputNumberForm.dart';

import '../Otp/SendOtp.dart';

var token;
var type;
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
    print(serviceid);
    print(res.body);
  } catch (er) {
    print(er);
  }
}
