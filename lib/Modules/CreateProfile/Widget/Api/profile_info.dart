import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:plawarn/modules/auth/api/mobile_auth/send_verify/send_verify.dart';
import 'package:plawarn/modules/createprofile/widget/utils/button/button_createname.dart';
import 'package:plawarn/modules/createprofile/widget/utils/button/button_dateofbirth.dart';

import 'package:plawarn/widget/model/dtos/user/user_id_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? uid;

Future<dynamic> sendProfile() async {
  const url = 'https://api2.plawarn.com/profile';
  var headers = {
    'content-type': 'application/json; charset=utf-8',
    'accept': '*/*\'',
    'Authorization': '$type $token'
  };
  try {
    final res = await http.put(Uri.parse(url),
        headers: headers,
        body: jsonEncode({
          "firstName": Fname,
          "lastName": Lname,
          "dateOfBirth": {
            "date": "$D",
            "month": "$M",
            "year": "$Y",
          },
          "gender": "$G",
        }));
    var data = UserId.fromJson(json.decode(res.body));
    uid = data.id;
    SharedPreferences saveuid = await SharedPreferences.getInstance();
    await saveuid.setString('Uid', uid!);
    print(uid);
    print(res.body);
  } catch (er) {
    print(er);
  }
}

// import 'package:http/http.dart' as http;

// Future<dynamic> sendProfile() async {
//   var headers = {
//     'content-type': 'application/json; charset=utf-8',
//     'accept': '*/*\'',
//     'Authorization': '$type $token'
//   };
//   var request =
//       http.Request('PUT', Uri.parse('https://api2.plawarn.com/profile'));
//   request.body =
//       '''{\r\n    "firstName": "ทดสอบ1",\r\n    "lastName": "สดสอบ2",\r\n    "dateOfBirth": {\r\n        "date": "18",\r\n        "month": "12",\r\n        "year": "1994"\r\n    },\r\n    "gender": "NOT_SPECIFIED"\r\n}''';
//   request.headers.addAll(headers);

//   http.StreamedResponse response = await request.send();

//   if (response.statusCode == 200) {
//     print(await response.stream.bytesToString());
//   } else {
//     print(response.reasonPhrase);
//   }
// }
