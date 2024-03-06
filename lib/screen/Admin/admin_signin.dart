import 'package:doc_bookr/screen/Admin/Admin_home_navbar.dart';
import 'package:flutter/material.dart';

class AdminSignIn extends StatefulWidget {
  const AdminSignIn({super.key});

  @override
  State<AdminSignIn> createState() => _AdminSignInState();
}

class _AdminSignInState extends State<AdminSignIn> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
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
                    // controller: obj.email,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Email Address"),
                      prefixIcon: Icon(Icons.email),
                    ),
                    // validator: (String? value) {
                    //   if (value!.isEmpty) {
                    //     return 'Please enter your E-mail';
                    //   } else if (EmailValidator.validate(obj.email.text) ==
                    //       false) {
                    //     return 'Please Enter Correct E-mail';
                    //   }
                    //   return null;
                    // },
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
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
                  height: height * 0.03,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminHomeNavbarScreen(),
                        ));
                  },
                  child: Container(
                    height: height * 0.07,
                    width: width * 0.9,
                    decoration: BoxDecoration(
                      border:
                          Border.all(width: width * 0.004, color: Colors.white),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
