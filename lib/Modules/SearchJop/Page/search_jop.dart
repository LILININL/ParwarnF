import 'package:flutter/material.dart';
import 'package:plawarn/modules/searchjop/widget/appbar/search_jobbar.dart';
import 'package:plawarn/modules/searchjop/widget/card/card_search1.dart';
import 'package:plawarn/modules/searchjop/widget/card/card_search2.dart';

import 'package:plawarn/widget/theme/constants/scema_color.dart';

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
