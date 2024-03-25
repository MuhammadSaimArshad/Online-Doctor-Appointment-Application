// ignore_for_file: override_on_non_overriding_member

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_bookr/screen/custom_widgets/customwidgets.dart';

import 'package:doc_bookr/model/Appointment_Model.dart';
import 'package:doc_bookr/screen/static_data/staticdata.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double fullrating = 0;

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
              //   height: height * 0.01,
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
                        size: width * 0.05,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Text(
                      "Rating ",
                      style: TextStyle(
                          fontSize: width * 0.04, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              SizedBox(
                width: width,
                height: height * 0.82,
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
                                    height: height * 0.29,
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

                                            // RatingBar.builder(
                                            //   initialRating: model?.rating ?? 0,
                                            //   minRating: 0,
                                            //   direction: Axis.horizontal,
                                            //   allowHalfRating: true,
                                            //   itemCount: 5,
                                            //   itemSize: 30,
                                            //   itemBuilder: (context, _) => Icon(
                                            //     Icons.star,
                                            //     color: Colors.amber,
                                            //   ),
                                            //   onRatingUpdate: (rating) {
                                            //     print(rating);
                                            //     // You can do something with the new rating value here
                                            //   },
                                            // ),
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
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: Colors.green,
                                                          shape:
                                                              BoxShape.circle),
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
                                        SizedBox(
                                          height: height * 0.02,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: model!.rating == null
                                                  ? () {
                                                      model = AppointmentModel
                                                          .fromMap(snapshot
                                                              .data!.docs[index]
                                                              .data());
                                                      fullrating = 0;
                                                      showDialog(
                                                          barrierDismissible:
                                                              false,
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return StatefulBuilder(
                                                                builder:
                                                                    (context,
                                                                        set) {
                                                              return SizedBox(
                                                                height: height *
                                                                    0.3,
                                                                child:
                                                                    AlertDialog(
                                                                  actions: [
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child:
                                                                          const Text(
                                                                        "No",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.red),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: width *
                                                                          0.05,
                                                                    ),
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        StaticData
                                                                            .firebase
                                                                            .collection(
                                                                                "appointment")
                                                                            .doc(model!
                                                                                .id)
                                                                            .update({
                                                                          "rating":
                                                                              fullrating
                                                                        });
                                                                        StaticData
                                                                            .firebase
                                                                            .collection("doctor")
                                                                            .doc(model!.doctorid)
                                                                            .update({
                                                                          "totalrating":
                                                                              FieldValue.increment(fullrating),
                                                                          "ratingperson":
                                                                              FieldValue.increment(1),
                                                                        });
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        "Yes",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Apptheme.primary),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                  title: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      SizedBox(
                                                                        width: width *
                                                                            0.03,
                                                                      ),
                                                                      Text(
                                                                        "Dotcor Rating",
                                                                        style: TextStyle(
                                                                            fontSize: width *
                                                                                0.03,
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      ),
                                                                      TextButton(
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.of(context).pop();
                                                                          },
                                                                          child:
                                                                              const Icon(Icons.cancel_outlined)),
                                                                    ],
                                                                  ),

                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)), //this right here
                                                                  content:
                                                                      SizedBox(
                                                                    height:
                                                                        height *
                                                                            0.1,
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        RatingBar.builder(
                                                                            initialRating: 0,
                                                                            minRating: 1,
                                                                            unratedColor: Colors.grey,
                                                                            itemCount: 5,
                                                                            itemSize: 30,
                                                                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                                                            updateOnDrag: true,
                                                                            itemBuilder: (context, index) => const Icon(
                                                                                  Icons.star,
                                                                                  color: Color(0xff0EBE7F),
                                                                                ),
                                                                            onRatingUpdate: (ratingvalue) {
                                                                              set(() {
                                                                                setState(() {
                                                                                  fullrating = ratingvalue;
                                                                                });
                                                                              });
                                                                            }),
                                                                        SizedBox(
                                                                          height:
                                                                              height * 0.02,
                                                                        ),
                                                                        Text(
                                                                          "Rating : $fullrating",
                                                                          style: TextStyle(
                                                                              fontSize: width * 0.03,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            });
                                                          });
                                                    }
                                                  : () {
                                                      print(
                                                          " model!.rating${model!.rating}");
                                                    },
                                              child: Container(
                                                height: height * 0.066,
                                                width: width * 0.35,
                                                decoration: BoxDecoration(
                                                  color: Color(0xff0EBE7F),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          width * 0.02),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "Rating",
                                                    style: TextStyle(
                                                        fontSize: width * 0.04,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
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
