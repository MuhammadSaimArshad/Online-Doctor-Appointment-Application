import 'package:doc_bookr/controller/Admin_Signin_Controller.dart';

import 'package:doc_bookr/screen/Admin/admin_signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                  ],
                ),
              ),
              child: Column(
                children: [
                  // SizedBox(
                  //   height: height * 0.35,
                  //   width: width,
                  //   child: Stack(
                  //     children: [
                  //       Container(
                  //         height: height * 0.35,
                  //         width: width,
                  //         decoration: BoxDecoration(
                  //             color: Color(0xff0EBE7F),
                  //             borderRadius: BorderRadius.only(
                  //                 bottomLeft: Radius.circular(width * 0.05),
                  //                 bottomRight: Radius.circular(width * 0.05))),
                  //       ),
                  //       Container(
                  //         height: height * 0.3,
                  //         width: width,
                  //         decoration: BoxDecoration(
                  //             color: Color.fromARGB(255, 59, 219, 163),
                  //             borderRadius: BorderRadius.only(
                  //                 bottomLeft: Radius.circular(width * 0.05),
                  //                 bottomRight: Radius.circular(width * 0.05))),
                  //       ),
                  //       Container(
                  //         height: height * 0.25,
                  //         width: width,
                  //         decoration: BoxDecoration(
                  //             color: Color(0xff0EBE7F),
                  //             borderRadius: BorderRadius.only(
                  //                 bottomLeft: Radius.circular(width * 0.05),
                  //                 bottomRight: Radius.circular(width * 0.05))),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  SizedBox(
                    height: height * 0.3,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: TextFormField(
                      controller: obj.email,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
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
                        color: Color(0xff0EBE7F),
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
