import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:plawarn/Api/Post/sendotp/Json-send-otp.dart';

import '../../../Model/Json/Otp/verify-otp.dart';
import '../../../Widget/InputFrom/InputNumberForm.dart';

String? serviceid;

Future<dynamic> sendotp() async {
  const url = 'https://api2.plawarn.com/auth/send-otp';
  try {
    final res = await http.post(Uri.parse(url),
        body: {"mobileNumber": phoneNumber, "locale": localcode});
    var data = GetSendOtp.fromJson(json.decode(res.body));
    serviceid = data.serviceSid;
    print(serviceid);
    print(res.body);
  } catch (er) {
    print(er);
  }
}
