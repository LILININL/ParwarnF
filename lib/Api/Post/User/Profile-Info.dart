import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:plawarn/Api/Post/User/Profile-Info-Json.dart';
import 'package:plawarn/Api/Post/send-verify/Send-verify.dart';
import 'package:plawarn/Widget/Button/ButtonCreateName.dart';
import 'package:plawarn/Widget/Button/ButtonConDateofBirth.dart';
import '../sendotp/SendOtp.dart';

Map<String, String> requestHeaders = {
  'Content-Type': 'application/json',
  'Accept': '*/*',
  'Authorization': 'Bearer $token',
};

Future<dynamic> sendProfile() async {
  const url = 'https://api2.plawarn.com/profile';
  try {
    final res = await http.put(Uri.parse(url),
        headers: requestHeaders,
        body: jsonEncode({
          "firstName": '$Fname',
          "lastName": '$Lname',
          "dateOfBirth":
              jsonEncode({"date": '$D', "month": '$M', "year": '$Y'}),
          "gender": '$G',
        }));
    var data = ProfileInfo.fromJson(json.decode(res.body));

    print(res.statusCode);
  } catch (er) {
    // print(Fname.runtimeType);
    // print(Lname.runtimeType);
    // print(D.runtimeType);
    // print(M.runtimeType);
    // print(Y.runtimeType);
    // print(G.runtimeType);
  }
}
