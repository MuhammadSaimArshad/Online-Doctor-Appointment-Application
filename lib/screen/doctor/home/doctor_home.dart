import 'package:doc_bookr/controller/Doctor/Doctor_Home_Controller.dart';
import 'package:doc_bookr/customwidgets.dart';

import 'package:doc_bookr/screen/patient/profile_screen.dart';
import 'package:doc_bookr/staticdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DoctorHomeScreen extends StatefulWidget {
  const DoctorHomeScreen({super.key});

  @override
  State<DoctorHomeScreen> createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  var height, width;

  @override
  void initState() {
    Get.put(DoctorHomeController());
    StaticData.updatedoctorprofile();
    DoctorHomeController.to.getSchedule();
    DoctorHomeController.to.getPatient();

    super.initState();
  }

  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return GetBuilder<DoctorHomeController>(builder: (obj) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: height,
            width: width,
            color: Colors.white,
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
                              title: Text(
                                " ${StaticData.doctorModel!.name}",
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
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        StaticData.doctorModel!.image),
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
                                "${StaticData.doctorModel!.patientList?.length}",
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
                                "${obj.schedule}",
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
                obj.qury == ""
                    ? Expanded(
                        child: obj.list.length == 0
                            ? SizedBox(
                                height: height * 0.4,
                                child: Center(
                                  child: CustomWidget.largeText('No Patient !'),
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
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Profilescreen(
                                                model: obj.list[index]),
                                          ));
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(8),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
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
                                            obj.list[index].name,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: width * 0.04,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          Text(
                                            obj.list[index].phonenumber,
                                            style: const TextStyle(
                                              color: Colors.black45,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                      )
                    : Expanded(
                        child: obj.fuilterlist.length == 0
                            ? SizedBox(
                                height: height * 0.4,
                                child: Center(
                                  child: CustomWidget.largeText('No Patient !'),
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
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Profilescreen(
                                                model: obj.fuilterlist[index]),
                                          ));
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(8),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
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
                                            obj.fuilterlist[index].name,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: width * 0.04,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          Text(
                                            obj.fuilterlist[index].phonenumber,
                                            style: const TextStyle(
                                              color: Colors.black45,
                                            ),
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
