import 'package:doc_bookr/screen/Admin/Admin_add_delete.dart';
import 'package:doc_bookr/screen/Admin/admin_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Admin_Home_Navbar_Screen extends StatefulWidget {
  const Admin_Home_Navbar_Screen({Key? key}) : super(key: key);

  @override
  State<Admin_Home_Navbar_Screen> createState() =>
      _Admin_Home_Navbar_ScreenState();
}

class _Admin_Home_Navbar_ScreenState extends State<Admin_Home_Navbar_Screen> {
  int _selectedIndex = 0;
  final _screen = [AdminHomeScreen(), AdminAddDelete()];
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
          height: 80,
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
                icon: Icon(CupertinoIcons.add),
                label: "Add Delete",
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.calendar_month),
              //   label: "Schedule",
              // ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.file_copy_outlined),
              //   label: "Add Report",
              // ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.account_circle_outlined),
              //   label: "Profile",
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
