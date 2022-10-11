import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:plawarn/modules/auth/widget/from/input_number_form.dart';
import 'package:plawarn/widget/model/dtos/otp/get_otp.dart';

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
