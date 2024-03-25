import 'package:doc_bookr/model/Doctor/Doctor_Model.dart';

import 'package:doc_bookr/screen/static_data/staticdata.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PatientHomeController extends GetxController {
  static PatientHomeController get to => Get.find();
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

  Future getdoctor() async {
    list = [];
    try {
      await StaticData.firebase.collection('doctor').get().then((value) {
        print("asdfgh${value.docs.length}");
        value.docs.forEach((element) {
          DoctorModel doctorModel = DoctorModel.fromMap(element.data());
          list.add(doctorModel);
        });
      });

      update();
    } catch (e) {
      print("dgfhiergfh    error ${e.toString()}");
    }

    update();
  }
}
