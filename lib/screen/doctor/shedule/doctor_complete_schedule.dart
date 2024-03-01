import 'package:doc_bookr/customwidgets.dart';
import 'package:doc_bookr/model/appointmentmodel.dart';
import 'package:doc_bookr/staticdata.dart';
import 'package:flutter/material.dart';

class DoctorCompleteSchedule extends StatefulWidget {
  const DoctorCompleteSchedule({super.key});

  @override
  State<DoctorCompleteSchedule> createState() => _DoctorCompleteScheduleState();
}

class _DoctorCompleteScheduleState extends State<DoctorCompleteSchedule> {
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
                                  blurRadius: 4,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      "${model!.patientname}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text("${model!.bio}"),
                                    trailing: CircleAvatar(
                                      radius: 25,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: Divider(
                                      thickness: 1,
                                      height: 20,
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
                                          Icon(
                                            Icons.calendar_month,
                                            color: Colors.black54,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "${StaticData.formatMicrosecondsSinceEpoch(model!.createdtime)}",
                                            style: TextStyle(
                                              color: Colors.black54,
                                            ),
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
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "${model!.time}",
                                            style: TextStyle(
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                color: Colors.green,
                                                shape: BoxShape.circle),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Completed",
                                            style: TextStyle(
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
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
