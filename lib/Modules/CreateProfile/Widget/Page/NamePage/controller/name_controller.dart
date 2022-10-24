//name controller

import 'package:get/get.dart';
import 'package:plawarn/modules/createprofile/widget/page/namepage/name_page.dart';
import 'package:plawarn/modules/searchjop/page/search_jop.dart';
import 'package:plawarn/provider/view/api/check_user.dart';

class NameController extends GetxController {
  var isDataLoading = false.obs;
  @override
  void onInit() {
    checknameData();
    super.onInit();
  }

  checknameData() async {
    isDataLoading(true);
    await getProfile();
    if (namecheck.toString() == "") {
      return;
    }
    if (namecheck.toString() != "") {
      print('มีชื่อแล้วไปต่อหน้าโปรไฟล์สกิล');
      Get.offAll(() => const SearchJop());
    } else {
      print('ไม่มีค่า');
    }
  }
}
