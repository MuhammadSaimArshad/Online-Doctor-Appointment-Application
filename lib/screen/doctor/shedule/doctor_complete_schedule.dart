import 'package:doc_bookr/customwidgets.dart';
import 'package:doc_bookr/model/Appointment_Model.dart';
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
      height: height * 0.62,
      width: width,
      child: SizedBox(
        height: height * 0.6,
        width: width,
        child: StreamBuilder(
          stream: StaticData.firebase
              .collection('appointment')
              .where("doctorid", isEqualTo: StaticData.doctorModel!.id)
              .where("status", isEqualTo: 3)
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
              print('snapshot.data!.docs.length/${snapshot.data!.docs.length}');
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
                      return Column(
                        children: [
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Container(
                            height: height * 0.22,
                            width: width * 0.9,
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
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    model!.patientname,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: width * 0.04),
                                  ),
                                  subtitle: Text(model!.phonenumber),
                                  trailing: CircleAvatar(
                                    radius: width * 0.04,
                                    backgroundImage: NetworkImage(model!.image),
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
                                          padding: const EdgeInsets.all(5),
                                          decoration: const BoxDecoration(
                                              color: Color(0xff0EBE7F),
                                              shape: BoxShape.circle),
                                        ),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        Text(
                                          "Completed",
                                          style: TextStyle(
                                            fontSize: width * 0.04,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    });
          },
        ),
      ),
    );
  }
}
