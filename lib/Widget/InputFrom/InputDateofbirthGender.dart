import 'package:flutter/material.dart';
import 'package:plawarn/Page/CaeateUser/DateofbridPage/Daet_Month_Year_json.dart';

List<DropdownMenuItem<String>> get SelectDay {
  return [
    const DropdownMenuItem(
      value: '',
      child: Text('เลือกเดือน'),
    ),
    ...month.map<DropdownMenuItem<String>>((data) {
      return DropdownMenuItem(
        value: data['value'],
        child: Text(
          data['monthname']!,
        ),
      );
    }).toList(),
  ];
}

List<DropdownMenuItem<String>> get SelectYear {
  return [
    const DropdownMenuItem(
      value: '',
      child: Text('เลือกปี'),
    ),
    ...List<String>.generate(
            100, (int index) => (DateTime.now().year + 543 - index).toString())
        .map<DropdownMenuItem<String>>((String year) {
      return DropdownMenuItem<String>(
        value: year,
        child: Text(year, textAlign: TextAlign.center),
      );
    }).toList(),
  ];
}

List<DropdownMenuItem<String>> get SelectGender {
  return [
    const DropdownMenuItem(
      value: '',
      child: Text('เลือกเพศ'),
    ),
    ...usergender.map<DropdownMenuItem<String>>((data) {
      return DropdownMenuItem(
        value: data['value'],
        child: Text(
          data['gender']!,
        ),
      );
    }).toList(),
  ];
}
