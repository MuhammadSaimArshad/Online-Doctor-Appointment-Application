import 'package:doc_bookr/model/Doctor_Model.dart';
import 'package:doc_bookr/model/Patient_Model.dart';
import 'package:doc_bookr/staticdata.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DoctorProfileController extends GetxController {
  String? id;
  static DoctorProfileController get to => Get.find();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController specilest = TextEditingController();
  TextEditingController bio = TextEditingController();
  TextEditingController about = TextEditingController();
  TextEditingController password = TextEditingController();
  // String dropdown = "Select Category";
  String patientimage = '';
  TextEditingController patientname = TextEditingController();
  TextEditingController patientemail = TextEditingController();
  TextEditingController patientphonenumber = TextEditingController();
  TextEditingController fee = TextEditingController();

  patientDprofile(PatientModel model) {
    patientimage = model.image;
    patientname.text = model.name;
    patientemail.text = model.email;
    patientphonenumber.text = model.phonenumber;
    update();
  }

  clearprofile() {
    patientemail.clear();
    patientname.clear();
    patientphonenumber.clear();
    patientimage = "";
    update();
  }

  initalizedata(DoctorModel doctorModel) {
    id = doctorModel.id;
    hpickedFile = null;
    name.text = doctorModel.name;
    email.text = doctorModel.email;
    password.text = doctorModel.password;
    image = doctorModel.image;
    phonenumber.text = doctorModel.phonenumber;
    address.text = doctorModel.address;
    specilest.text = doctorModel.specialty;
    bio.text = doctorModel.bio;
    about.text = doctorModel.about;
    startTime = doctorModel.starttime;
    endTime = doctorModel.endtime;
    fee.text = doctorModel.fee.toString();
    dropdown = doctorModel.category;
    maxAppointmentDuration = doctorModel.maxAppointmentDuration;
    update();
  }

  Future<void> adminUpdateprofile(context) async {
    print("isdgfeyregh");
    if (hpickedFile != null) {
      await uploadImage(id.toString()).then((value) {
        changeEmailAndPassword(email.text, password.text).then((value1) {
          StaticData.firebase.collection("doctor").doc(id.toString()).update({
            "name": name.text,
            "email": email.text,
            "phonenumber": phonenumber.text,
            "address": address.text,
            "specialty": specilest.text,
            "bio": bio.text,
            "category": dropdown,
            "fee": double.tryParse(fee.text) ?? 0.0,
            "about": about.text,
            "starttime": startTime,
            "endtime": endTime,
            "maxAppointmentDuration": maxAppointmentDuration,
            "password": password.text,
            "image": value
          });
        }).then((value) {
          Navigator.pop(context);
          Fluttertoast.showToast(
            msg: "Profile update sucessfully",
            backgroundColor: Color(0xff0EBE7F),
            textColor: Colors.white,
            gravity: ToastGravity.BOTTOM,
            fontSize: 17,
            timeInSecForIosWeb: 1,
            toastLength: Toast.LENGTH_LONG,
          );
        });
      });
    } else {
      changeEmailAndPassword(email.text, password.text).then((value1) {
        StaticData.firebase.collection("doctor").doc(id.toString()).update({
          "name": name.text,
          "email": email.text,
          "phonenumber": phonenumber.text,
          "address": address.text,
          "specialty": specilest.text,
          "bio": bio.text,
          "category": dropdown,
          "about": about.text,
          "starttime": startTime,
          "fee": double.tryParse(fee.text) ?? 0.0,
          "endtime": endTime,
          "maxAppointmentDuration": maxAppointmentDuration,
          "password": password.text,
        });
        print("update data");
      }).then((value) {
        Navigator.pop(context);
        Fluttertoast.showToast(
          msg: "Profile update sucessfully",
          backgroundColor: Color(0xff0EBE7F),
          textColor: Colors.white,
          gravity: ToastGravity.BOTTOM,
          fontSize: 17,
          timeInSecForIosWeb: 1,
          toastLength: Toast.LENGTH_LONG,
        );
      });
    }
  }

  bool passToggle = false;
  String? image;
  String link = "";
  String? startTime;
  String? endTime;
  int? maxAppointmentDuration;

  int? index = 1;
  int? duration;
  List<String> time = ["10", "20", "30"];
  updateduration(int a) {
    duration = a;
    maxAppointmentDuration = int.tryParse(time[a]);
    update();
  }

  XFile? hpickedFile;

  pickImage(ImageSource source) async {
    var pickedImage = await ImagePicker().pickImage(source: source);
    update();
    if (pickedImage != null) {
      hpickedFile = pickedImage;
      update();
    }
    print("xfileimage$hpickedFile");
    return hpickedFile;
  }

  Future<void> updateprofile() async {
    if (hpickedFile != null) {
      await uploadImage(id.toString()).then((value) {
        changeEmailAndPassword(email.text, password.text).then((value1) {
          StaticData.firebase.collection("doctor").doc(id.toString()).update({
            "name": name.text,
            "email": email.text,
            "phonenumber": phonenumber.text,
            "address": address.text,
            "specialty": specilest.text,
            "bio": bio.text,
            "category": dropdown,
            "fee": double.tryParse(fee.text) ?? 0.0,
            "about": about.text,
            "starttime": startTime,
            "endtime": endTime,
            "maxAppointmentDuration": maxAppointmentDuration,
            "password": password.text,
            "image": value
          });
        }).then((value) {
          StaticData.updatedoctorprofile().then((value) {
            initalizedata(StaticData.doctorModel!);
            Fluttertoast.showToast(
              msg: "Profile update sucessfully",
              backgroundColor: Color(0xff0EBE7F),
              textColor: Colors.white,
              gravity: ToastGravity.BOTTOM,
              fontSize: 17,
              timeInSecForIosWeb: 1,
              toastLength: Toast.LENGTH_LONG,
            );
          });
        });
      });
    } else {
      changeEmailAndPassword(email.text, password.text).then((value1) {
        StaticData.firebase.collection("doctor").doc(id.toString()).update({
          "name": name.text,
          "email": email.text,
          "phonenumber": phonenumber.text,
          "address": address.text,
          "specialty": specilest.text,
          "bio": bio.text,
          "category": dropdown,
          "about": about.text,
          "starttime": startTime,
          "fee": double.tryParse(fee.text) ?? 0.0,
          "endtime": endTime,
          "maxAppointmentDuration": maxAppointmentDuration,
          "password": password.text,
        });
        print("update data");
      }).then((value) {
        StaticData.updatedoctorprofile().then((value) {
          initalizedata(StaticData.doctorModel!);
          Fluttertoast.showToast(
            msg: "Profile update sucessfully",
            backgroundColor: Color(0xff0EBE7F),
            textColor: Colors.white,
            gravity: ToastGravity.BOTTOM,
            fontSize: 17,
            timeInSecForIosWeb: 1,
            toastLength: Toast.LENGTH_LONG,
          );
        });
      });
    }
  }

  Future<String> uploadImage(String id) async {
    try {
      Reference ref = FirebaseStorage.instance.ref().child("doctor").child(id);

      UploadTask uploadTask;
      if (kIsWeb) {
        uploadTask = ref.putData(
            await hpickedFile!.readAsBytes(),
            SettableMetadata(
              contentType: 'image/jpeg',
            ));
      } else {
        uploadTask = ref.putData(
          await hpickedFile!.readAsBytes(),
          SettableMetadata(contentType: 'image/jpeg'),
        );
      }

      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});

      if (taskSnapshot.state == TaskState.success) {
        var url = await ref.getDownloadURL();
        print("3333333333333/link");
        link = url;
      } else {
        Fluttertoast.showToast(
          msg: "Image upload failed!",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          gravity: ToastGravity.BOTTOM,
          fontSize: 17,
          timeInSecForIosWeb: 1,
          toastLength: Toast.LENGTH_LONG,
        );
      }
    } catch (e) {
      print("error/${e.toString()}");
      Fluttertoast.showToast(
        msg: "Image upload error: /e",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        fontSize: 17,
        timeInSecForIosWeb: 1,
        toastLength: Toast.LENGTH_LONG,
      );
    }
    return link;
  }

  Future<void> changeEmailAndPassword(
      String newEmail, String newPassword) async {
    try {
      User? user = StaticData.auth.currentUser;

      if (user != null) {
        await user.updateEmail(newEmail);
        print("Email updated successfully to $newEmail");

        await user.updatePassword(newPassword);
        print("Password updated successfully");
      } else {
        print("User not signed in.");
      }
    } catch (error) {
      print("Error updating email and password: $error");
    }
  }

  String dropdown = "Select Category";

  void dropdownupdate(String s) {
    dropdown = s;
    update();
  }
}
