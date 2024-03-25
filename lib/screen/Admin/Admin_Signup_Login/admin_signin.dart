import 'package:doc_bookr/controller/Admin/Admin_Signin_Controller.dart';

import 'package:doc_bookr/screen/Admin/Admin_Signup_Login/admin_signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

class AdminSignIn extends StatefulWidget {
  const AdminSignIn({super.key});

  @override
  State<AdminSignIn> createState() => _AdminSignInState();
}

class _AdminSignInState extends State<AdminSignIn> {
  var height, width;
  @override
  void initState() {
    Get.put(AdminLoginController());
    super.initState();
  }

  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return GetBuilder<AdminLoginController>(builder: (obj) {
      return SafeArea(
        child: Scaffold(
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
                      controller: obj.email,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
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
                      obj.login(context);
                    },
                    child: Container(
                      height: height * 0.07,
                      width: width * 0.9,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: width * 0.004, color: Colors.white),
                        borderRadius: BorderRadius.circular(width * 0.02),
                        color: const Color(0xff0EBE7F),
                      ),
                      child: Center(
                        child: Text(
                          "SignIn",
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
                    children: [
                      SizedBox(
                        width: width * 0.05,
                      ),
                      Text(
                        "Don't have any account?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.05,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AdminSignup(),
                              ));
                        },
                        child: Text(
                          "Create Account",
                          style: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
