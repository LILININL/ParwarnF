import 'package:flutter/material.dart';

const blurpimary = Color.fromRGBO(4, 94, 228, 0.8);
const graycolor = Color.fromRGBO(153, 165, 183, 0.8);

class VerifyOtp extends StatefulWidget {
  static const String routeName = '/VerifyOtp';

  const VerifyOtp({super.key});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Verify'),
    );
  }
}
