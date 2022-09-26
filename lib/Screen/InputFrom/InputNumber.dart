import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class FromNumber extends StatelessWidget {
  const FromNumber({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: IntlPhoneField(
            disableLengthCheck: false,
            dropdownTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: 'NotoSansThai',
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: const BorderSide(),
                borderRadius: BorderRadius.circular(5),
              ),
              labelText: 'หมายเลขโทรศัพท์',
            ),
            dropdownIcon: const Icon(
              Icons.arrow_drop_down,
              size: 0,
            ),
            initialCountryCode: 'TH',
            invalidNumberMessage: 'หมายเลขโทรศัพท์ไม่ถูกต้อง',
            onChanged: (phone) {
              print(
                phone.completeNumber,
              );
            },
          )),
    );
  }
}
