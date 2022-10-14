import 'package:get/get.dart';

class BottomSheetController extends GetxController {
  final _bottomSheet = false.obs;
  bool get bottomSheet => _bottomSheet.value;
  set bottomSheet(bool value) => _bottomSheet.value = value;

  var isCheckedAll = false.obs;
  var unselectIcon =
      'assets/images/check_car_data/check_car_data_unselect_icon.svg'.obs;
  var selectIcon =
      'assets/images/check_car_data/check_car_data_select_icon.svg'.obs;
  var iconStatus = ['N', 'N', 'N', 'N', 'N', 'N'].obs;
  var iconList = [
    'assets/images/check_car_data/check_car_data_unselect_icon.svg',
    'assets/images/check_car_data/check_car_data_unselect_icon.svg',
    'assets/images/check_car_data/check_car_data_unselect_icon.svg',
  ];
}
