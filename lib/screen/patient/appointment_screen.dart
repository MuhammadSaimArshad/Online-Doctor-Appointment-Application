// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:doc_bookr/model/DoctorModel.dart';
import 'package:doc_bookr/screen/patient/book_appointment.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppointmentScreen extends StatefulWidget {
  final DoctorModel model;
  const AppointmentScreen({
    Key? key,
    required this.model,
  }) : super(key: key);
  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: height * 0.3,
              width: width,
              color: const Color(0xff0EBE7F),
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width * 0.01,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: width * 0.05,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  CircleAvatar(
                    radius: width * 0.07,
                    backgroundImage: NetworkImage(widget.model.image),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(
                    "${widget.model.name}",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: width * 0.03,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(
                    "${widget.model.category}",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: width * 0.03,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Container(
                    height: height * 0.05,
                    width: width * 0.3,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        CupertinoIcons.chat_bubble_text_fill,
                        color: const Color(0xff0EBE7F),
                        size: width * 0.06,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: height * 0.5,
              width: width,
              color: Colors.white,
              child: Column(
                children: [
                  Text(
                    "About Doctor",
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(
                    "${widget.model.bio}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: width * 0.03,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      Text(
                        "Reviews",
                        style: TextStyle(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.15,
                  ),
                  Text(
                    "Location",
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Color(0xFFF0EEFA),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.location_on,
                        color: const Color(0xff0EBE7F),
                        size: width * 0.06,
                      ),
                    ),
                    title: const Text(
                      "Location",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "${widget.model.address}",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(15),
        height: height * 0.17,
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ]),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Consultation Price",
                  style: TextStyle(
                    color: Colors.black45,
                  ),
                ),
                Text(
                  "${"${widget.model.fee}"}",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: width * 0.04,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => bookappointment(),
                    ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: const Color(0xff0EBE7F),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Book Appointment",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  DateTime microsecondsSinceEpochToDateTime(int microsecondsSinceEpoch) {
    return DateTime.fromMicrosecondsSinceEpoch(microsecondsSinceEpoch);
  }
}
