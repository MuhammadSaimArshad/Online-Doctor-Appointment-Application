import 'package:doc_bookr/screen/patient/home/add_report_screen.dart';
import 'package:doc_bookr/screen/patient/home/home_screen.dart';
import 'package:doc_bookr/screen/patient/home/message_screen.dart';
import 'package:doc_bookr/screen/patient/home/schedule_screen.dart';
import 'package:doc_bookr/screen/patient/home/setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeNavbarScreen extends StatefulWidget {
  const HomeNavbarScreen({Key? key}) : super(key: key);

  @override
  State<HomeNavbarScreen> createState() => _HomeNavbarScreenState();
}

class _HomeNavbarScreenState extends State<HomeNavbarScreen> {
  int _selectedIndex = 0;
  final _screen = [
    const HomeScreen(),
    MessagesScreen(),
    ScheduleScreen(),
    const Addreport(),
    const SettingScreen(),
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
        bottomNavigationBar: Container(
          height: height * 0.08,
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color(0xff0EBE7F),
            unselectedItemColor: Colors.black26,
            selectedLabelStyle:
                TextStyle(fontWeight: FontWeight.bold, fontSize: width * 0.04),
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
