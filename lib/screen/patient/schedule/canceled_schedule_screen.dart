import 'package:doc_bookr/customwidgets.dart';
import 'package:doc_bookr/model/appointmentmodel.dart';
import 'package:doc_bookr/staticdata.dart';
import 'package:flutter/material.dart';

class CanceledSchedule extends StatefulWidget {
  const CanceledSchedule({super.key});

  @override
  State<CanceledSchedule> createState() => _CanceledScheduleState();
}

class _CanceledScheduleState extends State<CanceledSchedule> {
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
                  .where("patientid", isEqualTo: StaticData.patientmodel!.id)
                  .where("status", isEqualTo: 0)
                  .snapshots(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
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
                              padding: EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: width * 0.02,
                                    spreadRadius: width * 0.02,
                                  ),
                                ],
                              ),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text(
                                        "Dr.${model!.doctername}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: width * 0.04),
                                      ),
                                      subtitle: Text("${model!.bio}"),
                                      trailing: CircleAvatar(
                                        radius: width * 0.05,
                                        backgroundImage:
                                            NetworkImage(model!.image),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: Divider(
                                        thickness: width * 0.01,
                                        height: height * 0.02,
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
                                            const Icon(
                                              Icons.access_time_filled,
                                              color: Colors.black54,
                                            ),
                                            SizedBox(
                                              width: width * 0.02,
                                            ),
                                            Text(
                                              "${model!.time}",
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: width * 0.03),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: const BoxDecoration(
                                                  color: Colors.red,
                                                  shape: BoxShape.circle),
                                            ),
                                            SizedBox(
                                              width: width * 0.01,
                                            ),
                                            Text(
                                              "Canceled",
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
                        },
                      );
              })),
    );
  }
}
