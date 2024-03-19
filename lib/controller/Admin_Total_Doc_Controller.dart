import 'package:doc_bookr/model/Doctor_Model.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AdminTotalDocController extends GetxController {
  static AdminTotalDocController get to => Get.find();
  TextEditingController search = TextEditingController();
  String qury = "";
  updateQure(String q) {
    qury = q;
    searchdata(q);
    update();
  }

  List<DoctorModel> list = [];
  List<DoctorModel> fuilterlist = [];
//   fuilterdata(String q){
// fuilter = [];

//   }
  Future<void> searchdata(String query) async {
    fuilterlist.clear();

    if (query.isEmpty && query == "") {
      fuilterlist.addAll(list);
    } else {
      query = query.toLowerCase();

      fuilterlist = list.where((item) {
        return item.name.toLowerCase().contains(query);
      }).toList();

      // print(fuilterlist.length);
      update();
    }
  }
}
