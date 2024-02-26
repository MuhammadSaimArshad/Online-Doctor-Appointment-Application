import 'package:doc_bookr/screen/patient/appointment_screen.dart';
import 'package:doc_bookr/screen/patient/category_of_doctor.dart';
import 'package:doc_bookr/screen/patient/mydoctor_screen.dart';
import 'package:flutter/material.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                                "MUhammad Saim Arshad",
                                style: TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                "Find Best Doctor",
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
                                borderRadius:
                                    BorderRadius.circular(width * 0.02),
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
                        padding: EdgeInsets.all(15),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                color: Color(0xFFF0EEFA),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.email,
                                color: Color(0xff0EBE7F),
                                size: width * 0.07,
                              ),
                            ),
                            SizedBox(height: width * 0.01),
                            Text(
                              " Email",
                              style: TextStyle(
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: width * 0.01,
                            ),
                            const Text(
                              "Contact to Clinic",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(15),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                color: Color(0xFFF0EEFA),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.chat,
                                color: Color(0xff0EBE7F),
                                size: width * 0.07,
                              ),
                            ),
                            SizedBox(
                              height: width * 0.01,
                            ),
                            Text(
                              "WhatsApp",
                              style: TextStyle(
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: width * 0.01,
                            ),
                            const Text(
                              "Contact to Clinic",
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Container(
                  height: height * 0.21,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: height * 0.2,
                        width: width * 0.9,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(width * 0.05),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: width * 0.01,
                                spreadRadius: 4,
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryOfDoctor(),
                            ));
                      },
                      child: Container(
                        height: height * 0.07,
                        width: width * 0.9,
                        decoration: BoxDecoration(
                            color: Color(0xff0EBE7F),
                            borderRadius: BorderRadius.circular(width * 0.02)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_box_outlined,
                              size: width * 0.06,
                              color: Colors.white,
                            ),
                            Text(
                              " Appointment",
                              style: TextStyle(
                                  fontSize: width * 0.045,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    )
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
                      "Select Doctor",
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
                              Text("Dr.Muhammad Saim"),
                              Text("Child"),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.star),
                                  Icon(Icons.star),
                                  Icon(Icons.star),
                                  Icon(Icons.star),
                                  Icon(Icons.star),
                                ],
                              )
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
                            Text("Dr.Muhammad Saim"),
                            Text("Child"),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.star),
                                Icon(Icons.star),
                                Icon(Icons.star),
                                Icon(Icons.star),
                                Icon(Icons.star),
                              ],
                            )
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
      ),
    );
  }
}
