import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Recepit extends StatefulWidget {
  const Recepit({super.key});

  @override
  State<Recepit> createState() => _RecepitState();
}

class _RecepitState extends State<Recepit> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            body: Container(
                height: height,
                width: width,
                color: Colors.white,
                child: Stack(children: [
                  Container(
                    height: height * 0.3,
                    width: width,
                    child: Stack(
                      children: [
                        Container(
                          height: height,
                          width: width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('images/Appicon.png'),
                            fit: BoxFit.fill,
                          )),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                            child: Container(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.85),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: height * 0.23,
                            width: width * 0.45,
                            // child: Image(
                            //   image: AssetImage('images/perciption.png'),
                            //   fit: BoxFit.fill,
                            // ),
                          ),
                        ),
                        Container(
                          height: height,
                          width: width * 0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  height: height * 0.09,
                                  width: width,
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: width * 0.05),
                                    child: Text(
                                      // '${widget.patientname}',
                                      "aaa",
                                      maxLines: 2,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: width * 0.055),
                                    ),
                                  )),
                              Container(
                                height: height * 0.035,
                                width: width * 0.5,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: width * 0.05, top: height * 0.01),
                                  child: Row(
                                    children: [
                                      Container(
                                          height: height,
                                          width: width * 0.1,
                                          child: Center(
                                              child: Text(
                                            'Date:',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .surface,
                                                fontSize: width * 0.03,
                                                fontWeight: FontWeight.bold),
                                          ))),
                                      Container(
                                          height: height,
                                          width: width * 0.15,
                                          child: Center(
                                            child: Text(
                                              // '${widget.appointmentDate.substring(0, 10)}',
                                              "sdsd",
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontSize: width * 0.027,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .surface,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: height * 0.035,
                                width: width * 0.5,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: width * 0.05,
                                      bottom: height * 0.01),
                                  child: Row(
                                    children: [
                                      Container(
                                          height: height,
                                          width: width * 0.1,
                                          child: Center(
                                              child: Text(
                                            'Time:',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .surface,
                                                fontSize: width * 0.03,
                                                fontWeight: FontWeight.bold),
                                          ))),
                                      Container(
                                          height: height,
                                          width: width * 0.15,
                                          child: Center(
                                            child: Text(
                                              // '${widget.appointmentDate.substring(
                                              //   11,
                                              // )}',
                                              "df",
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontSize: width * 0.027,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .surface,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: height * 0.07,
                    width: width,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: height * 0.7,
                              width: width * 0.14,
                              child: Icon(
                                Icons.keyboard_arrow_left,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ),
                          Container(
                            height: height * 0.7,
                            width: width * 0.45,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: height * 0.7,
                                  width: width * 0.3,
                                  child: Center(
                                      child: Text(
                                    'Appointment NO',
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: width * 0.03),
                                  )),
                                ),
                                Container(
                                  height: height * 0.05,
                                  width: width * 0.1,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(120)),
                                  child: Center(
                                      child: Text(
                                    // '${widget.appointmentId}',
                                    "cc",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: width * 0.03,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ],
                            ),
                          )
                        ]),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: height * 0.73,
                      width: width,
                      decoration: BoxDecoration(
                          // color: Theme.of(context).appBarTheme,
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(30))),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: height * 0.02, left: width * 0.02),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                height: height * 0.1,
                                width: width * 0.2,
                                // child: Image(
                                //   image: AssetImage('images/symbol_rx.png'),
                                // ),
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                height: height * 0.07,
                                width: width * 0.4,
                                child: Flex(
                                  direction: Axis.horizontal,
                                  children: [
                                    Flexible(
                                        flex: 7,
                                        child: Container(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            'Total Medicines',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .surface,
                                                fontSize: width * 0.03,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )),
                                    Flexible(
                                        flex: 3,
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            // '${obj.patientPerceptionList.length}',
                                            "ss",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .surface,
                                                fontSize: width * 0.03),
                                          ),
                                        ))
                                  ],
                                ),
                              )),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: height * 0.6,
                              width: width * 0.9,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 7.0, left: 6.0, right: 6.0),
                                    child: Container(
                                      height: height * 0.07,
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12)),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color(0x20000000),
                                                blurRadius: 5,
                                                offset: Offset(0, 3))
                                          ]),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.02),
                                              child: Container(
                                                child: Text(
                                                  "Medicine",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: width * 0.23,
                                              //    color: Colors.blue,
                                              child: Text(
                                                "Time",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: width * 0.2,
                                              //    color: Colors.blue,
                                              child: Text(
                                                "Duration",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(top: height * 0.02),
                                      child: Container(
                                        height: height * 0.6,
                                        width: width,
                                        // child: ListView.builder(
                                        //     itemCount: obj
                                        //         .patientPerceptionList.length,
                                        //     itemBuilder: (context, index) {
                                        //       // return Padding(
                                        //       //   padding:
                                        //       //       const EdgeInsets.all(1.0),
                                        //       //   child: medCard(
                                        //       //       obj.patientPerceptionList[
                                        //       //           index]),
                                        //       // );
                                        //     }),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ]))));
  }
}
