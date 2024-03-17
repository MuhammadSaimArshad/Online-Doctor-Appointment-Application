// ignore_for_file: override_on_non_overriding_member

import 'package:doc_bookr/customwidgets.dart';
import 'package:doc_bookr/model/appointmentmodel.dart';
import 'package:doc_bookr/staticdata.dart';

import 'package:flutter/material.dart';

class CompletedSchedule extends StatefulWidget {
  const CompletedSchedule({super.key});

  @override
  State<CompletedSchedule> createState() => _CompletedScheduleState();
}

class _CompletedScheduleState extends State<CompletedSchedule> {
  double fullrating = 0;

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
                            padding: const EdgeInsets.symmetric(vertical: 5),
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
                              height: height * 0.2,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      "Dr.${model!.doctername}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: width * 0.04),
                                    ),
                                    subtitle: Text(model!.bio),
                                    trailing: CircleAvatar(
                                        radius: 25,
                                        backgroundImage: NetworkImage(
                                          model!.image,
                                        )),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: width * 0.03,
                                      ),
                                      Text(
                                        "Rating : ${model!.rating ?? 0}",
                                        style: TextStyle(
                                            fontSize: width * 0.04,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
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
                                            width: width * 0.02,
                                          ),
                                          Text(
                                            StaticData
                                                .formatMicrosecondsSinceEpoch(
                                                    model!.createdtime),
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: width * 0.01),
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
                                            width: width * 0.01,
                                          ),
                                          Text(
                                            "${model!.time}",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: width * 0.02),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(5),
                                            decoration: const BoxDecoration(
                                                color: Colors.green,
                                                shape: BoxShape.circle),
                                          ),
                                          SizedBox(
                                            width: width * 0.02,
                                          ),
                                          Text(
                                            "Completed",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: width * 0.04),
                                          ),
                                        ],
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
