import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:plawarn/Theme/Scemacolor.dart';
import 'package:plawarn/Widget/AppBar/SearchJobbar.dart';
import 'package:plawarn/Widget/Card/CardSearch1.dart';
import 'package:plawarn/Widget/Card/CardSearch2.dart';

class SearchJop extends StatefulWidget {
  const SearchJop({super.key});
  static const String routeName = '/SearchJop';
  @override
  State<SearchJop> createState() => _SearchJopState();
}

class _SearchJopState extends State<SearchJop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const SearcjJobbar(),
      backgroundColor: blurpimary,
      // extendBodyBehindAppBar: true,
      body: Container(
        constraints: const BoxConstraints(
          maxHeight: double.infinity,
          minWidth: double.infinity,
        ),
        child: Column(
          children: const <Widget>[
            CardSearch1(),
            CardSearch2(),
          ],
        ),
      ),
    );
  }
}
