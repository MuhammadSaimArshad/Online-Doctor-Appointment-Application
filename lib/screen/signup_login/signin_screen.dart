import 'package:doc_bookr/controller/Login_Controller.dart';
import 'package:doc_bookr/screen/Admin/Admin_Signup_Login/admin_signin.dart';

import 'package:doc_bookr/screen/signup_login/signup_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  var height, width;
  @override
  void initState() {
    Get.put(LoginController());
    super.initState();
  }

  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<LoginController>(builder: (obj) {
          return Container(
            height: height,
            width: width,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AdminSignIn(),
                            ));
                      },
                      child: Text(
                        "Admin",
                        style: TextStyle(
                          fontSize: width * 0.03,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.04,
                    ),
                  ]),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Container(
                    height: height * 0.15,
                    width: width,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Wellcome Back",
                          style: TextStyle(
                            fontSize: width * 0.07,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Choose The Best Doctor \n            In Your Area.",
                          style: TextStyle(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.005,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          obj.updateindex(0);
                        },
                        child: Container(
                            height: height * 0.15,
                            width: width * 0.3,
                            decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius:
                                    BorderRadius.circular(width * 0.02),
                                border: Border.all(
                                    width: width * 0.005,
                                    color: obj.index == 0
                                        ? const Color(0xff0EBE7F)
                                        : Colors.grey)),
                            child: Column(
                              children: [
                                Image(
                                    height: height * 0.11,
                                    image: const AssetImage(
                                        "images/doctor_logo.png")),
                                const Text("Doctor")
                              ],
                            )),
                      ),
                      InkWell(
                        onTap: () {
                          obj.updateindex(1);
                        },
                        child: Container(
                            height: height * 0.15,
                            width: width * 0.3,
                            decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius:
                                    BorderRadius.circular(width * 0.02),
                                border: Border.all(
                                    width: width * 0.005,
                                    color: obj.index == 1
                                        ? const Color(0xff0EBE7F)
                                        : Colors.grey)),
                            child: Column(
                              children: [
                                Image(
                                    height: height * 0.11,
                                    image: const AssetImage(
                                        "images/patient_logo.png")),
                                const Text("Patient")
                              ],
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: TextFormField(
                      controller: obj.email,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Email Address"),
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your E-mail';
                        } else if (EmailValidator.validate(obj.email.text) ==
                            false) {
                          return 'Please Enter Correct E-mail';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: TextFormField(
                      obscureText: obj.passToggle ? true : false,
                      controller: obj.password,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        label: const Text("Enter Password"),
                        prefixIcon: const Icon(Icons.lock),
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
                              ? const Icon(CupertinoIcons.eye_slash_fill)
                              : const Icon(CupertinoIcons.eye_fill),
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
                    height: height * 0.01,
                  ),
                  InkWell(
                    onTap: () {
                      obj.index == 0
                          ? obj.signInWithEmailAndPassword(context)
                          : obj.signInWithEmailAndPassword1(context);
                    },
                    child: Container(
                      height: height * 0.07,
                      width: width * 0.9,
                      decoration: BoxDecoration(
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Forget Password",
                        style: TextStyle(
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff0EBE7F)),
                      ),
                    ],
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
                                builder: (context) => const SignupScreen(),
                              ));
                        },
                        child: Text(
                          "Create Account",
                          style: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff0EBE7F)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
