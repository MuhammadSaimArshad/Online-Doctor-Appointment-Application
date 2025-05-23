import 'package:doc_bookr/screen/doctor/Doctor_Home/DocSloDate.dart';
import 'package:doc_bookr/screen/doctor/Doctor_Home/doctor_home.dart';
import 'package:doc_bookr/screen/doctor/Doctor_Home/doctor_message.dart';
import 'package:doc_bookr/screen/doctor/shedule/doctor_schedule.dart';
import 'package:doc_bookr/screen/doctor/Doctor_Home/doctor_profile.dart';
import 'package:doc_bookr/screen/static_data/staticdata.dart';

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
    const DoctorHomeScreen(),
    const DoctorMessagesScreen(),
    const DoctorScheduleScreen(),
    DocSloDate(
      model: StaticData.doctorModel!,
    ),
    const DoctorProfile(),
  ];
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _screen[_selectedIndex],
        bottomNavigationBar: SizedBox(
          height: 80,
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color(0xff0EBE7F),
            unselectedItemColor: Colors.black26,
            selectedLabelStyle:
                TextStyle(fontWeight: FontWeight.bold, fontSize: width * 0.03),
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: const [
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
                icon: Icon(Icons.schedule),
                label: "Solts",
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
