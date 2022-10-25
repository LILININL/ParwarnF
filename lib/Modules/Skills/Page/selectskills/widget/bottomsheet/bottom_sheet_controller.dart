// // ignore_for_file: use_build_context_synchronously

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class skilladd {
//   String? id;
//   skilladd(this.id);
// }

// class childSkills extends GetxController {
//   List<String> skillsChecked = [];
//   late List<skilladd> childskillid;

//   var isDataLoading = false.obs;
//   @override
//   void onInit() {
//     super.onInit();
//     onSelected(
//       String id,
//     ) {
//       if (skillsChecked.contains(id)) {
//         skillsChecked.remove(id);
//       } else {
//         skillsChecked.add(id);
//       }
//       update();
//     }
//   }

//   onSelected(bool selected, String id, String parent) {
//     if (selected == true && skillsChecked.length <= 2) {
//       skillsChecked.add(id);
//       childskillid = skillsChecked.map((e) => skilladd(e)).toList();
//     } else {
//       skillsChecked.remove(id);
//       childskillid = skillsChecked.map((e) => skilladd(e)).toList();
//     }
//   }
// }
