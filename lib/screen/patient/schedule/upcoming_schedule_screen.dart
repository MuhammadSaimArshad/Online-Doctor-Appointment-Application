import 'package:doc_bookr/screen/custom_widgets/customwidgets.dart';
import 'package:doc_bookr/model/Appointment_Model.dart';
import 'package:doc_bookr/screen/static_data/staticdata.dart';
import 'package:flutter/material.dart';

class UpcomingSchedule extends StatefulWidget {
  const UpcomingSchedule({Key? key}) : super(key: key);

  @override
  State<UpcomingSchedule> createState() => _UpcomingScheduleState();
}

class _UpcomingScheduleState extends State<UpcomingSchedule> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SizedBox(
        height: height * 0.65,
        width: width,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: StreamBuilder(
                stream: StaticData.firebase
                    .collection('appointment')
                    .where("patientid", isEqualTo: StaticData.patientmodel!.id)
                    .where("status", isEqualTo: 1)
                    .snapshots(),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    print("Error: /${snapshot.error}");
                    return Text('Error: /${snapshot.error}');
                  }

                  AppointmentModel? model;
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
                            model = AppointmentModel.fromMap(
                                snapshot.data!.docs[index].data());
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 3),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: width * 0.02,
                                      spreadRadius: width * 0.001,
                                    ),
                                  ],
                                ),
                                child: SizedBox(
                                  height: height * 0.3,
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text(
                                          "Dr.${model!.doctername}",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        subtitle: Text(model!.bio),
                                        trailing: CircleAvatar(
                                          radius: 25,
                                          backgroundImage:
                                              NetworkImage(model!.imagedoc),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Divider(
                                          thickness: width * 0.002,
                                          height: height * 0.01,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              const Icon(
                                                Icons.calendar_month,
                                                color: Colors.black54,
                                              ),
                                              SizedBox(
                                                width: width * 0.03,
                                              ),
                                              Text(
                                                StaticData
                                                    .formatMicrosecondsSinceEpoch(
                                                        model!.createdtime),
                                                style: const TextStyle(
                                                  color: Colors.black54,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              const Icon(
                                                Icons.access_time_filled,
                                                color: Colors.black54,
                                              ),
                                              SizedBox(
                                                width: width * 0.03,
                                              ),
                                              Text(
                                                model!.time,
                                                style: const TextStyle(
                                                  color: Colors.black54,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(5),
                                                decoration: const BoxDecoration(
                                                    color: Colors.green,
                                                    shape: BoxShape.circle),
                                              ),
                                              SizedBox(
                                                width: width * 0.03,
                                              ),
                                              const Text(
                                                "Pending",
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: height * 0.04,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              model = AppointmentModel.fromMap(
                                                  snapshot.data!.docs[index]
                                                      .data());
                                              StaticData.firebase
                                                  .collection("appointment")
                                                  .doc(model!.id)
                                                  .update({"status": 0});
                                              StaticData.getdoctortokken(
                                                      model!.doctorid)
                                                  .then((value) {
                                                StaticData.sendNotifcation(
                                                    "Appointment cencal",
                                                    "${model!.patientname} Cencal Appointment at ${model!.time}",
                                                    value);
                                              });
                                              StaticData.firebase
                                                  .collection("slots")
                                                  .doc(model!.doctorid)
                                                  .collection("slots")
                                                  .doc(model!.slotsid)
                                                  .update(
                                                      {"isAvailable": true});
                                            },
                                            child: Container(
                                              width: 150,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 12),
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF4F6FA),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Cancel",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: width * 0.04,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          // InkWell(
                                          //   onTap: () {},
                                          //   child: Container(
                                          //     width: 150,
                                          //     padding: EdgeInsets.symmetric(
                                          //         vertical: 12),
                                          //     decoration: BoxDecoration(
                                          //       color: Color(0xFF7165D6),
                                          //       borderRadius:
                                          //           BorderRadius.circular(10),
                                          //     ),
                                          //     child: Center(
                                          //       child: Text(
                                          //         "Reschedule",
                                          //         style: TextStyle(
                                          //           fontWeight: FontWeight.w500,
                                          //           fontSize: 16,
                                          //           color: Colors.white,
                                          //         ),
                                          //       ),
                                          //     ),
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                })));
  }
}
