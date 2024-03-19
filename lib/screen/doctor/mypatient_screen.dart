import 'package:doc_bookr/controller/Doctor/Doctor_Home_Controller.dart';
import 'package:doc_bookr/customwidgets.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MYPATIENT extends StatefulWidget {
  const MYPATIENT({super.key});

  @override
  State<MYPATIENT> createState() => _MYPATIENTState();
}

class _MYPATIENTState extends State<MYPATIENT> {
  var height, width;
  @override
  void initState() {
    Get.put(DoctorHomeController());
    DoctorHomeController.to.getPatient();

    super.initState();
  }

  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return GetBuilder<DoctorHomeController>(builder: (obj) {
      return SafeArea(
        child: Scaffold(
          body: SizedBox(
            height: height,
            width: width,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.03,
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
                        size: width * 0.05,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Text(
                      "Find Patient",
                      style: TextStyle(
                          fontSize: width * 0.05, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Container(
                  height: height * 0.06,
                  width: width * 0.85,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.02),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: width * 0.01,
                          spreadRadius: width * 0.005,
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
                            hintText: "Search.....", border: InputBorder.none),
                      )),
                      const Icon(Icons.cancel_outlined),
                      SizedBox(
                        width: width * 0.03,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
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
                            : StreamBuilder<Object>(
                                stream: null,
                                builder: (context, snapshot) {
                                  return ListView.builder(
                                    itemCount: obj.list.length,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Container(
                                        height: height * 0.1,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 16.0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: width * 0.01,
                                              spreadRadius: width * 0.01,
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: height * 0.01,
                                            ),
                                            ListTile(
                                                leading: CircleAvatar(
                                                  radius: 35,
                                                  backgroundImage: NetworkImage(
                                                      obj.list[index].image),
                                                ),
                                                title: Text(
                                                  obj.list[index].name,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: width * 0.04,
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                                subtitle: Text(
                                                  obj.list[index].phonenumber,
                                                  style: const TextStyle(
                                                    color: Colors.black45,
                                                  ),
                                                )),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                }),
                      )
                    : Expanded(
                        child: obj.fuilterlist.length == 0
                            ? SizedBox(
                                height: height * 0.4,
                                child: Center(
                                  child: CustomWidget.largeText('No Patient !'),
                                ),
                              )
                            : ListView.builder(
                                itemCount: obj.list.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: height * 0.1,
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
                                      children: [
                                        SizedBox(
                                          height: height * 0.01,
                                        ),
                                        ListTile(
                                          leading: CircleAvatar(
                                            radius: 35,
                                            backgroundImage: NetworkImage(
                                                obj.list[index].image),
                                          ),
                                          title: Text(
                                            obj.list[index].name,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: width * 0.04,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          subtitle: Text(
                                            obj.list[index].phonenumber,
                                            style: const TextStyle(
                                              color: Colors.black45,
                                            ),
                                          ),
                                        ),
                                      ],
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
