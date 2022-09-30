import 'dart:convert';
import 'package:http/http.dart' as http;

List<String> user = [];
Future<dynamic> fetchuser() async {
  final response = await http.get(Uri.parse('https://api2.plawarn.com/users'));
  if (response.statusCode == 200) {
    print(jsonDecode(response.body));

    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load album');
  }
}
