import 'package:doc_bookr/screen/doctor/Doctor_Home/dcotor_home_navbar.dart';
import 'package:doc_bookr/screen/doctor/doctor_edit_profile.dart';

import 'package:doc_bookr/screen/doctor/mypatient_screen.dart';

import 'package:doc_bookr/screen/patient/Patient_Privacy.dart';

import 'package:doc_bookr/screen/static_data/staticdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorProfile extends StatefulWidget {
  const DoctorProfile({super.key});

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
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
                        radius: width * 0.15,
                        backgroundImage:
                            NetworkImage(StaticData.doctorModel!.image),
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
                          StaticData.doctorModel!.name,
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
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xff0EBE4f),
                        Color(0xff0EBE7F),
                        Color(0xffffffff),
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
              ),
              SizedBox(
                height: height * 0.05,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DoctorEditProfile(),
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
                            builder: (context) => const DoctorEditProfile(),
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
                        builder: (context) => const MYPATIENT(),
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
                  "My Patient",
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
                          builder: (context) => const MYPATIENT(),
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
              //   onTap: () {},
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
              //   trailing: Icon(
              //     Icons.arrow_forward_ios_rounded,
              //     size: width * 0.05,
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
                        builder: (context) => const DoctorHomeNavbar(),
                      ));
                },
                leading: Container(
                  padding: const EdgeInsets.all(10),
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
                          builder: (context) => const DoctorHomeNavbar(),
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
                    color: Colors.indigo.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.privacy_tip_outlined,
                    color: Colors.indigo,
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
              // ListTile(
              //   onTap: () {},
              //   leading: Container(
              //     padding: EdgeInsets.all(10),
              //     decoration: BoxDecoration(
              //       color: Colors.orange.shade100,
              //       shape: BoxShape.circle,
              //     ),
              //     child: Icon(
              //       Icons.info_outline_rounded,
              //       color: Colors.orange,
              //       size: width * 0.05,
              //     ),
              //   ),
              //   title: Text(
              //     "About Us",
              //     style: TextStyle(
              //       fontWeight: FontWeight.w500,
              //       fontSize: width * 0.05,
              //     ),
              //   ),
              //   trailing: Icon(
              //     Icons.arrow_forward_ios_rounded,
              //     size: width * 0.05,
              //   ),
              // ),
              // SizedBox(
              //   height: height * 0.01,
              // ),
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
