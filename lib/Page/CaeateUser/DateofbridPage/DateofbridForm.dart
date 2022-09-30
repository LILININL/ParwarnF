import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:getwidget/getwidget.dart';
import 'package:plawarn/Model/Json/CreateProfile/CreateProfile.dart';

import '../../../Theme/ScemaColor.dart';
import '../../../Widget/AppBar/CreateProfile.dart';

//Lsit Month
const List<String> Month = <String>[
  'มกราคม',
  'กุมภาพันธ์',
  'มีนาคม',
  'เมษายน',
  'พฤษภาคม',
  'มิถุนายน',
  'กรกฎาคม',
  'สิงหาคม',
  'กันยายน',
  'ตุลาคม',
  'พฤศจิกายน',
  'ธันวาคม',
];
//List Year loop
List<String> Year = <String>[];
//List Day loop
List<String> Day = <String>[];

class DateOfBirthForm extends StatefulWidget {
  static const String routeName = '/DateOfBirthForm';
  const DateOfBirthForm({super.key});

  @override
  State<DateOfBirthForm> createState() => _DateOfBirthFormState();
}

class _DateOfBirthFormState extends State<DateOfBirthForm> {
  final DateofBridkey = GlobalKey<FormState>();
  final UserDateofBrid _DateofBrid = UserDateofBrid();
  var dropdown;

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
                style: textStyle24,
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 8, 0, 20),
              child: Text('วันเกิดและเพศ', style: textStyle18),
            ),
            Expanded(
              child: Form(
                key: DateofBridkey,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text('วันเกิด', style: textStyle16),
                          ),
                          TextFormField(
                            onSaved: (String? date) {
                              _DateofBrid.date = date;
                            },
                            validator: (date) {
                              if (date == null || date.isEmpty) {
                                return 'กรุณากรอกเลขวันเกิด';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                hintText: 'วัน', hintStyle: textStyle18),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text('', style: textStyle16),
                          ),
                          TextFormField(
                            onSaved: (String? month) {
                              _DateofBrid.month = month;
                            },
                            validator: (month) {
                              if (month == null || month.isEmpty) {
                                return 'กรุณากรอกเดือน';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                hintText: 'เดือน', hintStyle: textStyle18),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text('', style: textStyle16),
                          ),
                          TextFormField(
                            onSaved: (String? year) {
                              _DateofBrid.year = year;
                            },
                            validator: (year) {
                              if (year == null || year.isEmpty) {
                                return 'กรุณากรอกปี';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                hintText: 'ปี', hintStyle: textStyle18),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text('เพศ', style: textStyle16),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 300),
              child: DropdownButtonHideUnderline(
                child: GFDropdown(
                  padding: const EdgeInsets.all(10),
                  borderRadius: BorderRadius.circular(5),
                  border: const BorderSide(color: Colors.black12, width: 1),
                  dropdownButtonColor: Colors.white,
                  value: dropdown,
                  onChanged: (newValue) {
                    setState(() {
                      dropdown = newValue;
                    });
                  },
                  items: ['MALE', 'FEMALE', 'OTHER', 'NOT_SPECIFIED']
                      .map((value) => DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          ))
                      .toList(),
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
              if (DateofBridkey.currentState!.validate()) {
                DateofBridkey.currentState!.save();
                Navigator.pushNamed(context, '/AvatarForm');
                print(dropdown);
                print(_DateofBrid.date);
                print(_DateofBrid.month);
                print(_DateofBrid.year);
                DateofBridkey.currentState!.reset();
              }
              return null;
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
