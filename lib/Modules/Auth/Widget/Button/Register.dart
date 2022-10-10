import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: const Text(
        "สมัครสมาชิก",
        style: TextStyle(
          color: Color.fromRGBO(4, 94, 228, 0.8),
          fontWeight: FontWeight.bold,
          fontSize: 18,
          fontFamily: 'Noto',
        ),
      ),
    );
  }
}
