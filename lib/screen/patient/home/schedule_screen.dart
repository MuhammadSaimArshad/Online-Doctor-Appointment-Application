import 'package:doc_bookr/screen/patient/schedule/canceled_schedule_screen.dart';
import 'package:doc_bookr/screen/patient/schedule/completed_schedule_screen.dart';
import 'package:doc_bookr/screen/patient/schedule/upcoming_schedule_screen.dart';
import 'package:flutter/material.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  int _buttonIndex = 0;
  final _scheduleWidgets = [
    const UpcomingSchedule(),
    const CompletedSchedule(),
    const CanceledSchedule(),
  ];

  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height * 0.07,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: width * 0.02,
                  spreadRadius: width * 0.001,
                ),
              ],
            ),
            child: Row(
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
                  width: width * 0.03,
                ),
                Text(
                  "Schedule",
                  style: TextStyle(
                      fontSize: width * 0.05, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFF4F6FA),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _buttonIndex = 0;
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                    decoration: BoxDecoration(
                      color: _buttonIndex == 0
                          ? const Color(0xff0EBE7F)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Upcoming",
                      style: TextStyle(
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w500,
                        color:
                            _buttonIndex == 0 ? Colors.white : Colors.black38,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _buttonIndex = 1;
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                    decoration: BoxDecoration(
                      color: _buttonIndex == 1
                          ? const Color(0xff0EBE7F)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Completed",
                      style: TextStyle(
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w500,
                        color:
                            _buttonIndex == 1 ? Colors.white : Colors.black38,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _buttonIndex = 2;
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                    decoration: BoxDecoration(
                      color: _buttonIndex == 2
                          ? Colors.red
                          : Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Canceled",
                      style: TextStyle(
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.w500,
                        color:
                            _buttonIndex == 2 ? Colors.white : Colors.black38,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.06,
          ),
          _scheduleWidgets[_buttonIndex],
        ],
      ),
    );
  }
}
