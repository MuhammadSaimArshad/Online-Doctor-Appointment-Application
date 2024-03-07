import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_bookr/model/DoctorModel.dart';

import 'package:doc_bookr/screen/patient/doctor_screen.dart';
import 'package:doc_bookr/staticdata.dart';
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

  List<Doctorlist> list = [];
  List<Doctorlist> fuilterlist = [];
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

  // Future getdoctor() async {
  //   list = [];
  //   for (var e in StaticData.patientmodel!.doctorList!) {
  //     DocumentSnapshot documentSnapshot =
  //         await StaticData.firebase.collection('doctor').doc(e).get();
  //     DoctorModel? doctorModel =
  //         DoctorModel.fromMap(documentSnapshot.data() as Map<String, dynamic>);
  //     list.add();
  //     update();
  //   }
  //   update();
  // }
}
