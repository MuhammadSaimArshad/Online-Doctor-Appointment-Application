import 'package:doc_bookr/screen/doctor/shedule/doctor_cancel_schedule.dart';
import 'package:doc_bookr/screen/doctor/shedule/doctor_complete_schedule.dart';
import 'package:doc_bookr/screen/doctor/shedule/doctor_confirm_schedule.dart';
import 'package:doc_bookr/screen/doctor/shedule/doctor_upcoming_schedule.dart';
import 'package:flutter/material.dart';

class DoctorScheduleScreen extends StatefulWidget {
  const DoctorScheduleScreen({super.key});

  @override
  State<DoctorScheduleScreen> createState() => _DoctorScheduleScreenState();
}

class _DoctorScheduleScreenState extends State<DoctorScheduleScreen> {
  int _buttonIndex = 0;
  final _scheduleWidgets = [
    const DoctorUpcomingSchedule(),
    const DoctorCanceledSchedule(),
    const DoctorConfirmSchedule(),
    const DoctorCompleteSchedule(),
  ];
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.01,
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
                    width: width * 0.03,
                  ),
                  Text(
                    "Schedule",
                    style: TextStyle(
                        fontSize: width * 0.05, fontWeight: FontWeight.bold),
                  )
                ],
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _buttonIndex = 1;
                        });
                      },
                      child: Container(
                        height: height * 0.04,
                        width: width * 0.2,
                        decoration: BoxDecoration(
                          color: _buttonIndex == 1
                              ? Colors.red
                              : Colors.red.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Canceled",
                            style: TextStyle(
                              fontSize: width * 0.03,
                              fontWeight: FontWeight.w500,
                              color: _buttonIndex == 1
                                  ? Colors.white
                                  : Colors.black38,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _buttonIndex = 0;
                        });
                      },
                      child: Container(
                        height: height * 0.04,
                        width: width * 0.2,
                        decoration: BoxDecoration(
                          color: _buttonIndex == 0
                              ? Color(0xff0EBE7F)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Pending",
                            style: TextStyle(
                              fontSize: width * 0.03,
                              fontWeight: FontWeight.w500,
                              color: _buttonIndex == 0
                                  ? Colors.white
                                  : Colors.black38,
                            ),
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
                        height: height * 0.04,
                        width: width * 0.2,
                        decoration: BoxDecoration(
                          color: _buttonIndex == 2
                              ? Color(0xff0EBE7F)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Confirmed",
                            style: TextStyle(
                              fontSize: width * 0.03,
                              fontWeight: FontWeight.w500,
                              color: _buttonIndex == 2
                                  ? Colors.white
                                  : Colors.black38,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _buttonIndex = 3;
                        });
                      },
                      child: Container(
                        height: height * 0.04,
                        width: width * 0.2,
                        decoration: BoxDecoration(
                          color: _buttonIndex == 3
                              ? const Color(0xff0EBE7F)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Completed",
                            style: TextStyle(
                              fontSize: width * 0.03,
                              fontWeight: FontWeight.w500,
                              color: _buttonIndex == 3
                                  ? Colors.white
                                  : Colors.black38,
                            ),
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
        ),
      ),
    );
  }
}
