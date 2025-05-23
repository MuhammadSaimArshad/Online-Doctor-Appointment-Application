import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  var height, width;
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
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
                      size: width * 0.04,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Text(
                    "Notification",
                    style: TextStyle(
                        fontSize: width * 0.04, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Row(
                children: [
                  SizedBox(
                    width: width * 0.06,
                  ),
                  Text(
                    "All Notification",
                    style: TextStyle(
                        fontSize: width * 0.04, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: width * 0.4,
                  ),
                  Switch(
                    value: _switchValue,
                    activeColor: Colors.green, // Color when the switch is ON
                    activeTrackColor: Colors
                        .lightGreenAccent, // Track color when the switch is ON
                    inactiveThumbColor:
                        Colors.white, // Color when the switch is OFF
                    inactiveTrackColor:
                        Colors.black, // Track color when the switch is OFF
                    onChanged: (value) {
                      setState(() {
                        _switchValue = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Row(
                children: [
                  SizedBox(
                    width: width * 0.06,
                  ),
                  Text(
                    "Chat Notification",
                    style: TextStyle(
                        fontSize: width * 0.04, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: width * 0.36,
                  ),
                  Switch(
                    value: _switchValue,
                    activeColor: Colors.black, // Color when the switch is ON
                    activeTrackColor: Colors
                        .lightGreenAccent, // Track color when the switch is ON
                    inactiveThumbColor:
                        Colors.white, // Color when the switch is OFF
                    inactiveTrackColor:
                        Colors.black, // Track color when the switch is OFF
                    onChanged: (value) {
                      setState(() {
                        _switchValue = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Row(
                children: [
                  SizedBox(
                    width: width * 0.06,
                  ),
                  Text(
                    "Reminder Notification",
                    style: TextStyle(
                        fontSize: width * 0.04, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: width * 0.27,
                  ),
                  Switch(
                    value: _switchValue,
                    activeColor: Colors.green, // Color when the switch is ON
                    activeTrackColor: Colors
                        .lightGreenAccent, // Track color when the switch is ON
                    inactiveThumbColor:
                        Colors.white, // Color when the switch is OFF
                    inactiveTrackColor:
                        Colors.black, // Track color when the switch is OFF
                    onChanged: (value) {
                      setState(() {
                        _switchValue = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Row(
                children: [
                  SizedBox(
                    width: width * 0.06,
                  ),
                  Text(
                    "Audio&Video CAll Notification",
                    style: TextStyle(
                        fontSize: width * 0.04, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: width * 0.12,
                  ),
                  Switch(
                    value: _switchValue,
                    activeColor: Colors.green, // Color when the switch is ON
                    activeTrackColor: Colors
                        .lightGreenAccent, // Track color when the switch is ON
                    inactiveThumbColor:
                        Colors.white, // Color when the switch is OFF
                    inactiveTrackColor:
                        Colors.black, // Track color when the switch is OFF
                    onChanged: (value) {
                      setState(() {
                        _switchValue = value;
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
