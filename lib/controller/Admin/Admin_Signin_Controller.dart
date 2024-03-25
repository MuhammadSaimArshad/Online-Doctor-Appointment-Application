import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_bookr/screen/static_data/admin_satatic_data.dart';
import 'package:doc_bookr/model/Admin/Admin_Model.dart';

import 'package:doc_bookr/screen/Admin/Admin_home_navbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AdminLoginController extends GetxController {
  static AdminLoginController get to => Get.find();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool passToggle = true;
  List<AdminModel> userList = [];
  login(context) async {
    var firestore = FirebaseFirestore.instance;
    try {
      QuerySnapshot data = await firestore
          .collection("admin")
          .where("email", isEqualTo: email.text)
          .where("password", isEqualTo: password.text)
          .get();
      if (data.docs.isNotEmpty) {
        AdminModel model =
            AdminModel.fromMap(data.docs[0].data() as Map<String, dynamic>);

        StaticData.user = model;
        StaticData.id = model.userid;
        print("userid store${StaticData.user!.userid.toString()}");
        // prefs.setString('UserId', StaticData.user!.userid.toString());
        Fluttertoast.showToast(
          msg: "Login Successful",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: const Color(0xff0EBE7F),
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AdminHomeNavbarScreen(),
            ));
        update();
        print(model);
      } else {
        print("Email or password is incorrect");
      }
    } catch (e) {
      print("error${e}");
    }
  }

  clearForm() {
    email.clear();
    password.clear();
    update();
  }
}
