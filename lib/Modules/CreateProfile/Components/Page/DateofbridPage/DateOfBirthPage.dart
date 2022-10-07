import 'package:flutter/material.dart';
import 'package:plawarn/Components/Model/dtos/CreateProfile/CreateProfile.dart';

import 'package:plawarn/Components/Theme/constants/ScemaTextStyle.dart';

import 'package:plawarn/Components/Theme/constants/ScemaColor.dart';

import 'package:plawarn/Modules/CreateProfile/Components/Appbar/CreateProfile.dart';
import 'package:plawarn/Modules/CreateProfile/Components/Widget/Button/ButtonConDateofBirth.dart';
import 'package:plawarn/Modules/CreateProfile/Components/Utils/InputDateofbirthGender.dart';

class DateOfBirthPage extends StatefulWidget {
  static const String routeName = '/DateOfBirthPage';
  const DateOfBirthPage({super.key});

  @override
  State<DateOfBirthPage> createState() => _DateOfBirthPageState();
}

class _DateOfBirthPageState extends State<DateOfBirthPage> {
  UserDateofBrith _DateofBrith = UserDateofBrith();
  var day;
  var year;
  var defalutMonth;
  var defalutGender;

  late final UserName _Name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const Profilebar(),
      body: Container(
        constraints: const BoxConstraints(
          maxHeight: double.infinity,
          minWidth: double.infinity,
        ),
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 24, 10, 0),
              child: Text(
                'มาเริ่มสร้างโปรไฟล์กันเถอะ',
                style: titletext24,
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 8, 0, 20),
              child: Text(
                'วันเกิดและเพศ',
                style: subtitletext18,
              ),
            ),
            Row(
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 8, 0, 0),
                  child: Text(
                    'วันเกิด',
                    style: subtitletext18,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(11, 5, 11, 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                        height: 50,
                        width: 85,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(color: inputcolor),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(11, 0, 0, 0),
                            child: DropdownButton<String>(
                                isExpanded: true,
                                value: day,
                                hint: const Text(
                                  'วัน',
                                ),
                                underline: Container(),
                                icon: const SizedBox(),
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                                itemHeight: 50,
                                borderRadius: BorderRadius.circular(6),
                                onChanged: (String? newday) {
                                  setState(() {
                                    day = newday!;
                                  });
                                  print(day);
                                },
                                items: SelectDay),
                          ),
                        )),
                    SizedBox(
                      height: 50,
                      width: 130,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(color: inputcolor),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(11, 0, 0, 0),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: defalutMonth,
                              hint: const Text('เดือน'),
                              underline: Container(),
                              iconSize: 25,
                              style: const TextStyle(color: Colors.black),
                              itemHeight: 50,
                              borderRadius: BorderRadius.circular(6),
                              onChanged: (String? newmonth) {
                                setState(() {
                                  defalutMonth = newmonth!;
                                });
                                print(defalutMonth);
                              },
                              items: SelectMonth,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 110,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(color: inputcolor),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(11, 0, 0, 0),
                            child: DropdownButton<String>(
                                isExpanded: true,
                                hint: const Text('ปี'),
                                value: year,
                                underline: Container(),
                                icon: const SizedBox(),
                                iconSize: 0,
                                style: const TextStyle(color: Colors.black),
                                onChanged: (String? newyear) {
                                  setState(() {
                                    year = newyear!;
                                  });
                                  print(year);
                                },
                                items: SelectYear),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 8, 0, 5),
                  child: Text(
                    'เพศ',
                    style: subtitletext18,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(color: inputcolor),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(11, 0, 0, 0),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: defalutGender,
                            hint: const Text('เพศ'),
                            underline: Container(),
                            iconSize: 25,
                            style: const TextStyle(color: Colors.black),
                            itemHeight: 50,
                            borderRadius: BorderRadius.circular(6),
                            onChanged: (String? newGender) {
                              setState(() {
                                defalutGender = newGender!;
                              });
                              print(defalutGender);
                            },
                            items: SelectGender,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ButtonConDateofBirth(
          day: day,
          defalutMonth: defalutMonth,
          year: year,
          defalutGender: defalutGender),
    );
  }
}
