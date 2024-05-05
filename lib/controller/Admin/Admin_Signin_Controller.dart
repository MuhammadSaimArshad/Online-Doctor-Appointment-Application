import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_bookr/model/Admin/Admin_Model.dart';
import 'package:doc_bookr/screen/Admin/Admin_home_navbar.dart';
import 'package:doc_bookr/screen/static_data/staticdata.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminLoginController extends GetxController {
  static AdminLoginController get to => Get.find();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String errorMessage = "";

  bool passToggle = true;
  // List<AdminModel> userList = [];
  // login(context) async {
  //   var firestore = FirebaseFirestore.instance;
  //   try {
  //     QuerySnapshot data = await firestore
  //         .collection("admin")
  //         .where("email", isEqualTo: email.text)
  //         .where("password", isEqualTo: password.text)
  //         .get();
  //     if (data.docs.isNotEmpty) {
  //       AdminModel model =
  //           AdminModel.fromMap(data.docs[0].data() as Map<String, dynamic>);

  //       AdminStaticData.user = model;
  //       AdminStaticData.id = model.id;
  //       print("userid store${AdminStaticData.user!.id.toString()}");
  //       // prefs.setString('UserId', AdminStaticData.user!.userid.toString());
  //       Fluttertoast.showToast(
  //         msg: "Login Successful",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.CENTER,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: const Color(0xff0EBE7F),
  //         textColor: Colors.white,
  //         fontSize: 16.0,
  //       );
  //       Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => const AdminHomeNavbarScreen(),
  //           ));
  //       update();
  //       print(model);
  //     } else {
  //       print("Email or password is incorrect");
  //     }
  //   } catch (e) {
  //     print("error${e}");
  //   }
  // }
  FirebaseFirestore firebase = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  void signInWithEmailAndPassword2(BuildContext context) async {
    try {
      UserCredential myuser = await auth.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      User user = myuser.user!;
      if (user != null) {
        Fluttertoast.showToast(
            msg: "Login Succesfull",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: const Color(0xff0EBE7F),
            textColor: Colors.white,
            fontSize: 16.0);
        String id = user.uid;
        // StaticData.patient = id;
        DocumentSnapshot snapshot =
            await firebase.collection("admin").doc(id).get();
        if (snapshot.exists) {
          AdminModel model =
              AdminModel.fromMap(snapshot.data() as Map<String, dynamic>);
          StaticData.adminModel = model;
          update();
          firebase
              .collection("admin")
              .doc(id)
              .update({"token": StaticData.token});
          // ignore: use_build_context_synchronously
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AdminHomeNavbarScreen(),
              ));
          SharedPreferences prefs = await SharedPreferences.getInstance();
          StaticData.cleardata(context).then((value) {
            prefs.setString("admin", id);
            clearForm();
          });
        }
      } else {
        update();
      }
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Invalid Email!";
          break;
        case "wrong-password":
          errorMessage = "Wrong Password";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  clearForm() {
    email.clear();
    password.clear();
    update();
  }
}
