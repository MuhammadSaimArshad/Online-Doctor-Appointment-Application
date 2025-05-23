// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_bookr/model/Admin/Admin_Model.dart';
import 'package:doc_bookr/model/Doctor/Doctor_Model.dart';
import 'package:doc_bookr/model/Patient/Patient_Model.dart';

import 'package:doc_bookr/screen/signup_login/signin_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class StaticData {
  static String patient = "";
  static String doctor = "";
  static String admin = "";
  static DoctorModel? doctorModel;
  static PatientModel? patientmodel;
  static AdminModel? adminModel;
  static String token = "";
  static http.Response? response;
  static FirebaseFirestore firebase = FirebaseFirestore.instance;
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseStorage storage = FirebaseStorage.instance;
  static logout(BuildContext context) async {
    SharedPreferences a = await SharedPreferences.getInstance();
    a.getKeys();
    a.clear();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SigninScreen(),
        ));
  }

  static Future cleardata(BuildContext context) async {
    SharedPreferences a = await SharedPreferences.getInstance();
    a.getKeys();
    a.clear();
  }

  static updatetokken(String tokken, String id, String collectionname) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(collectionname, id);
    StaticData.firebase
        .collection(collectionname)
        .doc(id)
        .update({"token": tokken});
  }

  static Future<void> updatepatientprofile() async {
    try {
      DocumentSnapshot snapshot =
          await firebase.collection("patient").doc(patientmodel!.id).get();
      PatientModel model =
          PatientModel.fromMap(snapshot.data() as Map<String, dynamic>);
      patientmodel = model;
    } catch (e) {
      print("errrrrrrror    $e");
      Fluttertoast.showToast(
        msg: "${e.toString()} !",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        fontSize: 17,
        timeInSecForIosWeb: 1,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  static Future<String> getpatienttokken(String id) async {
    try {
      DocumentSnapshot snapshot =
          await firebase.collection("patient").doc(id).get();
      PatientModel model =
          PatientModel.fromMap(snapshot.data() as Map<String, dynamic>);
      patientmodel = model;
      return model.token;
    } catch (e) {
      print("errrrrrrror    $e");
      return "";
    }
  }

  static Future<String> getdoctortokken(String id) async {
    try {
      DocumentSnapshot snapshot =
          await firebase.collection("doctor").doc(id).get();
      DoctorModel model =
          DoctorModel.fromMap(snapshot.data() as Map<String, dynamic>);
      return model.token;
    } catch (e) {
      print("errrrrrrror    $e");
      return "";
    }
  }

  static Future<String> getadmintokken(String id) async {
    try {
      DocumentSnapshot snapshot =
          await firebase.collection("admin").doc(id).get();
      AdminModel model =
          AdminModel.fromMap(snapshot.data() as Map<String, dynamic>);
      return model.token;
    } catch (e) {
      print("errrrrrrror    $e");
      return "";
    }
  }

  static Future<void> updatedoctorprofile() async {
    try {
      DocumentSnapshot snapshot =
          await firebase.collection("doctor").doc(doctorModel!.id).get();
      DoctorModel model =
          DoctorModel.fromMap(snapshot.data() as Map<String, dynamic>);
      doctorModel = model;
    } catch (e) {
      print("errrrrrrror    $e");
      Fluttertoast.showToast(
        msg: "${e.toString()} !",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        fontSize: 17,
        timeInSecForIosWeb: 1,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  static Future<void> updateadminprofile() async {
    try {
      DocumentSnapshot snapshot =
          await firebase.collection("admin").doc(adminModel!.id).get();
      AdminModel model =
          AdminModel.fromMap(snapshot.data() as Map<String, dynamic>);
      adminModel = model;
    } catch (e) {
      print("errrrrrrror    $e");
      Fluttertoast.showToast(
        msg: "${e.toString()} !",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        fontSize: 17,
        timeInSecForIosWeb: 1,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  static String formatMicrosecondsSinceEpoch(int microsecondsSinceEpoch) {
    DateTime dateTime =
        DateTime.fromMicrosecondsSinceEpoch(microsecondsSinceEpoch);

    String formattedDate = DateFormat('MM/dd/yyyy').format(dateTime);

    return formattedDate;
  }

  static String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  static sendNotifcation(String title, String msg, String tokken) async {
    print("token$tokken");
    var body = {
      "registration_ids": [tokken],
      "notification": {
        "body": msg,
        "title": title,
        "android_channel_id": "pushnotificationapp",
        "sound": true,
        // "image_url": " images/app.png,",
      },
      "data": {
        "source": "chat",
      }
    };
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authorization':
          'key=AAAAoAfTw3Q:APA91bETsrYX-hrnD0jwK_fWSPXPhWcK7RwXWX2FkT0jx_NYK3XbOzPZVtrkBYE1xLTULiGXtj2Xdj1QVVguDXBpRYQUmVXrM2UiPww7hGP-TbimiP9bHp6-jekwxigV8eCgB_f0VIBo'
    };
    response = await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: headers, body: jsonEncode(body));
    if (response!.statusCode == 200) {
      print(response!.body);
      print('data: ${response!}');
      print('data statusCode: ${response!.statusCode}');
    } else {
      print('data: ${response!}');
      print('data statusCode: ${response!.statusCode}');

      print("error");
    }
  }

  static openWhatsAppChat() async {
    try {
      String url = "https://wa.me/+923059895650?text=Hello";

      await launch(url);
    } catch (e) {
      print("errorr${e}");
    }
  }

  static openEmailChat() async {
    try {
      String url = 'mailto:saimarshad075@gmail.com';

      await launch(url);
    } catch (e) {
      print("errorr${e}");
    }
  }

  static TimeOfDay roundToNearestHalfHour(TimeOfDay timeOfDay) {
    int roundedHour = timeOfDay.hour;
    int roundedMinute = (timeOfDay.minute / 30).round() * 30;

    if (roundedMinute == 60) {
      roundedMinute = 0;
      roundedHour++;
    }

    return TimeOfDay(hour: roundedHour, minute: roundedMinute);
  }
}
