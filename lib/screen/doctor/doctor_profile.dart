import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorProfileScreen extends StatefulWidget {
  const DoctorProfileScreen({super.key});

  @override
  State<DoctorProfileScreen> createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.01,
              ),
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
                          "Muhammad saim",
                          style: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
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
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextFormField(
                  decoration: InputDecoration(
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
                  decoration: InputDecoration(
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
                height: height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextFormField(
                  decoration: InputDecoration(
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
              Container(
                height: height * 0.07,
                width: width * 0.9,
                decoration: BoxDecoration(
                    color: Color(0xff0EBE7F),
                    borderRadius: BorderRadius.circular(width * 0.03)),
                child: Center(
                  child: Text(
                    "UpDate ",
                    style: TextStyle(
                        fontSize: width * 0.05,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
