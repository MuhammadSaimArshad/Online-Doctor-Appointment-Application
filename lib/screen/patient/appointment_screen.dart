// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_bookr/customwidgets.dart';

import 'package:doc_bookr/model/Appointment_Model.dart';
import 'package:doc_bookr/model/Doctor_Model.dart';
import 'package:doc_bookr/model/Patient_Model.dart';
import 'package:doc_bookr/screen/doctor/message/chatscreen.dart';
import 'package:doc_bookr/screen/patient/book_appointment.dart';
import 'package:doc_bookr/staticdata.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_time_ago/get_time_ago.dart';

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

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: height,
          width: width,
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
                            size: width * 0.04,
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
                      "Dr.${widget.model.name}",
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
                      widget.model.category,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: width * 0.03,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    InkWell(
                      onTap: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatScreen(
                                  image: widget.model.image,
                                  name: widget.model.name,
                                  id: widget.model.id,
                                  current: StaticData.patientmodel!.id,
                                  currentimage: StaticData.patientmodel!.image,
                                  tokken: widget.model.token,
                                  currentname: StaticData.patientmodel!.name),
                            ));
                        try {
                          DocumentSnapshot doctorSnapshot = await StaticData
                              .firebase
                              .collection("doctor")
                              .doc(widget.model.id)
                              .get();
                          DoctorModel model = DoctorModel.fromMap(
                              doctorSnapshot.data() as Map<String, dynamic>);
                          if (!model.patientList!.contains(
                            StaticData.patientmodel!.id,
                          )) {
                            StaticData.firebase
                                .collection("doctor")
                                .doc(widget.model.id)
                                .update({
                              "patientList": FieldValue.arrayUnion(
                                  [StaticData.patientmodel!.id])
                            });
                          } else {
                            print("id presnt");
                          }

                          /////////
                          DocumentSnapshot snapshot = await StaticData.firebase
                              .collection("patient")
                              .doc(StaticData.patientmodel!.id)
                              .get();
                          PatientModel model1 = PatientModel.fromMap(
                              snapshot.data() as Map<String, dynamic>);
                          if (!model1.doctorList!.contains(widget.model.id)) {
                            StaticData.firebase
                                .collection("patient")
                                .doc(StaticData.patientmodel!.id)
                                .update({
                              "doctorList":
                                  FieldValue.arrayUnion([widget.model.id])
                            });
                          } else {
                            print("id presnt");
                          }
                        } catch (e) {}
                      },
                      child: Container(
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
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: height,
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
                        height: height * 0.005,
                      ),
                      Text(
                        widget.model.bio,
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
                          SizedBox(
                            width: width * 0.03,
                          ),
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
                          height: height * 0.22,
                          child: StreamBuilder(
                              stream: StaticData.firebase
                                  .collection('appointment')
                                  .where("doctorid", isEqualTo: widget.model.id)
                                  .snapshots(),
                              builder: (BuildContext context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }

                                if (snapshot.hasError) {
                                  print("Error: /${snapshot.error}");
                                  return Text('Error: /${snapshot.error}');
                                }

                                AppointmentModel? appointmentModel;
                                if (snapshot.data!.docs.length != 0) {
                                  print(
                                      'snapshot.data!.docs.length/${snapshot.data!.docs.length}');
                                }
                                return snapshot.data!.docs.length == 0 &&
                                        snapshot.data!.docs.isEmpty
                                    ? Center(
                                        child: CustomWidget.largeText(
                                            'Data not found !'),
                                      )
                                    : ListView.builder(
                                        itemCount: snapshot.data!.docs.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          appointmentModel =
                                              AppointmentModel.fromMap(snapshot
                                                  .data!.docs[index]
                                                  .data());
                                          return Container(
                                            width: width * 0.7,
                                            height: height * 0.2,
                                            margin: const EdgeInsets.all(10),
                                            padding: EdgeInsets.symmetric(
                                                vertical: height * 0.01),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black12,
                                                  blurRadius: width * 0.2,
                                                  spreadRadius: width * 0.02,
                                                ),
                                              ],
                                            ),
                                            child: SizedBox(
                                              width: width * 0.1,
                                              height: height * 0.2,
                                              child: Column(
                                                children: [
                                                  ListTile(
                                                    leading: CircleAvatar(
                                                      radius: 30,
                                                      backgroundImage:
                                                          NetworkImage(widget
                                                              .model.image),
                                                    ),
                                                    title: Text(
                                                      appointmentModel!
                                                          .doctername,
                                                      style: TextStyle(
                                                        fontSize: width * 0.03,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    subtitle: Text(GetTimeAgo.parse(
                                                            microsecondsSinceEpochToDateTime(
                                                                appointmentModel!
                                                                    .createdtime))
                                                        .toString()),
                                                  ),
                                                  SizedBox(
                                                    height: height * 0.01,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                height * 0.01),
                                                    child: Text(
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      appointmentModel!.bio,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: width * 0.03,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                              })),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.03,
                          ),
                          Text(
                            "Location",
                            style: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
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
                          widget.model.address,
                        ),
                      ),
                    ],
                  ),
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
                    "${widget.model.fee}",
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
                          builder: (context) => Calender(
                                model: widget.model,
                              )));
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
      ),
    );
  }

  DateTime microsecondsSinceEpochToDateTime(int microsecondsSinceEpoch) {
    return DateTime.fromMicrosecondsSinceEpoch(microsecondsSinceEpoch);
  }
}
