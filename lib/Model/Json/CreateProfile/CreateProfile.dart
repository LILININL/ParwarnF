import 'package:flutter/src/material/dropdown.dart';

class UserName {
  String? fristname;
  String? lastname;
  UserName({this.fristname, this.lastname});
}

class UserDateofBrith {
  String? date;
  String? month;
  String? year;
  UserDateofBrith({this.date, this.month, this.year});
}

class UserGender {
  String? gender;
  UserGender({required String gender, required String value});
}
