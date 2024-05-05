import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_bookr/model/Admin/Admin_Model.dart';

import 'package:doc_bookr/screen/Admin/Admin_Signup_Login/admin_signin.dart';
import 'package:doc_bookr/screen/static_data/staticdata.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AdminSignupController extends GetxController {
  static AdminSignupController get to => Get.find();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool passToggle = true;

  FirebaseFirestore firebase = FirebaseFirestore.instance;
  void registeradmin(context) async {
    try {
      UserCredential myuser =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      User user = myuser.user!;

      String id = user.uid;
      AdminModel model = AdminModel(
        email: email.text,
        name: name.text,
        token: StaticData.token,
        password: password.text,
        id: id,
        image:
            'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg',
      );
      await firebase.collection("admin").doc(id).set(model.toMap());
      clearForm();
      Fluttertoast.showToast(
        msg: "Signup Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color(0xff0EBE7F),
        textColor: Colors.white,
        fontSize: 16.0,
      );

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const AdminSignIn(),
          ));
    } catch (e) {
      print("eror${e.toString()}");
      Fluttertoast.showToast(
        msg: "Check internet connecti...or try another email${e.toString()}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  clearForm() {
    name.clear();
    email.clear();
    password.clear();
    update();
  }
}
