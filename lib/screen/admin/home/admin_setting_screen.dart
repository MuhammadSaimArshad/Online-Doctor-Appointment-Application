import 'package:doc_bookr/screen/admin/admin_profile.dart';
import 'package:doc_bookr/screen/admin/home/admin_home_screen.dart';
import 'package:doc_bookr/screen/admin/mypatient_screen.dart';

import 'package:doc_bookr/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminSettingScreen extends StatefulWidget {
  const AdminSettingScreen({super.key});

  @override
  State<AdminSettingScreen> createState() => _AdminSettingScreenState();
}

class _AdminSettingScreenState extends State<AdminSettingScreen> {
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
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.15, left: width * 0.55),
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const ListTile(
                                    title: Text("Profile photo"),
                                  ),
                                  ListTile(
                                    leading: CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Colors.grey[300],
                                      child: Icon(
                                        Icons.add_a_photo,
                                        color: Color(0xff0EBE7F),
                                        size: width * 0.05,
                                      ),
                                    ),
                                    title: Text("Camera"),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    leading: CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Colors.grey.shade300,
                                      child: Icon(
                                        Icons.photo,
                                        color: Color(0xff0EBE7F),
                                        size: width * 0.05,
                                      ),
                                    ),
                                    title: Text("Gallery"),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
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
                          "Dr.Muhammad saim",
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
                    color: Colors.white,
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
                        builder: (context) => AdminProfileScreen(),
                      ));
                },
                leading: Container(
                  padding: EdgeInsets.all(10),
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
                            builder: (context) => AdminProfileScreen(),
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
                        builder: (context) => MYPATIENT(),
                      ));
                },
                leading: Container(
                  padding: EdgeInsets.all(10),
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
                          builder: (context) => MYPATIENT(),
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
                onTap: () {},
                leading: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.deepPurple,
                    size: width * 0.05,
                  ),
                ),
                title: Text(
                  "Notifications",
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
              SizedBox(
                height: height * 0.01,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdminHomeScreen(),
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
                          builder: (context) => AdminHomeScreen(),
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
                onTap: () {},
                leading: Container(
                  padding: EdgeInsets.all(10),
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
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: width * 0.05,
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              ListTile(
                onTap: () {},
                leading: Container(
                  padding: EdgeInsets.all(10),
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
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: width * 0.05,
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              ListTile(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Signup_Screen(),
                    ),
                    (route) => true,
                  );
                },
                leading: Container(
                  padding: EdgeInsets.all(10),
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
