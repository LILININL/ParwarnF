import 'package:http/http.dart' as http;
import 'package:plawarn/modules/auth/api/mobile_auth/send_verify/send_verify.dart';
import 'package:plawarn/modules/createprofile/widget/utils/button/button_createname.dart';
import 'package:plawarn/modules/createprofile/widget/utils/button/button_dateofbirth.dart';

void sendProfile() async {
  var headers = {
    'content-type': 'application/json; charset=utf-8',
    'accept': '*/*\'',
    'Authorization': 'Bearer $token'
  };
  var request =
      http.Request('PUT', Uri.parse('https://api2.plawarn.com/profile'));
  request.body =
      '''{\r\n    "firstName": "$Lname",\r\n    "lastName": "$Lname",\r\n    
      "dateOfBirth": {\r\n        "date": "$D",\r\n        "month": "$M",\r\n    
          "year": "$Y"\r\n    },\r\n  
            "gender": "$G"\r\n}''';
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}
