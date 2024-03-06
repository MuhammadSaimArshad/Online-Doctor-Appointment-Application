import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_bookr/controller/patient_home_controller.dart';
import 'package:doc_bookr/customwidgets.dart';
import 'package:doc_bookr/model/DoctorModel.dart';
import 'package:doc_bookr/screen/patient/appointment_screen.dart';
import 'package:doc_bookr/screen/patient/category_of_doctor.dart';
import 'package:doc_bookr/screen/patient/doctor_screen.dart';
import 'package:doc_bookr/staticdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var height, width;

  @override
  void initState() {
    Get.put(PatientHomeController());
    StaticData.updatepatientprofile();

    PatientHomeController.to.getdoctor();

    super.initState();
  }

  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return GetBuilder<PatientHomeController>(builder: (obj) {
      return Scaffold(
        body: Container(
          height: height,
          width: width,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.26,
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
                              title: Text(
                                StaticData.patientmodel!.name,
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
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        "${StaticData.patientmodel!.image}"),
                                  )),
                            )
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
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
                              const Icon(Icons.search),
                              SizedBox(
                                width: width * 0.03,
                              ),
                              Expanded(
                                  child: TextFormField(
                                controller: obj.search,
                                onChanged: (value) {
                                  obj.updateQure(value);
                                },
                                decoration: const InputDecoration(
                                    hintText: "Search.....",
                                    border: InputBorder.none),
                              )),
                              const Icon(Icons.cancel_outlined),
                              SizedBox(
                                width: width * 0.03,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                if (obj.qury == "")
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          StaticData.openEmailChat();
                        },
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
                                  color: const Color(0xff0EBE7F),
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
                        onTap: () {
                          StaticData.openWhatsAppChat();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15),
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
                                  Icons.chat,
                                  color: const Color(0xff0EBE7F),
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
                if (obj.qury == "")
                  SizedBox(
                    height: height * 0.21,
                    width: width,
                    child: Column(
                      children: [
                        Container(
                          height: height * 0.2,
                          width: width * 0.9,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xff0EBE4f),
                                  Color(0xff0EBE7F),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(width * 0.05),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: width * 0.01,
                                  spreadRadius: 4,
                                ),
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Consult doctor online ",
                                style: TextStyle(
                                    fontSize: width * 0.045,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Get",
                                style: TextStyle(
                                    fontSize: width * 0.03,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "20%",
                                style: TextStyle(
                                    fontSize: width * 0.065,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Discount",
                                style: TextStyle(
                                    fontSize: width * 0.03,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "for another Family Member",
                                style: TextStyle(
                                    fontSize: width * 0.035,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                SizedBox(
                  height: height * 0.03,
                ),
                if (obj.qury == "")
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
                              color: const Color(0xff0EBE7F),
                              borderRadius:
                                  BorderRadius.circular(width * 0.02)),
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
                if (obj.qury == "")
                  SizedBox(
                    height: height * 0.03,
                  ),
                if (obj.qury == "")
                  Row(
                    children: [
                      SizedBox(
                        width: width * 0.06,
                      ),
                      Text(
                        "Select Doctor",
                        style: TextStyle(
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                if (obj.qury == "")
                  SizedBox(
                    height: height * 0.02,
                  ),
                SizedBox(
                  width: width,
                  height: height * 0.7,
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('doctor')
                          .snapshots(),
                      builder: (BuildContext context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }

                        if (snapshot.hasError) {
                          print("Error: /${snapshot.error}");
                          return Text('Error: /${snapshot.error}');
                        }

                        DoctorModel? doctor;
                        if (snapshot.data!.docs.length != 0) {
                          print(
                              'snapshot.data!.docs.length/${snapshot.data!.docs.length}');
                        }

                        return snapshot.data!.docs.length == 0 &&
                                snapshot.data!.docs.isEmpty
                            ? Center(
                                child:
                                    CustomWidget.largeText('Data not found !'),
                              )
                            : GridView.builder(
                                itemCount: snapshot.data!.docs.length,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 1,
                                        crossAxisSpacing: 0),
                                itemBuilder: (context, index) {
                                  doctor = DoctorModel.fromMap(
                                      snapshot.data!.docs[index].data()
                                          as Map<String, dynamic>);
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                AppointmentScreen(
                                              model: doctor!,
                                            ),
                                          ));
                                    },
                                    child: Container(
                                      height: height * 0.23,
                                      width: width * 0.2,
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
                                          // SizedBox(
                                          //   height: height * 0.01,
                                          // ),
                                          SizedBox(
                                              height: height * 0.1,
                                              width: width * 0.15,
                                              child: CircleAvatar(
                                                backgroundImage:
                                                    NetworkImage(doctor!.image),
                                              )),
                                          Text("Dr.${doctor!.name}"),
                                          Text(doctor!.category),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                                size: width * 0.04,
                                              ),
                                              Text(
                                                "${(doctor!.totalrating / doctor!.ratingperson).isNaN ? "0" : (doctor!.totalrating / doctor!.ratingperson)}",
                                                style: TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: width * 0.03),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                      }),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
