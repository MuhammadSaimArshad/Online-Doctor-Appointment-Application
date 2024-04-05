import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:doc_bookr/model/Doctor/Doctor_Add_Medicine.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:uuid/uuid.dart';

class DoctorAddMedicine extends GetxController {
  static DoctorAddMedicine get to => Get.find();
  TextEditingController medicine1 = TextEditingController();
  TextEditingController time1 = TextEditingController();
  TextEditingController medicine2 = TextEditingController();
  TextEditingController time2 = TextEditingController();
  TextEditingController medicine3 = TextEditingController();
  TextEditingController time3 = TextEditingController();
  TextEditingController medicine4 = TextEditingController();
  TextEditingController time4 = TextEditingController();
  TextEditingController medicine5 = TextEditingController();
  TextEditingController time5 = TextEditingController();
  TextEditingController medicine6 = TextEditingController();
  TextEditingController time6 = TextEditingController();
  TextEditingController day = TextEditingController();

  addmedicine(context) {
    var firestore = FirebaseFirestore.instance;
    var uuid = Uuid();
    String id = uuid.v4();
    DoctorAddMedicineModel model = DoctorAddMedicineModel(
      id: id,
      medicine1: medicine1.text,
      time1: time1.text,
      medicine2: medicine2.text,
      time2: time2.text,
      medicine3: medicine3.text,
      time3: time3.text,
      medicine4: medicine4.text,
      time4: time4.text,
      medicine5: medicine5.text,
      time5: time5.text,
      medicine6: medicine6.text,
      time6: time6.text,
      day: day.text,
    );

    firestore.collection("appointmen").doc(id).set(model.toMap());
    Fluttertoast.showToast(
      msg: "Medicine Add Successful",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: const Color(0xff0EBE7F),
      textColor: Colors.white,
      fontSize: 16.0,
    );

    return "";
  }
}
