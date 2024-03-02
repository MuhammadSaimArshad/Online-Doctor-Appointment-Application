import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorAddReportScreen extends StatefulWidget {
  const DoctorAddReportScreen({super.key});

  @override
  State<DoctorAddReportScreen> createState() => _DoctorAddReportScreenState();
}

class _DoctorAddReportScreenState extends State<DoctorAddReportScreen> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              children: [
                SizedBox(
                  width: width * 0.02,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: width * 0.05,
                  ),
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                Text(
                  "Medical Receipt",
                  style: TextStyle(
                      fontSize: width * 0.05, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: height * 0.15,
            ),
            Image.asset("images/illustration.png"),
            SizedBox(
              height: height * 0.06,
            ),
            Text(
              " Add A Medical Receipt.",
              style: TextStyle(
                  fontSize: width * 0.05, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Text(
              "A detailed medical receipt \n              for Patient.",
              style: TextStyle(
                fontSize: width * 0.04,
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            InkWell(
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
                              color: const Color(0xff0EBE7F),
                              size: width * 0.05,
                            ),
                          ),
                          title: const Text("Camera"),
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
              child: Container(
                height: height * 0.07,
                width: width * 0.6,
                decoration: BoxDecoration(
                    color: Color(0xff0EBE7F),
                    borderRadius: BorderRadius.circular(width * 0.03)),
                child: Center(
                  child: Text(
                    "Add a Receipt",
                    style: TextStyle(
                        fontSize: width * 0.05,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
