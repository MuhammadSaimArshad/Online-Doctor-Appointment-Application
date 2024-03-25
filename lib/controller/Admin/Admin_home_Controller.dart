import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';

class AdminHomeController extends GetxController {
  static AdminHomeController get to => Get.find();
  int totalDoctors = 0;
  int totalPatients = 0;
  int totalAppointments = 0;

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
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection("appointment").get();
      totalAppointments = snapshot.docs.length;
      return totalAppointments;
    } catch (e) {
      print("Error getting total appointments: $e");
      rethrow;
    }
  }

  int schedule = 0;

  Future<int> getSchedule() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection("slots")
          .where("isAvailable", isEqualTo: true)
          .get();
      schedule = snapshot.docs.length;
      return schedule;
    } catch (e) {
      print("Error getting schedule: $e");
      throw e;
    }
  }
}
