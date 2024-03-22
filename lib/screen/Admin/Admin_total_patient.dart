import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:doc_bookr/controller/Admin/Admin_Total_Pati_Controller.dart';
import 'package:doc_bookr/customwidgets.dart';
import 'package:doc_bookr/model/Patient_Model.dart';
import 'package:doc_bookr/screen/patient/profile_screen.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TotalPatient extends StatefulWidget {
  const TotalPatient({super.key});

  @override
  State<TotalPatient> createState() => _TotalPatientState();
}

class _TotalPatientState extends State<TotalPatient> {
  var height, width;

  @override
  void initState() {
    Get.put(AdminTotalPatiController());

    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return GetBuilder<AdminTotalPatiController>(builder: (obj) {
      return SafeArea(
        child: Scaffold(
          body: SizedBox(
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
                      "Total Patient",
                      style: TextStyle(
                          fontSize: width * 0.05, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Container(
                  height: height * 0.06,
                  width: width * 0.85,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.02),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: width * 0.01,
                          spreadRadius: width * 0.005,
                        ),
                      ]),
                  child: Row(
                    children: [
                      SizedBox(
                        width: width * 0.03,
                      ),
                      const Icon(Icons.search),
                      Expanded(
                          child: TextFormField(
                        controller: obj.search,
                        onChanged: (value) {
                          obj.updateQure(value);
                        },
                        decoration: const InputDecoration(
                            hintText: "Search.....", border: InputBorder.none),
                      )),
                      const Icon(Icons.cancel_outlined),
                      SizedBox(
                        width: width * 0.03,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.06,
                    ),
                    Text(
                      "All Patient",
                      style: TextStyle(
                          fontSize: width * 0.05, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Expanded(
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('patient')
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

                        PatientModel? patient;
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
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  patient = PatientModel.fromMap(
                                      snapshot.data!.docs[index].data());
                                  if (obj.search.text.isNotEmpty) {
                                    if (patient!.name
                                        .toString()
                                        .toLowerCase()
                                        .contains(obj.search.text.toString())) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: height * 0.25,
                                          width: width * 0.95,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                                width * 0.05),
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
                                                  patient!.name,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                subtitle: Text(
                                                    patient!.phonenumber,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                trailing: CircleAvatar(
                                                  radius: width * 0.08,
                                                  backgroundImage: NetworkImage(
                                                      patient!.image),
                                                ),
                                              ),
                                              const Divider(),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: width * 0.03,
                                                  ),
                                                  const Text("Gmail",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  SizedBox(
                                                    width: width * 0.01,
                                                  ),
                                                  Text(patient!.email,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  SizedBox(
                                                    width: width * 0.01,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: height * 0.015,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      obj.deletePatient(snapshot
                                                          .data!
                                                          .docs[index]
                                                          .id);
                                                    },
                                                    child: Container(
                                                      height: height * 0.066,
                                                      width: width * 0.35,
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xff0EBE7F),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    width *
                                                                        0.02),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "Delete",
                                                          style: TextStyle(
                                                              fontSize:
                                                                  width * 0.04,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      patient =
                                                          PatientModel.fromMap(
                                                              snapshot.data!
                                                                  .docs[index]
                                                                  .data());
                                                      print(
                                                          "doctor dataaa$patient");
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                Profilescreen(
                                                              patientModel:
                                                                  patient,
                                                            ),
                                                          ));
                                                    },
                                                    child: Container(
                                                      height: height * 0.066,
                                                      width: width * 0.35,
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xff0EBE7F),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    width *
                                                                        0.02),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          "Edit Profile",
                                                          style: TextStyle(
                                                              fontSize:
                                                                  width * 0.04,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    } else {
                                      return Container(
                                        color: Colors.white,
                                      );
                                    }
                                  } else {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: height * 0.25,
                                        width: width * 0.95,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              width * 0.05),
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
                                                patient!.name,
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              subtitle: Text(
                                                  patient!.phonenumber,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              trailing: CircleAvatar(
                                                radius: width * 0.08,
                                                backgroundImage: NetworkImage(
                                                    patient!.image),
                                              ),
                                            ),
                                            const Divider(),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: width * 0.03,
                                                ),
                                                const Text("Gmail",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                SizedBox(
                                                  width: width * 0.01,
                                                ),
                                                Text(patient!.email,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                            SizedBox(
                                              height: height * 0.015,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    obj.deletePatient(snapshot
                                                        .data!.docs[index].id);
                                                  },
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
                                                        "Delete",
                                                        style: TextStyle(
                                                            fontSize:
                                                                width * 0.04,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    patient =
                                                        PatientModel.fromMap(
                                                            snapshot.data!
                                                                .docs[index]
                                                                .data());
                                                    print(
                                                        "doctor dataaa$patient");
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              Profilescreen(
                                                            patientModel:
                                                                patient,
                                                          ),
                                                        ));
                                                  },
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
                                                        "Edit Profile",
                                                        style: TextStyle(
                                                            fontSize:
                                                                width * 0.04,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                },
                              );
                      }),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
