import 'package:doc_bookr/screen/admin/home/admin_add_report.dart';
import 'package:doc_bookr/screen/admin/home/admin_home_screen.dart';
import 'package:doc_bookr/screen/admin/home/admin_message_screen.dart';
import 'package:doc_bookr/screen/admin/home/admin_schedule_screen.dart';
import 'package:doc_bookr/screen/admin/home/admin_setting_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminHomeNavbar extends StatefulWidget {
  const AdminHomeNavbar({Key? key}) : super(key: key);

  @override
  State<AdminHomeNavbar> createState() => _AdminHomeNavbarState();
}

class _AdminHomeNavbarState extends State<AdminHomeNavbar> {
  int _selectedIndex = 0;
  final _screen = [
    AdminHomeScreen(),
    AdminMessageScreen(),
    AdminScheduleScreen(),
    AdminAddreport(),
    AdminSettingScreen(),
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
