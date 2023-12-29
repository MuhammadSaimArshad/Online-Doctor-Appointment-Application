import 'package:doc_bookr/screen/admin/home/admin_home_navbar.dart';

import 'package:flutter/material.dart';

class Signin_screen extends StatefulWidget {
  const Signin_screen({super.key});

  @override
  State<Signin_screen> createState() => _Signin_screenState();
}

class _Signin_screenState extends State<Signin_screen> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.04,
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
                        // obj.updateindex(0);
                      },
                      child: Container(
                          height: height * 0.15,
                          width: width * 0.3,
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(width * 0.02),
                              border: Border.all(
                                  width: width * 0.005,
                                  color: Color(0xff0EBE7F))),
                          child: Column(
                            children: [
                              Image(
                                  height: height * 0.11,
                                  image: AssetImage("images/doctor_logo.png")),
                              Text("Doctor")
                            ],
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        // obj.updateindex(1);
                      },
                      child: Container(
                          height: height * 0.15,
                          width: width * 0.3,
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(width * 0.02),
                              border: Border.all(
                                  width: width * 0.005,
                                  color: Color(0xff0EBE7F))),
                          child: Column(
                            children: [
                              Image(
                                  height: height * 0.11,
                                  image: AssetImage("images/patient_logo.png")),
                              Text("Patient")
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
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Full Name"),
                      prefixIcon: Icon(Icons.person_outline),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("E Mail"),
                      prefixIcon: Icon(Icons.person_outline),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Password"),
                      prefixIcon: Icon(Icons.person_outline),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminHomeNavbar(),
                        ));
                  },
                  child: Container(
                    height: height * 0.07,
                    width: width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.02),
                      color: Color(0xff0EBE7F),
                    ),
                    child: Center(
                      child: Text(
                        "Sign In",
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
                          color: Color(0xff0EBE7F)),
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
                    Text(
                      "Create Account",
                      style: TextStyle(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff0EBE7F)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
