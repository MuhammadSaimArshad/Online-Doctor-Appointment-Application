import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_bookr/customwidgets.dart';
import 'package:doc_bookr/model/DoctorModel.dart';
import 'package:doc_bookr/screen/patient/appointment_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDoctor extends StatefulWidget {
  String? category = "";

  MyDoctor({super.key, this.category});

  @override
  State<MyDoctor> createState() => _MyDoctorState();
}

class _MyDoctorState extends State<MyDoctor> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
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
                    "Find Doctor",
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
                    Icon(Icons.search),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Text(
                      "Search.....",
                      style: TextStyle(fontSize: width * 0.04),
                    ),
                    SizedBox(
                      width: width * 0.46,
                    ),
                    Icon(Icons.cancel_outlined)
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              SizedBox(
                width: width,
                height: height * 0.7,
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('doctor')
                        .snapshots(),
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
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
                              child: CustomWidget.largeText('Data not found !'),
                            )
                          : ListView.builder(
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
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            width: width * 0.01,
                                          ),
                                          Text(doctor!.category,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            width: width * 0.01,
                                          ),
                                          const Text("Experinse",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            width: width * 0.01,
                                          ),
                                          Text("Year.${doctor!.specialty}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold)),
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
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        AppointmentScreen(
                                                      model: doctor!,
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
                                                  "Book Now",
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
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
