import 'package:flutter/material.dart';
import 'package:plawarn/widget/model/dtos/createprofile/create_profile.dart';
import 'package:plawarn/widget/theme/constants/scema_color.dart';
import 'package:plawarn/widget/theme/constants/scema_textstyle.dart';

class InputCreateNameFrom extends StatelessWidget {
  const InputCreateNameFrom({
    Key? key,
    required this.Namekey,
    required UserName Name,
  })  : _Name = Name,
        super(key: key);

  final GlobalKey<FormState> Namekey;
  final UserName _Name;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: Namekey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 24, 0, 5),
              child: Text(
                'ชื่อ',
                style: textStyle16,
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              maxLines: 1,
              autofocus: false,
              onSaved: (String? fristname) {
                _Name.fristname = fristname;
              },
              validator: (name) {
                if (name == null || name.isEmpty) {
                  return 'กรุณากรอกชื่อของคุณ';
                }
                return null;
              },
              decoration: InputDecoration(
                isDense: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
                    color: inputcolor,
                    width: 1.0,
                    style: BorderStyle.solid,
                  ),
                ),
                border: const OutlineInputBorder(),
                hintText: 'ชื่อ',
                hintStyle: textStyle18,
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 5),
              child: Text('นามสกุล', style: textStyle16),
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              onSaved: (String? lastname) {
                _Name.lastname = lastname;
              },
              validator: (lastname) {
                if (lastname == null || lastname.isEmpty) {
                  return 'กรุณากรอกนามสกุลของคุณ';
                }
                return null;
              },
              decoration: InputDecoration(
                  isDense: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(
                      color: inputcolor,
                      width: 1.0,
                      style: BorderStyle.solid,
                    ),
                  ),
                  border: const OutlineInputBorder(),
                  hintText: 'นามสกุล',
                  hintStyle: textStyle18),
            ),
          ],
        ));
  }
}
