import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:plawarn/Theme/Scemacolor.dart';
import 'package:plawarn/Widget/AppBar/SearchJobbar.dart';

class SearchJop extends StatefulWidget {
  const SearchJop({super.key});
  static const String routeName = '/SearchJop';
  @override
  State<SearchJop> createState() => _SearchJopState();
}

class _SearchJopState extends State<SearchJop> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SearcjJobbar(),
      backgroundColor: blurpimary,
      extendBodyBehindAppBar: true,
    );
  }
}
