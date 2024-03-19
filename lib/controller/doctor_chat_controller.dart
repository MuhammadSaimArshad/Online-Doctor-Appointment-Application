import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_bookr/model/Patient_Model.dart';
import 'package:doc_bookr/staticdata.dart';
import 'package:get/get.dart';

class DoctorChatController extends GetxController {
  static DoctorChatController get to => Get.find();
  List<PatientModel> patientList = [];
  Future<void> getpatient() async {
    patientList = [];
    for (var e in StaticData.doctorModel!.patientList!) {
      DocumentSnapshot snapshot =
          await StaticData.firebase.collection("patient").doc(e).get();
      PatientModel model =
          PatientModel.fromMap(snapshot.data() as Map<String, dynamic>);
      patientList.add(model);
    }
    update();
  }
}
