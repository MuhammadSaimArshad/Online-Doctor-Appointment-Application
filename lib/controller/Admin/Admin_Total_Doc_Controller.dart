import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_bookr/model/Doctor_Model.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  Future<void> deleteDoctor(String documentId) async {
    try {
      // Access the Firestore instance and delete the document
      await FirebaseFirestore.instance
          .collection('doctor')
          .doc(documentId)
          .delete();
      print('Document with ID $documentId deleted successfully');

      // Show toast notification
      Fluttertoast.showToast(
        msg: "Doctor  Deleted Successfully",
        backgroundColor: const Color(0xff0EBE7F),
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        fontSize: 17,
        timeInSecForIosWeb: 1,
        toastLength: Toast.LENGTH_LONG,
      );
    } catch (e) {
      // Error handling
      print('Error deleting document: $e');
      throw e; // Throw the error for further handling
    }
  }
}
