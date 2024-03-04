import 'package:doc_bookr/customwidgets.dart';
import 'package:doc_bookr/model/appointmentmodel.dart';
import 'package:doc_bookr/screen/doctor/home/doctor_add_report.dart';
import 'package:doc_bookr/staticdata.dart';
import 'package:flutter/material.dart';

class DoctorConfirmSchedule extends StatefulWidget {
  const DoctorConfirmSchedule({super.key});

  @override
  State<DoctorConfirmSchedule> createState() => _DoctorConfirmScheduleState();
}

class _DoctorConfirmScheduleState extends State<DoctorConfirmSchedule> {
  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * 0.65,
      width: width,
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: StreamBuilder(
            stream: StaticData.firebase
                .collection('appointment')
                .where("doctorid", isEqualTo: StaticData.doctorModel!.id)
                .where("status", isEqualTo: 2)
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
              if (snapshot.data!.docs.length != 0)
                print(
                    'snapshot.data!.docs.length/${snapshot.data!.docs.length}');
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
                            padding:
                                EdgeInsets.symmetric(vertical: width * 0.02),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: width * 0.01,
                                  spreadRadius: width * 0.03,
                                ),
                              ],
                            ),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      model!.patientname,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: width * 0.04),
                                    ),
                                    subtitle: Text(model!.bio),
                                    trailing: CircleAvatar(
                                      radius: width * 0.04,
                                      backgroundImage:
                                          NetworkImage("${model!.image}"),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: Divider(
                                      thickness: width * 0.01,
                                      height: height * 0.03,
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
                                            "${StaticData.formatMicrosecondsSinceEpoch(model!.createdtime)}",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: width * 0.03),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Icon(
                                            Icons.access_time_filled,
                                            color: Colors.black54,
                                            size: width * 0.03,
                                          ),
                                          SizedBox(
                                            width: width * 0.02,
                                          ),
                                          Text(
                                            model!.time,
                                            style: TextStyle(
                                              fontSize: width * 0.02,
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
                                                color: Color(0xff0EBE7F),
                                                shape: BoxShape.circle),
                                          ),
                                          SizedBox(
                                            width: width * 0.02,
                                          ),
                                          Text(
                                            "Confirmed",
                                            style: TextStyle(
                                              fontSize: width * 0.04,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
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
                                              .update({"isAvailable": true});
                                        },
                                        child: Container(
                                          width: 150,
                                          padding: EdgeInsets.symmetric(
                                              vertical: height * 0.01),
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
                                      if (model!.receiptimage == null)
                                        InkWell(
                                          onTap: () {
                                            model = AppointmentModel.fromMap(
                                                snapshot.data!.docs[index]
                                                    .data());
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      DoctorAddReportScreen(
                                                    model: model,
                                                  ),
                                                ));

                                            // StaticData.firebase
                                            //     .collection("appointment")
                                            //     .doc(model!.id)
                                            //     .update({"status": 2});
                                            // StaticData.getpatienttokken(
                                            //         model!.patientid)
                                            //     .then((value) {
                                            //   StaticData.sendNotifcation(
                                            //       "Appointment",
                                            //       "${model!.doctername} accept your appointment at ${model!.time}",
                                            //       value);
                                            // });
                                          },
                                          child: Container(
                                            height: height * 0.07,
                                            width: width * 0.4,
                                            padding: EdgeInsets.symmetric(
                                                vertical: height * 0.005),
                                            decoration: BoxDecoration(
                                              color: Color(0xff0EBE7F),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Upload File",
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
                      });
            },
          )),
    );
  }
}
