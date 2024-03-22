import 'package:doc_bookr/screen/Admin/Admin_Add_doc_pati.dart';
import 'package:doc_bookr/screen/Admin/Admin_Total_doctor.dart';
import 'package:doc_bookr/screen/Admin/Admin_total_patient.dart';
import 'package:doc_bookr/screen/Admin/admin_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminHomeNavbarScreen extends StatefulWidget {
  const AdminHomeNavbarScreen({Key? key}) : super(key: key);

  @override
  State<AdminHomeNavbarScreen> createState() => _AdminHomeNavbarScreenState();
}

class _AdminHomeNavbarScreenState extends State<AdminHomeNavbarScreen> {
  int _selectedIndex = 0;
  final _screen = [
    const AdminHomeScreen(),
    const TotalDoctor(),
    const TotalPatient(),
    const AdminAddDocPati()
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
          height: 80,
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color(0xff0EBE7F),
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
                icon: Icon(CupertinoIcons.person_3),
                label: "Total Doctor",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person_3),
                label: "Total Patinet",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person_3),
                label: "Add Doc&Pati",
              ),

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
