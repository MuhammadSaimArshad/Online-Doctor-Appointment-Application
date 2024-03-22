import 'package:doc_bookr/admin_satatic_data.dart';
import 'package:doc_bookr/controller/Admin/Admin_home_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  var height, width;

  @override
  void initState() {
    Get.put(AdminHomeController());
    AdminHomeController.to.getTotalDoctors();
    AdminHomeController.to.getTotalAppointments();
    AdminHomeController.to.getTotalPatients();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return GetBuilder<AdminHomeController>(builder: (obj) {
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
                            color: const Color(0xff0EBE7F),
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
                              trailing: InkWell(
                                onTap: () {
                                  StaticData.logout(context);
                                },
                                child: SizedBox(
                                    height: height * 0.12,
                                    width: width * 0.15,
                                    child: CircleAvatar(
                                      child: Icon(
                                        Icons.logout,
                                        color: Colors.redAccent,
                                        size: width * 0.05,
                                      ),
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
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
                              "${obj.totalPatients}",
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
                              "${obj.totalDoctors}",
                              style: TextStyle(
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Total Doctor",
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
                              "${obj.totalAppointments}",
                              style: TextStyle(
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Total Appointment",
                              style: TextStyle(
                                  fontSize: width * 0.03,
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
                              "222",
                              style: TextStyle(
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Total Schedule",
                              style: TextStyle(
                                  fontSize: width * 0.03,
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
                              "Cancel Schedule",
                              style: TextStyle(
                                  fontSize: width * 0.03,
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
                              "Total Doctor",
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
              ],
            ),
          ),
        ),
      );
    });
  }
}
