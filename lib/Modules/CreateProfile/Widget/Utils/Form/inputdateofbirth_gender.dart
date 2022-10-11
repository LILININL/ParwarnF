import 'package:flutter/material.dart';
import 'package:plawarn/widget/model/dtos/listdata/month_gender.dart';

List<DropdownMenuItem<String>> get SelectDay {
  return [
    const DropdownMenuItem(
      value: '',
      child: Text('เลือกวัน'),
    ),
    ...List<String>.generate(31, (int index) => (index + 1).toString())
        .map<DropdownMenuItem<String>>((String year) {
      return DropdownMenuItem<String>(
        value: year,
        child: Text(year, textAlign: TextAlign.center),
      );
    }).toList(),
  ];
}

List<DropdownMenuItem<String>> get SelectMonth {
  return [
    const DropdownMenuItem(
      value: '',
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'เลือกเดือน',
        ),
      ),
    ),
    ...month.map<DropdownMenuItem<String>>((data) {
      return DropdownMenuItem(
        value: data['value'],
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            data['monthname']!,
          ),
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
            100, (int index) => (DateTime.now().year - index).toString())
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
