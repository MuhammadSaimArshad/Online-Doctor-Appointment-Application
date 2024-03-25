import 'package:doc_bookr/screen/custom_widgets/customwidgets.dart';
import 'package:doc_bookr/model/Appointment_Model.dart';
import 'package:doc_bookr/screen/static_data/staticdata.dart';

import 'package:flutter/material.dart';

class Addreport extends StatefulWidget {
  const Addreport({super.key});

  @override
  State<Addreport> createState() => _AddreportState();
}

class _AddreportState extends State<Addreport> {
  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: height,
          width: width,
          child: Column(
            children: [
              // SizedBox(
              //   height: height * 0.03,
              // ),
              Container(
                height: height * 0.07,
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
                child: Row(
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
                        size: width * 0.04,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Text(
                      "Receipt",
                      style: TextStyle(
                          fontSize: width * 0.05, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: width * 0.03,
              ),
              SizedBox(
                width: width,
                height: height * 0.8,
                child: StreamBuilder(
                  stream: StaticData.firebase
                      .collection('appointment')
                      .where("patientid",
                          isEqualTo: StaticData.patientmodel!.id)
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 3),
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
                                    height: height * 0.6,
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
                                        SizedBox(
                                          height: height * 0.03,
                                        ),
                                        Container(
                                            height: height * 0.46,
                                            width: width * 0.9,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        model!.receiptimage!),
                                                    fit: BoxFit.cover)))
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
