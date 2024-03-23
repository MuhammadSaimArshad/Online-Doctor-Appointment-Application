import 'package:doc_bookr/controller/Admin/Admin_Signup_controller.dart';

import 'package:doc_bookr/screen/Admin/Admin_Signup_Login/admin_signin.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
                SizedBox(
                  height: height * 0.02,
                ),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
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
                    ],
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
                    width: width * 0.9,
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
                        "SignIn",
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
