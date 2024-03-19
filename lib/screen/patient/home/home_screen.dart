import 'package:doc_bookr/controller/Patient_Home_Controller.dart';
import 'package:doc_bookr/customwidgets.dart';

import 'package:doc_bookr/screen/patient/category_of_doctor.dart';

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
                                "Contact to Admin",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
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
                                "Contact to Admin",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
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
                        "All Doctor",
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
                obj.qury == ""
                    ? SizedBox(
                        width: width,
                        height: height * 0.7,
                        child: obj.list.length == 0
                            ? SizedBox(
                                height: height * 0.4,
                                child: Center(
                                  child: CustomWidget.largeText('No Doctor !'),
                                ),
                              )
                            : GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 1.2),
                                itemCount: obj.list.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //       builder: (context) => Profilescreen(
                                      //           model: obj.list[index]),
                                      //     ));
                                    },
                                    child: Container(
                                      height: height * 0.37,
                                      margin: EdgeInsets.all(8),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          CircleAvatar(
                                            radius: 35,
                                            backgroundImage: NetworkImage(
                                                obj.list[index].image),
                                          ),
                                          Text(
                                            "Dr.${obj.list[index].name}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: width * 0.04,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          Text(
                                            obj.list[index].category,
                                            style: const TextStyle(
                                              color: Colors.black45,
                                            ),
                                          ),
                                          Text(
                                            "Experince.${obj.list[index].specialty}",
                                            style: const TextStyle(
                                              color: Colors.black45,
                                            ),
                                          ),
                                          Text(
                                            "${(obj.list[index].totalrating / obj.list[index].ratingperson).isNaN ? "0" : (obj.list[index].totalrating / obj.list[index].ratingperson)}",
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: width * 0.04),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                      )
                    : SizedBox(
                        width: width,
                        height: height * 0.7,
                        child: obj.fuilterlist.length == 0
                            ? SizedBox(
                                height: height * 0.4,
                                child: Center(
                                  child: CustomWidget.largeText('No Doctor !'),
                                ),
                              )
                            : GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 1.2),
                                itemCount: obj.fuilterlist.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //       builder: (context) => Profilescreen(
                                      //           model: obj.fuilterlist[index]),
                                      //     ));
                                    },
                                    child: Container(
                                      height: height * 0.37,
                                      margin: EdgeInsets.all(8),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          CircleAvatar(
                                            radius: 35,
                                            backgroundImage: NetworkImage(
                                                obj.fuilterlist[index].image),
                                          ),
                                          Text(
                                            "Dr.${obj.fuilterlist[index].name}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: width * 0.04,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          Text(
                                            obj.fuilterlist[index].category,
                                            style: const TextStyle(
                                              color: Colors.black45,
                                            ),
                                          ),
                                          Text(
                                            "Experince.${obj.fuilterlist[index].specialty}",
                                            style: const TextStyle(
                                              color: Colors.black45,
                                            ),
                                          ),
                                          Text(
                                            "${(obj.fuilterlist[index].totalrating / obj.fuilterlist[index].ratingperson).isNaN ? "0" : (obj.fuilterlist[index].totalrating / obj.fuilterlist[index].ratingperson)}",
                                            style: TextStyle(
                                                color: Colors.black45,
                                                fontSize: width * 0.04),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
