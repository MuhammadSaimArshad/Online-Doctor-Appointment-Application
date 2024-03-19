// ignore_for_file: must_be_immutable

import 'package:doc_bookr/controller/Patient_Chat_Controller.dart';
import 'package:doc_bookr/customwidgets.dart';
import 'package:doc_bookr/model/message.dart';
import 'package:doc_bookr/screen/doctor/message/chatscreen.dart';
import 'package:doc_bookr/screen/doctor/message/m_date_util.dart';
import 'package:doc_bookr/staticdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  void initState() {
    Get.put(PatientChatController());
    StaticData.updatepatientprofile()
        .then((value) => PatientChatController.to.getdoctor());
    super.initState();
  }

  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return GetBuilder<PatientChatController>(builder: (obj) {
      return SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    "Chat",
                    style: TextStyle(
                      fontSize: height * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: obj.doctorlist.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return StreamBuilder(
                      stream: StaticData.firebase
                          .collection('chatroom')
                          .doc(StaticData.chatRoomId(obj.doctorlist[index].id,
                              StaticData.patientmodel!.id))
                          .collection("chats")
                          .orderBy("sent", descending: true)
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
                        Message? message;
                        if (snapshot.data!.docs.length != 0) {
                          message =
                              Message.fromJson(snapshot.data!.docs[0].data());
                        }

                        List<Message> unread = snapshot.data!.docs
                            .map((doc) => Message.fromJson(doc.data()))
                            .where((message) => message.read == "")
                            .where((message1) =>
                                message1.fromId != StaticData.patientmodel!.id)
                            .toList();

                        if (snapshot.data!.docs.length != 0) {
                          print(
                              'snapshot.data!.docs.length/${snapshot.data!.docs.length}');
                        }
                        return snapshot.data!.docs.length == 0 &&
                                snapshot.data!.docs.isEmpty &&
                                message == null
                            ? Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ChatScreen(
                                            image: obj.doctorlist[index].image,
                                            name: obj.doctorlist[index].name,
                                            id: obj.doctorlist[index].id,
                                            current:
                                                StaticData.patientmodel!.id,
                                            currentimage:
                                                StaticData.patientmodel!.image,
                                            currentname:
                                                StaticData.patientmodel!.name,
                                            tokken: obj.doctorlist[index].token,
                                          ),
                                        ));
                                  },
                                  leading: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(
                                        obj.doctorlist[index].image),
                                  ),
                                  title: Text(
                                    obj.doctorlist[index].name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: width * 0.03,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  subtitle: Text(
                                    "Hello, Doctor are your there?",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: width * 0.03,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ChatScreen(
                                            image: obj.doctorlist[index].image,
                                            name: obj.doctorlist[index].name,
                                            id: obj.doctorlist[index].id,
                                            current:
                                                StaticData.patientmodel!.id,
                                            currentimage:
                                                StaticData.patientmodel!.image,
                                            currentname:
                                                StaticData.patientmodel!.name,
                                            tokken: obj.doctorlist[index].token,
                                          ),
                                        ));
                                  },
                                  leading: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(
                                        "${obj.doctorlist[index].image}"),
                                  ),
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: width * 0.45,
                                        child: Text(
                                          obj.doctorlist[index].name,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: width * 0.04,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.2,
                                        child: Text(
                                          MyDateUtil.getMessageTime(
                                              context: context,
                                              time: message!.sent!),
                                          style: TextStyle(
                                            fontSize: width * 0.03,
                                            overflow: TextOverflow.ellipsis,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  subtitle: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: width * 0.5,
                                        child: Text(
                                          "${message.msg}",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: width * 0.03,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ),
                                      if (unread.length != 0)
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 25),
                                          child: CircleAvatar(
                                            backgroundColor: Apptheme.primary,
                                            radius: width * 0.08,
                                            child: Text(
                                              unread.length < 99
                                                  ? "${unread.length}"
                                                  : "99+",
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )
                                    ],
                                  ),
                                ),
                              );
                      });
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
