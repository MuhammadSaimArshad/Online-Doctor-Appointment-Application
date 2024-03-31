import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_bookr/model/Doctor/Doctor_Slots.dart';

import 'package:get/get.dart';

class AdminHomeController extends GetxController {
  static AdminHomeController get to => Get.find();
  int totalDoctors = 0;
  int totalPatients = 0;
  int totalAppointments = 0;
  int totalslot = 0;

  Future<int> getTotalDoctors() async {
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection("doctor").get();
      totalDoctors = snapshot.docs.length;
      return totalDoctors;
    } catch (e) {
      print("Error getting total doctors: $e");
      rethrow;
    }
  }

  Future<int> getTotalPatients() async {
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection("patient").get();
      totalPatients = snapshot.docs.length;
      return totalPatients;
    } catch (e) {
      print("Error getting total patients: $e");
      rethrow;
    }
  }

  Future<int> getTotalAppointments() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection("appointment").get();
      totalAppointments = snapshot.docs.length;

      return totalAppointments;
    } catch (e) {
      print("Error getting total appointments: $e");
      rethrow;
    }
  }

  Future<int> getTotalslot() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection("slots")
          .doc()
          .collection("slots")
          .get();
      int totalslot = 0;
      snapshot.docs.forEach((element) {
        DoctorSlot model = DoctorSlot.fromMap(element.data());
        if (model.isAvailable == true) {
          totalslot = totalslot + 1;
          update();
        }
      });

      return totalslot;
    } catch (e) {
      print("Error getting total slot: $e");
      rethrow;
    }
  }
}
