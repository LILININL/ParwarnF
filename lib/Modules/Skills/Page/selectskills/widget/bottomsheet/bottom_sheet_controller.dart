import 'package:get/get.dart';

class BottomSheetController extends GetxController {
  final _bottomSheet = false.obs;
  bool get bottomSheet => _bottomSheet.value;
  set bottomSheet(bool value) => _bottomSheet.value = value;

  var isCheckedAll = false.obs;
  var unselectIcon = 'assets/images/iconsvg/chboxfalse.svg'.obs;
  var selectIcon = 'assets/images/iconsvg/checkboxtrue.svg'.obs;
  var iconStatus = ['N', 'N', 'N', 'N', 'N', 'N'].obs;
  var iconList = [
    'assets/images/iconsvg/chboxfalse.svg',
    'assets/images/iconsvg/chboxfalse.svg',
  ];
}
