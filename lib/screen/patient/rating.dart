// ignore_for_file: override_on_non_overriding_member

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_bookr/customwidgets.dart';
import 'package:doc_bookr/model/DoctorModel.dart';

import 'package:flutter/material.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double fullrating = 0;

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
              SizedBox(
                height: height * 0.02,
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
                      size: width * 0.04,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Text(
                    "Rating And Feedback",
                    style: TextStyle(
                      fontSize: width * 0.04,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SizedBox(
                  width: width,
                  height: height * 0.7,
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('doctor')
                          .snapshots(),
                      builder: (BuildContext context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }

                        if (snapshot.hasError) {
                          print("Error: /${snapshot.error}");
                          return Text('Error: /${snapshot.error}');
                        }

                        DoctorModel? doctor;
                        if (snapshot.data!.docs.length != 0) {
                          print(
                              'snapshot.data!.docs.length/${snapshot.data!.docs.length}');
                        }

                        return snapshot.data!.docs.length == 0 &&
                                snapshot.data!.docs.isEmpty
                            ? Center(
                                child:
                                    CustomWidget.largeText('Data not found !'),
                              )
                            : ListView.builder(
                                padding: EdgeInsets.all(8.0),
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  doctor = DoctorModel.fromMap(
                                      snapshot.data!.docs[index].data()
                                          as Map<String, dynamic>);
                                  return Container(
                                    height: height * 0.25,
                                    width: width * 0.95,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(width * 0.05),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: width * 0.02,
                                          spreadRadius: width * 0.01,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: height * 0.01,
                                        ),
                                        ListTile(
                                          title: Text(
                                            "Dr.${doctor!.name}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          subtitle: Text(doctor!.bio,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          trailing: CircleAvatar(
                                            radius: width * 0.08,
                                            backgroundImage:
                                                NetworkImage(doctor!.image),
                                          ),
                                        ),
                                        const Divider(),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: width * 0.03,
                                            ),
                                            const Text("Specialist",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            SizedBox(
                                              width: width * 0.01,
                                            ),
                                            Text(doctor!.category,
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            SizedBox(
                                              width: width * 0.01,
                                            ),
                                            const Text("Experinse",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            SizedBox(
                                              width: width * 0.01,
                                            ),
                                            Text("Year.${doctor!.specialty}",
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            SizedBox(
                                              width: width * 0.01,
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                  size: width * 0.04,
                                                ),
                                                Text(
                                                  "${(doctor!.totalrating / doctor!.ratingperson).isNaN ? "0" : (doctor!.totalrating / doctor!.ratingperson)}",
                                                  style: TextStyle(
                                                      color: Colors.black45,
                                                      fontSize: width * 0.03),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: height * 0.015,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              child: Container(
                                                height: height * 0.066,
                                                width: width * 0.35,
                                                decoration: BoxDecoration(
                                                  color: Color(0xff0EBE7F),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          width * 0.02),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "Rating",
                                                    style: TextStyle(
                                                        fontSize: width * 0.04,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
