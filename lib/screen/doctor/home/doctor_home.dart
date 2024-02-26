import 'package:doc_bookr/screen/patient/appointment_screen.dart';
import 'package:doc_bookr/screen/patient/mydoctor_screen.dart';
import 'package:flutter/material.dart';

class DoctorHomeScreen extends StatefulWidget {
  const DoctorHomeScreen({super.key});

  @override
  State<DoctorHomeScreen> createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.27,
                width: width,
                child: Stack(
                  children: [
                    Container(
                      height: height * 0.25,
                      width: width,
                      decoration: BoxDecoration(
                          color: Color(0xff0EBE7F),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(width * 0.05),
                              bottomRight: Radius.circular(width * 0.05))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            title: const Text(
                              "Dr.MUhammad Saim Arshad",
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              "Find the Patient",
                              style: TextStyle(
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            trailing: SizedBox(
                                height: height * 0.12,
                                width: width * 0.15,
                                child: CircleAvatar()),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MYdoctor(),
                              ));
                        },
                        child: Container(
                          height: height * 0.06,
                          width: width * 0.85,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(width * 0.02),
                              color: Colors.grey[200],
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: width * 0.01,
                                  spreadRadius: width * 0.01,
                                ),
                              ]),
                          child: Row(
                            children: [
                              SizedBox(
                                width: width * 0.03,
                              ),
                              Icon(Icons.search),
                              SizedBox(
                                width: width * 0.03,
                              ),
                              Text(
                                "Search.....",
                                style: TextStyle(fontSize: width * 0.04),
                              ),
                              SizedBox(
                                width: width * 0.46,
                              ),
                              Icon(Icons.cancel_outlined)
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: height * 0.15,
                      width: width * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: width * 0.01,
                            spreadRadius: width * 0.01,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "10",
                            style: TextStyle(
                                fontSize: width * 0.05,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Total Patient",
                            style: TextStyle(
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: height * 0.15,
                      width: width * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: width * 0.01,
                            spreadRadius: width * 0.01,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "10",
                            style: TextStyle(
                                fontSize: width * 0.05,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Total Schedule",
                            style: TextStyle(
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                children: [
                  SizedBox(
                    width: width * 0.06,
                  ),
                  Text(
                    "All Patient",
                    style: TextStyle(
                        fontSize: width * 0.05, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              SizedBox(
                height: height * 0.25,
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AppointmentScreen(),
                            ));
                      },
                      child: Container(
                        height: height * 0.23,
                        width: width * 0.4,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: width * 0.03,
                              spreadRadius: width * 0.015,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 0.02,
                            ),
                            SizedBox(
                                height: height * 0.1,
                                width: width * 0.15,
                                child: CircleAvatar()),
                            Text("Muhammad Saim"),
                            Text("Email"),
                            Text("03031213123"),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: height * 0.23,
                      width: width * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: width * 0.03,
                            spreadRadius: width * 0.015,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * 0.02,
                          ),
                          SizedBox(
                              height: height * 0.1,
                              width: width * 0.15,
                              child: CircleAvatar()),
                          Text("Muhammad Saim"),
                          Text("Email"),
                          Text("03031213123"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
