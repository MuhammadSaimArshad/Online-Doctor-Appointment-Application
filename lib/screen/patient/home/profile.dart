import 'package:doc_bookr/screen/patient/Patient_About.dart';
import 'package:doc_bookr/screen/patient/Patient_Privacy.dart';
import 'package:doc_bookr/screen/patient/home/home_screen.dart';
import 'package:doc_bookr/screen/patient/mydoctor.dart';

import 'package:doc_bookr/screen/patient/patient_edit_profile_.dart';
import 'package:doc_bookr/screen/patient/Rating.dart';

import 'package:doc_bookr/screen/static_data/staticdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height * 0.25,
                width: width,
                color: Colors.white,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: width * 0.16,
                        backgroundImage:
                            NetworkImage(StaticData.patientmodel!.image),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.15, left: width * 0.55),
                      child: InkWell(
                        onTap: () {},
                        child: const CircleAvatar(
                          backgroundColor: Color(0xff0EBE7F),
                          child: Icon(
                            Icons.photo_camera,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          StaticData.patientmodel!.name,
                          style: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Container(
                height: height * 0.2,
                width: width * 0.9,
                decoration: BoxDecoration(
                    // image: DecorationImage(
                    //     image: AssetImage(
                    //         "images/play_store_512-removebg-preview.png"),
                    //     alignment: Alignment.center),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xff0EBE4f),
                        Color(0xff0EBE7F),
                        // Color(0xffffffff),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(width * 0.05),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: width * 0.01,
                        spreadRadius: 4,
                      ),
                    ]),
                // child: Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text("Easy Appointments ",
                //         style: TextStyle(
                //           fontWeight: FontWeight.bold,
                //           fontSize: width * 0.04,
                //           color: Colors.white,
                //         )),
                //     Text(
                //       "And Chat with Doctor \n Personal and Family \n Solve Health Issue.",
                //       style: TextStyle(
                //         fontSize: width * 0.04,
                //         fontWeight: FontWeight.w400,
                //         color: Colors.white,
                //       ),
                //     )
                //   ],
                // ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PatientEditProfile(),
                      ));
                },
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    CupertinoIcons.person,
                    color: Colors.blue,
                    size: width * 0.05,
                  ),
                ),
                title: Text(
                  "Edit Profile",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: width * 0.05,
                  ),
                ),
                trailing: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PatientEditProfile(),
                          ));
                    },
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: width * 0.05,
                    )),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyDoctor(),
                      ));
                },
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.green[200],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person,
                    color: Colors.green,
                    size: width * 0.05,
                  ),
                ),
                title: Text(
                  "My Doctor",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: width * 0.05,
                  ),
                ),
                trailing: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyDoctor(),
                        ));
                  },
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: width * 0.05,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              // ListTile(
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => const NotificationScreen(),
              //         ));
              //   },
              //   leading: Container(
              //     padding: const EdgeInsets.all(10),
              //     decoration: BoxDecoration(
              //       color: Colors.deepPurple.shade100,
              //       shape: BoxShape.circle,
              //     ),
              //     child: Icon(
              //       Icons.notifications_none_outlined,
              //       color: Colors.deepPurple,
              //       size: width * 0.05,
              //     ),
              //   ),
              //   title: Text(
              //     "Notifications",
              //     style: TextStyle(
              //       fontWeight: FontWeight.w500,
              //       fontSize: width * 0.05,
              //     ),
              //   ),
              //   trailing: InkWell(
              //     onTap: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => const NotificationScreen(),
              //           ));
              //     },
              //     child: Icon(
              //       Icons.arrow_forward_ios_rounded,
              //       size: width * 0.05,
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: height * 0.01,
              // ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                },
                leading: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.red[200],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.home,
                    color: Colors.redAccent,
                    size: width * 0.05,
                  ),
                ),
                title: Text(
                  "Home",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: width * 0.05,
                  ),
                ),
                trailing: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ));
                  },
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: width * 0.05,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RatingScreen(),
                      ));
                },
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.feedback_outlined,
                    color: Colors.indigo,
                    size: width * 0.05,
                  ),
                ),
                title: Text(
                  "FeedBack",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: width * 0.05,
                  ),
                ),
                trailing: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RatingScreen(),
                        ));
                  },
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: width * 0.05,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PatientPrivacy(),
                      ));
                },
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.pink.shade200,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.privacy_tip_outlined,
                    color: Colors.pink,
                    size: width * 0.05,
                  ),
                ),
                title: Text(
                  "Privacy",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: width * 0.05,
                  ),
                ),
                trailing: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PatientPrivacy(),
                        ));
                  },
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: width * 0.05,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PatientAbout(),
                      ));
                },
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.info_outline_rounded,
                    color: Colors.orange,
                    size: width * 0.05,
                  ),
                ),
                title: Text(
                  "About Us",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: width * 0.05,
                  ),
                ),
                trailing: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PatientAbout(),
                        ));
                  },
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: width * 0.05,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              ListTile(
                onTap: () {
                  StaticData.logout(context);
                },
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.redAccent.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.logout,
                    color: Colors.redAccent,
                    size: width * 0.05,
                  ),
                ),
                title: Text(
                  "Log Out",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: width * 0.05,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: width * 0.05,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
