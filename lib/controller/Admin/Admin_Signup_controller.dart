import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_bookr/model/Admin/Admin_Model.dart';

import 'package:doc_bookr/screen/Admin/Admin_Signup_Login/admin_signin.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:uuid/uuid.dart';

class AdminSignupController extends GetxController {
  static AdminSignupController get to => Get.find();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  sinup(context) {
    print("object");
    var firestore = FirebaseFirestore.instance;
    var uuid = Uuid();
    String userId = uuid.v4();
    AdminModel model = AdminModel(
        userid: userId,
        name: name.text,
        email: email.text,
        password: password.text);

    firestore.collection("Admin").doc(userId).set(model.toMap());
    Fluttertoast.showToast(
      msg: "Signup Successful",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: const Color(0xff0EBE7F),
      textColor: Colors.white,
      fontSize: 16.0,
    );
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AdminSignIn(),
        ));
    return "";
  }
}
