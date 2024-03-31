import 'package:doc_bookr/controller/Admin/Admin_Signup_controller.dart';

import 'package:doc_bookr/screen/Admin/Admin_Signup_Login/admin_signin.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

class AdminSignup extends StatefulWidget {
  const AdminSignup({super.key});

  @override
  State<AdminSignup> createState() => _AdminSignupState();
}

class _AdminSignupState extends State<AdminSignup> {
  var height, width;

  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    Get.put(AdminSignupController());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return GetBuilder<AdminSignupController>(builder: (obj) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: height,
            width: width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xff0EBE4f),
                  Color(0xff0EBE7F),
                  Color(0xffffffff),
                ],
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  height: height * 0.3,
                  width: width * 0.8,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "images/play_store_512-removebg-preview.png"))),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    controller: obj.name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: width * 0.01,
                        ),
                      ),
                      label: Text(
                        " Name",
                        style: TextStyle(
                            color: Colors.white, fontSize: width * 0.035),
                      ),
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: Colors.white,
                        size: width * 0.05,
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your  Name';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    controller: obj.email,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white, width: width * 0.01)),
                      label: Text(
                        "Email Address",
                        style: TextStyle(
                            color: Colors.white, fontSize: width * 0.035),
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.white,
                        size: width * 0.05,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    obscureText: obj.passToggle ? true : false,
                    controller: obj.password,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      label: Text(
                        "Enter Password",
                        style: TextStyle(
                            color: Colors.white, fontSize: width * 0.035),
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.white,
                        size: width * 0.05,
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          if (obj.passToggle == true) {
                            obj.passToggle = false;
                          } else {
                            obj.passToggle = true;
                          }
                          obj.update();
                        },
                        child: obj.passToggle
                            ? const Icon(
                                CupertinoIcons.eye_slash_fill,
                                color: Colors.white,
                              )
                            : const Icon(
                                CupertinoIcons.eye_fill,
                                color: Colors.white,
                              ),
                      ),
                    ),
                    obscuringCharacter: "*",
                    validator: (String? value) {
                      RegExp regex = RegExp(r'^(?=.*?[!@#\$&*~]).{4,}$');
                      if (value!.isEmpty) {
                        return 'Please enter Password';
                      } else {
                        if (value.length < 5) {
                          return ("Password Must be more than 5 characters");
                        } else if (!regex.hasMatch(value)) {
                          return ("Password should contain Special character or number");
                        } else {
                          return null;
                        }
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                InkWell(
                  onTap: () {
                    obj.sinup(context);
                  },
                  child: Container(
                    height: height * 0.07,
                    width: width * 0.92,
                    decoration: BoxDecoration(
                      border:
                          Border.all(width: width * 0.004, color: Colors.white),
                      borderRadius: BorderRadius.circular(width * 0.02),
                      color: const Color(0xff0EBE7F),
                    ),
                    child: Center(
                      child: Text(
                        "SignUp",
                        style: TextStyle(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have account ?",
                      style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AdminSignIn(),
                            ));
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
