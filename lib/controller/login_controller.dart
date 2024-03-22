// ignore_for_file: unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_bookr/model/Doctor/Doctor_Model.dart';
import 'package:doc_bookr/model/Patient/Patient_Model.dart';
import 'package:doc_bookr/screen/doctor/Doctor_Home/dcotor_home_navbar.dart';

import 'package:doc_bookr/screen/patient/home/home_navbar_screen.dart';
import 'package:doc_bookr/staticdata.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();
  String errorMessage = "";
  TextEditingController email = TextEditingController();
  int index = 0;
  updateindex(int a) {
    index = a;
    update();
  }

  FirebaseFirestore firebase = FirebaseFirestore.instance;
  TextEditingController password = TextEditingController();
  bool passToggle = true;

  void signInWithEmailAndPassword(BuildContext context) async {
    try {
      UserCredential myuser =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      User user = myuser.user!;
      if (user != null) {
        String id = user.uid;
        StaticData.doctor = id;

        DocumentSnapshot snapshot =
            await firebase.collection("doctor").doc(id).get();
        if (snapshot.exists) {
          DoctorModel model =
              DoctorModel.fromMap(snapshot.data() as Map<String, dynamic>);
          StaticData.doctorModel = model;
          StaticData.doctor = model.id;
          update();
          firebase
              .collection("doctor")
              .doc(id)
              .update({"token": StaticData.token});
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DoctorHomeNavbar(),
              ));
          SharedPreferences prefs = await SharedPreferences.getInstance();
          StaticData.cleardata(context).then((value) {
            prefs.setString("doctor", id);
            clearForm();
          });
        } else {
          Fluttertoast.showToast(
              msg: "User Not Found !",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
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
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  void signInWithEmailAndPassword1(BuildContext context) async {
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
            await firebase.collection("patient").doc(id).get();
        if (snapshot.exists) {
          PatientModel model =
              PatientModel.fromMap(snapshot.data() as Map<String, dynamic>);
          StaticData.patientmodel = model;
          update();
          firebase
              .collection("patient")
              .doc(id)
              .update({"token": StaticData.token});
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeNavbarScreen(),
              ));
          SharedPreferences prefs = await SharedPreferences.getInstance();
          StaticData.cleardata(context).then((value) {
            prefs.setString("patient", id);
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
