import 'package:doc_bookr/customwidgets.dart';
import 'package:doc_bookr/model/Appointment_Model.dart';
import 'package:doc_bookr/staticdata.dart';
import 'package:flutter/material.dart';

class DoctorUpcomingSchedule extends StatefulWidget {
  const DoctorUpcomingSchedule({Key? key}) : super(key: key);

  @override
  State<DoctorUpcomingSchedule> createState() => _DoctorUpcomingScheduleState();
}

class _DoctorUpcomingScheduleState extends State<DoctorUpcomingSchedule> {
  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SizedBox(
        height: height * 0.65,
        width: width,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: height * 0.01),
            child: StreamBuilder(
                stream: StaticData.firebase
                    .collection('appointment')
                    .where("doctorid", isEqualTo: StaticData.doctorModel!.id)
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
                                padding: EdgeInsets.symmetric(
                                    vertical: height * 0.01),
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
                                  height: height * 0.24,
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text(
                                          model!.patientname,
                                          style: TextStyle(
                                            fontSize: width * 0.04,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        subtitle: Text(model!.phonenumber),
                                        trailing: CircleAvatar(
                                          radius: width * 0.04,
                                          backgroundImage:
                                              NetworkImage(model!.image),
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
                                                width: width * 0.01,
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
                                                width: width * 0.02,
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
                                                padding:
                                                    const EdgeInsets.all(5),
                                                decoration: const BoxDecoration(
                                                    color: Colors.green,
                                                    shape: BoxShape.circle),
                                              ),
                                              SizedBox(
                                                width: width * 0.02,
                                              ),
                                              Text(
                                                "Pending",
                                                style: TextStyle(
                                                  fontSize: width * 0.04,
                                                  color: Colors.black54,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: height * 0.01,
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
                                              StaticData.getpatienttokken(
                                                      model!.patientid)
                                                  .then((value) {
                                                StaticData.sendNotifcation(
                                                    "Appointment cencal",
                                                    "${model!.doctername} cencal your appointment at ${model!.time}",
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
                                              height: height * 0.06,
                                              width: width * 0.35,
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
                                                    fontSize: height * 0.03,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              model = AppointmentModel.fromMap(
                                                  snapshot.data!.docs[index]
                                                      .data());
                                              StaticData.firebase
                                                  .collection("appointment")
                                                  .doc(model!.id)
                                                  .update({"status": 2});
                                              StaticData.getpatienttokken(
                                                      model!.patientid)
                                                  .then((value) {
                                                StaticData.sendNotifcation(
                                                    "Appointment",
                                                    "${model!.doctername} Confirm your appointment at ${model!.time}",
                                                    value);
                                              });
                                            },
                                            child: Container(
                                              height: height * 0.06,
                                              width: width * 0.35,
                                              decoration: BoxDecoration(
                                                color: Color(0xff0EBE7F),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Accept",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: width * 0.04,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
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
