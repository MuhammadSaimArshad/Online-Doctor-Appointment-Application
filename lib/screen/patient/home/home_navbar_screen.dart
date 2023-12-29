import 'package:doc_bookr/screen/patient/home/add_report_screen.dart';
import 'package:doc_bookr/screen/patient/home/home_screen.dart';
import 'package:doc_bookr/screen/patient/home/message_screen.dart';
import 'package:doc_bookr/screen/patient/home/schedule_screen.dart';
import 'package:doc_bookr/screen/patient/home/setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home_Navbar_Screen extends StatefulWidget {
  const Home_Navbar_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Navbar_Screen> createState() => _Home_Navbar_ScreenState();
}

class _Home_Navbar_ScreenState extends State<Home_Navbar_Screen> {
  int _selectedIndex = 0;
  final _screen = [
    Home_Screen(),
    Message_Screen(),
    ScheduleScreen(),
    Addreport(),
    Setting_Screen(),
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
