// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:doc_bookr/screen/AppTheme/AppTheme.dart';
import 'package:doc_bookr/screen/custom_widgets/customwidgets.dart';

import 'package:doc_bookr/model/Doctor/Doctor_Model.dart';
import 'package:doc_bookr/model/Doctor/Doctor_Slots.dart';

import 'package:doc_bookr/screen/static_data/staticdata.dart';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class DocSloDate extends StatefulWidget {
  final DoctorModel model;

  const DocSloDate({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<DocSloDate> createState() => _DocSloDateState();
}

class _DocSloDateState extends State<DocSloDate> {
  int index = -1;
  var month = DateFormat('MMMM').format(DateTime.now());
  DateTime date = DateTime.now();
  var height, width;
  DoctorSlot? DocSloDate;
  @override
  Widget build(BuildContext context) {
    print("doctot data ${widget.model}");
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Material(
        child: Scaffold(
          body: Container(
            height: height,
            width: width,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.02,
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
                        size: width * 0.04,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Text(
                      "Slots",
                      style: TextStyle(
                          fontSize: width * 0.04, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      month.toString(),
                      style: TextStyle(
                          fontSize: width * 0.04, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                SizedBox(
                  height: height * 0.17,
                  width: width,
                  child: DatePicker(
                    DateTime.now(),
                    initialSelectedDate: DateTime.now(),
                    onDateChange: (selectedDate) {
                      setState(() {
                        date = selectedDate;
                        month = DateFormat('MMMM').format(selectedDate);
                      });
                    },
                    selectionColor: Apptheme.primary,
                    selectedTextColor: Colors.white,
                    dateTextStyle: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Slots",
                      style: TextStyle(
                          fontSize: width * 0.04, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.016,
                ),
                SizedBox(
                    height: height * 0.48,
                    width: width,
                    child: date.day.toString() +
                                date.month.toString() +
                                date.year.toString() !=
                            DateTime.now().day.toString() +
                                DateTime.now().month.toString() +
                                DateTime.now().year.toString()
                        ? Center(
                            child: Text(
                              "No Slots",
                              style: TextStyle(
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: StreamBuilder(
                                stream: StaticData.firebase
                                    .collection('slots')
                                    .doc(widget.model.id)
                                    .collection("slots")
                                    // .where("isAvailable", isEqualTo: true)
                                    .snapshots(),
                                builder: (BuildContext context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }

                                  if (snapshot.hasError) {
                                    print("Error: /${snapshot.error}");
                                    return Text('Error: /${snapshot.error}');
                                  }

                                  return snapshot.data!.docs.length == 0 &&
                                          snapshot.data!.docs.isEmpty
                                      ? Center(
                                          child: CustomWidget.largeText(
                                              ' not found !'),
                                        )
                                      : GridView.builder(
                                          itemCount: snapshot.data!.docs.length,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 3,
                                                  crossAxisSpacing: 18.0,
                                                  mainAxisSpacing: 18.0,
                                                  childAspectRatio: 3),
                                          itemBuilder: (context, i) {
                                            DoctorSlot doctorSlot =
                                                DoctorSlot.fromMap(snapshot
                                                    .data!.docs[i]
                                                    .data());
                                            return InkWell(
                                              onTap: () {
                                                // setState(() {
                                                //   DocSloDate =
                                                //       DoctorSlot.fromMap(
                                                //           snapshot.data!.docs[i]
                                                //               .data());
                                                //   index = i;
                                                // });
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: doctorSlot
                                                                .isAvailable ==
                                                            false
                                                        ? Colors.red
                                                            .withOpacity(0.2)
                                                        : index == i
                                                            ? Apptheme.primary
                                                            : Colors.grey[300],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            21)),
                                                child: Center(
                                                  child: Text(
                                                    doctorSlot.startTime,
                                                    style: TextStyle(
                                                        color: index == i
                                                            ? Colors.white
                                                            : Apptheme.primary),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                }))),
                SizedBox(
                  height: height * 0.02,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
