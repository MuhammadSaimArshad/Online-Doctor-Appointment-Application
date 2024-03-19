// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:doc_bookr/controller/Doctor_Chat_Controller.dart';
import 'package:doc_bookr/customwidgets.dart';
import 'package:doc_bookr/model/message.dart';
import 'package:doc_bookr/screen/doctor/message/chatscreen.dart';
import 'package:doc_bookr/screen/doctor/message/m_date_util.dart';
import 'package:doc_bookr/staticdata.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DoctorMessagesScreen extends StatefulWidget {
  const DoctorMessagesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DoctorMessagesScreen> createState() => _DoctorMessagesScreenState();
}

class _DoctorMessagesScreenState extends State<DoctorMessagesScreen> {
  @override
  void initState() {
    Get.put(DoctorChatController());
    StaticData.updatedoctorprofile()
        .then((value) => DoctorChatController.to.getpatient());
    super.initState();
  }

  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return GetBuilder<DoctorChatController>(builder: (obj) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Messages",
                style: TextStyle(
                  fontSize: width * 0.06,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            obj.patientList.length == 0
                ? SizedBox(
                    height: height * 0.8,
                    child: Center(
                      child: CustomWidget.largeText('No Patient !'),
                    ),
                  )
                : ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: obj.patientList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return StreamBuilder(
                          stream: StaticData.firebase
                              .collection('chatroom')
                              .doc(StaticData.chatRoomId(
                                  obj.patientList[index].id,
                                  StaticData.doctorModel!.id))
                              .collection("chats")
                              .orderBy("sent", descending: true)
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
                            Message? message;
                            if (snapshot.data!.docs.length != 0) {
                              message = Message.fromJson(
                                  snapshot.data!.docs[0].data());
                            }

                            List<Message> unread = snapshot.data!.docs
                                .map((doc) => Message.fromJson(doc.data()))
                                .where((message) => message.read == "")
                                .where((message1) =>
                                    message1.fromId !=
                                    StaticData.doctorModel!.id)
                                .toList();

                            if (snapshot.data!.docs.length != 0)
                              print(
                                  'snapshot.data!.docs.length/${snapshot.data!.docs.length}');
                            return snapshot.data!.docs.length == 0 &&
                                    snapshot.data!.docs.isEmpty &&
                                    message == null
                                ? Padding(
                                    padding: const EdgeInsets.only(bottom: 9),
                                    child: ListTile(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ChatScreen(
                                                image: obj
                                                    .patientList[index].image,
                                                name:
                                                    obj.patientList[index].name,
                                                id: obj.patientList[index].id,
                                                current:
                                                    StaticData.doctorModel!.id,
                                                currentimage: StaticData
                                                    .doctorModel!.image,
                                                currentname: StaticData
                                                    .doctorModel!.name,
                                                tokken: obj
                                                    .patientList[index].token,
                                              ),
                                            ));
                                      },
                                      leading: CircleAvatar(
                                        radius: 30,
                                        backgroundImage: NetworkImage(
                                            "${obj.patientList[index].image}"),
                                      ),
                                      title: Text(
                                        "${obj.patientList[index].name}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: width * 0.04,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      subtitle: Text(
                                        "Hello, Doctor are your there?",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: width * 0.05,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      trailing: Text(
                                        "12:30 pm",
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
                                                image: obj
                                                    .patientList[index].image,
                                                name:
                                                    obj.patientList[index].name,
                                                id: obj.patientList[index].id,
                                                current:
                                                    StaticData.doctorModel!.id,
                                                currentimage: StaticData
                                                    .doctorModel!.image,
                                                currentname: StaticData
                                                    .doctorModel!.name,
                                                tokken: obj
                                                    .patientList[index].token,
                                              ),
                                            ));
                                      },
                                      leading: CircleAvatar(
                                        radius: 30,
                                        backgroundImage: NetworkImage(
                                            "${obj.patientList[index].image}"),
                                      ),
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: width * 0.5,
                                            child: Text(
                                              "${obj.patientList[index].name}",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: width * 0.03,
                                                overflow: TextOverflow.ellipsis,
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: width * 0.15,
                                            child: Text(
                                              "${MyDateUtil.getMessageTime(context: context, time: message!.sent!)}",
                                              style: TextStyle(
                                                fontSize: width * 0.04,
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
                                            width: width * 0.45,
                                            child: Text(
                                              "${message.msg}",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: width * 0.04,
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ),
                                          if (unread.length != 0)
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 35),
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    Apptheme.primary,
                                                radius: 15,
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
      );
    });
  }
}
