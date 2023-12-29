import 'package:doc_bookr/screen/patient/home/home_navbar_screen.dart';
import 'package:flutter/material.dart';

class Signup_Screen extends StatefulWidget {
  const Signup_Screen({super.key});

  @override
  State<Signup_Screen> createState() => _Signup_ScreenState();
}

class _Signup_ScreenState extends State<Signup_Screen> {
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
                  height: height * 0.03,
                ),
                Container(
                  height: height * 0.15,
                  width: width,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Create A Account",
                        style: TextStyle(
                          fontSize: width * 0.07,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Easy Appointments And Chat with Doctor \n       Personal and Solve Confuseon.",
                        style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
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
                  height: height * 0.02,
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
                          builder: (context) => Home_Navbar_Screen(),
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
                        "Sign Up",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
