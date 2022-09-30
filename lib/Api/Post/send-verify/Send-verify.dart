import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:plawarn/Api/Post/send-verify/Json-data-otp.dart';

import '../../../Widget/InputFrom/InputNumberForm.dart';
import '../sendotp/SendOtp.dart';

String? token;
String? type;
Future<dynamic> sendotp() async {
  const url = 'https://api2.plawarn.com/auth/verify-otp';
  try {
    final res = await http.post(Uri.parse(url), body: {
      "mobileNumber": phoneNumber,
      "code": '1234',
      "serviceSid": serviceid,
    });
    var data = GetDataOtp.fromJson(json.decode(res.body));
    token = data.accessToken;
    type = data.type;
    print(serviceid);
    print(res.body);
  } catch (er) {
    print(er);
  }
}
