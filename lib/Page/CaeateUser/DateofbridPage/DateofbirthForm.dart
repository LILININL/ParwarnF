import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:getwidget/getwidget.dart';
import 'package:plawarn/Model/Json/CreateProfile/CreateProfile.dart';
import 'package:plawarn/Page/CaeateUser/DateofbridPage/Daet_Month_Year_json.dart';
import 'package:plawarn/Theme/Scemacolor.dart';
import 'package:plawarn/Widget/InputFrom/InputDateofbirthGender.dart';

import '../../../Widget/AppBar/CreateProfile.dart';

class DateOfBirthForm extends StatefulWidget {
  static const String routeName = '/DateOfBirthForm';
  const DateOfBirthForm({super.key});

  @override
  State<DateOfBirthForm> createState() => _DateOfBirthFormState();
}

class _DateOfBirthFormState extends State<DateOfBirthForm> {
  // UserDateofBrith _DateofBrith = UserDateofBrith();
  var day;
  var year;
  var defalutMonth;
  var defalutGender;

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
      bottomNavigationBar: Container(
        constraints: const BoxConstraints(
          maxHeight: double.infinity,
          minWidth: double.infinity,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 25),
          child: GFButton(
            onPressed: () {
              print(defalutGender);
              Navigator.pushNamed(context, '/AvatarForm');
            },
            text: 'ดำเนินการต่อ',
            textStyle: const TextStyle(
                fontFamily: 'Noto',
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold),
            color: yell,
            fullWidthButton: true,
            size: 49,
          ),
        ),
      ),
    );
  }
}
