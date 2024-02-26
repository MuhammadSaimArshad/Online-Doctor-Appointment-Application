import 'package:doc_bookr/screen/doctor/home/doctor_add_report.dart';
import 'package:doc_bookr/screen/doctor/home/doctor_home.dart';
import 'package:doc_bookr/screen/doctor/home/doctor_message.dart';
import 'package:doc_bookr/screen/doctor/home/doctor_schedule.dart';
import 'package:doc_bookr/screen/doctor/home/doctor_setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorHomeNavbar extends StatefulWidget {
  const DoctorHomeNavbar({Key? key}) : super(key: key);

  @override
  State<DoctorHomeNavbar> createState() => _DoctorHomeNavbarState();
}

class _DoctorHomeNavbarState extends State<DoctorHomeNavbar> {
  int _selectedIndex = 0;
  final _screen = [
    DoctorHomeScreen(),
    DoctorMessageScreen(),
    DoctorScheduleScreen(),
    DoctorAddReportScreen(),
    DoctorSettingScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _screen[_selectedIndex],
        bottomNavigationBar: Container(
          height: 80,
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color(0xff0EBE7F),
            unselectedItemColor: Colors.black26,
            selectedLabelStyle:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.chat_bubble_fill),
                label: "Messages",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month),
                label: "Schedule",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.file_copy_outlined),
                label: "Add Report",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
