import 'package:doc_bookr/model/admin_model.dart';
import 'package:doc_bookr/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StaticData {
  static AdminModel? user;
  static String? id;

  // static logout(BuildContext context) async {
  //   SharedPreferences a = await SharedPreferences.getInstance();
  //   a.getKeys();
  //   a.clear();
  //   // ignore: use_build_context_synchronously
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => const SigninScreen(),
  //       ));
  // }

  // static Future cleardata(BuildContext context) async {
  //   SharedPreferences a = await SharedPreferences.getInstance();
  //   a.getKeys();
  //   a.clear();
  // }
}
