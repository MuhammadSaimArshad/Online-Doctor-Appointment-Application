import 'package:doc_bookr/controller/doctorhomescreencontroller.dart';
import 'package:doc_bookr/customwidgets.dart';
import 'package:doc_bookr/model/patientModel.dart';

import 'package:doc_bookr/screen/patient/profile_screen.dart';
import 'package:doc_bookr/staticdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DoctorHomeScreen extends StatefulWidget {
  const DoctorHomeScreen({super.key});

  @override
  State<DoctorHomeScreen> createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  var height, width;

  @override
  void initState() {
    Get.put(DoctorHomeController());
    StaticData.updatedoctorprofile();
    DoctorHomeController.to.getSchedule();
    super.initState();
  }

  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return GetBuilder<DoctorHomeController>(builder: (obj) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: height,
            width: width,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.27,
                  width: width,
                  child: Stack(
                    children: [
                      Container(
                        height: height * 0.25,
                        width: width,
                        decoration: BoxDecoration(
                            color: Color(0xff0EBE7F),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(width * 0.05),
                                bottomRight: Radius.circular(width * 0.05))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ListTile(
                              title: Text(
                                " ${StaticData.doctorModel!.name}",
                                style: TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                "Find the Patient",
                                style: TextStyle(
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              trailing: SizedBox(
                                  height: height * 0.12,
                                  width: width * 0.15,
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        StaticData.doctorModel!.image),
                                  )),
                            )
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: InkWell(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => MYdoctor(),
                            //     ));
                          },
                          child: Container(
                            height: height * 0.06,
                            width: width * 0.85,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(width * 0.02),
                                color: Colors.grey[200],
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: width * 0.01,
                                    spreadRadius: width * 0.01,
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
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: height * 0.15,
                        width: width * 0.3,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: width * 0.01,
                              spreadRadius: width * 0.01,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "${StaticData.doctorModel!.patientList?.length}",
                              style: TextStyle(
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Total Patient",
                              style: TextStyle(
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: height * 0.15,
                        width: width * 0.3,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: width * 0.01,
                              spreadRadius: width * 0.01,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "${obj.schedule}",
                              style: TextStyle(
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Total Schedule",
                              style: TextStyle(
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.03,
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

                //  SizedBox(
                //   height: height * 0.25,
                //   width: width,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       InkWell(
                //         onTap: () {
                //           // Navigator.push(
                //           //     context,
                //           //     MaterialPageRoute(
                //           //       builder: (context) => AppointmentScreen(),
                //           //     ));
                //         },
                //         child: Container(
                //           height: height * 0.23,
                //           width: width * 0.4,
                //           decoration: BoxDecoration(
                //             color: Colors.white,
                //             borderRadius: BorderRadius.circular(10),
                //             boxShadow: [
                //               BoxShadow(
                //                 color: Colors.black12,
                //                 blurRadius: width * 0.03,
                //                 spreadRadius: width * 0.015,
                //               ),
                //             ],
                //           ),
                //           child: Column(
                //             children: [
                //               SizedBox(
                //                 height: height * 0.02,
                //               ),
                //               SizedBox(
                //                   height: height * 0.1,
                //                   width: width * 0.15,
                //                   child: CircleAvatar()),
                //               Text("Muhammad Saim"),
                //               Text("Email"),
                //               Text("03031213123"),
                //             ],
                //           ),
                //         ),
                //       ),
                //       Container(
                //         height: height * 0.23,
                //         width: width * 0.4,
                //         decoration: BoxDecoration(
                //           color: Colors.white,
                //           borderRadius: BorderRadius.circular(10),
                //           boxShadow: [
                //             BoxShadow(
                //               color: Colors.black12,
                //               blurRadius: width * 0.03,
                //               spreadRadius: width * 0.015,
                //             ),
                //           ],
                //         ),
                //         child: Column(
                //           children: [
                //             SizedBox(
                //               height: height * 0.02,
                //             ),
                //             SizedBox(
                //                 height: height * 0.1,
                //                 width: width * 0.15,
                //                 child: CircleAvatar()),
                //             Text("Muhammad Saim"),
                //             Text("Email"),
                //             Text("03031213123"),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Expanded(
                  child: StaticData.doctorModel!.patientList?.length == 0
                      ? SizedBox(
                          height: height * 0.4,
                          child: Center(
                            child: CustomWidget.largeText('No Patient !'),
                          ),
                        )
                      : GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 1.2),
                          itemCount:
                              StaticData.doctorModel!.patientList?.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return StreamBuilder(
                              stream: StaticData.firebase
                                  .collection('patient')
                                  .doc(StaticData
                                      .doctorModel!.patientList?[index])
                                  .snapshots(),
                              builder: (BuildContext context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                if (snapshot.hasError) {
                                  print("Error: /${snapshot.error}");
                                  return Text('Error: /${snapshot.error}');
                                }

                                PatientModel? patientModel =
                                    PatientModel.fromMap(snapshot.data!.data()
                                        as Map<String, dynamic>);

                                return !snapshot.data!.exists
                                    ? Center(
                                        child: CustomWidget.largeText(
                                            'Data not found !'),
                                      )
                                    : InkWell(
                                        onTap: () {
                                          patientModel = PatientModel.fromMap(
                                              snapshot.data!.data()
                                                  as Map<String, dynamic>);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    Profilescreen(
                                                        model: patientModel!),
                                              ));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(8),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black12,
                                                blurRadius: width * 0.01,
                                                spreadRadius: width * 0.01,
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              CircleAvatar(
                                                radius: 35,
                                                backgroundImage: NetworkImage(
                                                    patientModel.image),
                                              ),
                                              Text(
                                                patientModel.name,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: width * 0.04,
                                                  color: Colors.black54,
                                                ),
                                              ),
                                              Text(
                                                patientModel.phonenumber,
                                                style: const TextStyle(
                                                  color: Colors.black45,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                              },
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
