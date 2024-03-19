import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_bookr/model/Patient_Model.dart';

import 'package:doc_bookr/staticdata.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DoctorHomeController extends GetxController {
  static DoctorHomeController get to => Get.find();
  TextEditingController search = TextEditingController();
  String qury = "";
  updateQure(String q) {
    qury = q;
    searchdata(q);
    update();
  }

  List<PatientModel> list = [];
  List<PatientModel> fuilterlist = [];
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

  Future getPatient() async {
    print("object");
    list = [];
    for (var e in StaticData.doctorModel!.patientList!) {
      DocumentSnapshot documentSnapshot =
          await StaticData.firebase.collection('patient').doc(e).get();
      PatientModel? patientModel =
          PatientModel.fromMap(documentSnapshot.data() as Map<String, dynamic>);
      list.add(patientModel);
      update();
    }
    update();
  }

  int schedule = 0;
  Future<int> getSchedule() async {
    QuerySnapshot snapshot = await StaticData.firebase
        .collection("slots")
        .doc(StaticData.doctorModel!.id.toString())
        .collection("slots")
        .where("isAvailable", isEqualTo: true)
        .get();
    schedule = snapshot.docs.length;
    update();
    return schedule;
  }
}
