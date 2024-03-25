import 'dart:io';

import 'package:doc_bookr/model/Patient/Patient_Model.dart';
import 'package:doc_bookr/screen/static_data/staticdata.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();
  String? id;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String patientimage = '';
  TextEditingController patientname = TextEditingController();
  TextEditingController patientemail = TextEditingController();
  TextEditingController patientphonenumber = TextEditingController();
  bool passToggle = false;
  String? image;
  File? file;
  String link = "";
  patientDprofile(PatientModel patientmodel) {
    patientimage = patientmodel.image;
    patientname.text = patientmodel.name;
    patientemail.text = patientmodel.email;
    patientphonenumber.text = patientmodel.phonenumber;
    update();
  }

  clearprofile() {
    patientemail.clear();
    patientname.clear();
    patientphonenumber.clear();
    patientimage = "";
    update();
  }

  initalizedata(PatientModel patientmodel) {
    id = patientmodel.id;
    hpickedFile = null;
    name.text = patientmodel.name;
    email.text = patientmodel.email;
    password.text = patientmodel.password;
    image = patientmodel.image;
    update();
  }

  Future<void> adminupdatepatientprofile(context) async {
    try {
      if (hpickedFile != null) {
        await uploadImage(id.toString()).then((value) {
          changeEmailAndPassword(email.text, password.text).then((value1) {
            StaticData.firebase
                .collection("patient")
                .doc(id.toString())
                .update({
              "name": name.text,
              "email": email.text,
              "password": password.text,
              "image": value
            });
          }).then((value) {
            Navigator.pop(context);
            Fluttertoast.showToast(
              msg: "Profile update sucessfully",
              backgroundColor: Color(0xff0EBE7F),
              textColor: Colors.white,
              gravity: ToastGravity.CENTER,
              fontSize: 17,
              timeInSecForIosWeb: 1,
              toastLength: Toast.LENGTH_LONG,
            );
          });
        });
      } else {
        changeEmailAndPassword(email.text, password.text).then((value1) {
          StaticData.firebase.collection("patient").doc(id.toString()).update({
            "name": name.text,
            "email": email.text,
            "password": password.text,
          });
        }).then((value) {
          Navigator.pop(context);
          Fluttertoast.showToast(
            msg: "Profile update sucessfully",
            backgroundColor: Color(0xff0EBE7F),
            textColor: Colors.white,
            gravity: ToastGravity.CENTER,
            fontSize: 17,
            timeInSecForIosWeb: 1,
            toastLength: Toast.LENGTH_LONG,
          );
        });
      }
    } catch (e) {
      print("errrrrroorrrrrr     ${e.toString()}");
    }
  }

  Future<void> updateprofile() async {
    if (hpickedFile != null) {
      await uploadImage(StaticData.patientmodel!.id.toString()).then((value) {
        changeEmailAndPassword(email.text, password.text).then((value1) {
          StaticData.firebase
              .collection("patient")
              .doc(StaticData.patientmodel!.id.toString())
              .update({
            "name": name.text,
            "email": email.text,
            "password": password.text,
            "image": value
          });
        }).then((value) {
          StaticData.updatepatientprofile().then((value) {
            initalizedata(StaticData.patientmodel!);
            Fluttertoast.showToast(
              msg: "Profile update sucessfully",
              backgroundColor: const Color(0xff0EBE7F),
              textColor: Colors.white,
              gravity: ToastGravity.CENTER,
              fontSize: 17,
              timeInSecForIosWeb: 1,
              toastLength: Toast.LENGTH_LONG,
            );
          });
        });
      });
    } else {
      changeEmailAndPassword(email.text, password.text).then((value1) {
        StaticData.firebase
            .collection("patient")
            .doc(StaticData.patientmodel!.id.toString())
            .update({
          "name": name.text,
          "email": email.text,
          "password": password.text,
        });
        print("update data");
      }).then((value) {
        StaticData.updatepatientprofile().then((value) {
          initalizedata(StaticData.patientmodel!);
          Fluttertoast.showToast(
            msg: "Profile update sucessfully",
            backgroundColor: Color(0xff0EBE7F),
            textColor: Colors.white,
            gravity: ToastGravity.CENTER,
            fontSize: 17,
            timeInSecForIosWeb: 1,
            toastLength: Toast.LENGTH_LONG,
          );
        });
      });
    }
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

  Future<String> uploadImage(String id) async {
    try {
      Reference ref = FirebaseStorage.instance.ref().child("patient").child(id);

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
}
