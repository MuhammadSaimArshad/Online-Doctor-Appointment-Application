import 'package:flutter/material.dart';

class AdminCanceledSchedule extends StatefulWidget {
  const AdminCanceledSchedule({super.key});

  @override
  State<AdminCanceledSchedule> createState() => _AdminCanceledScheduleState();
}

class _AdminCanceledScheduleState extends State<AdminCanceledSchedule> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.65,
      width: width,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: height * 0.01,
          ),
          Container(
            height: height * 0.25,
            width: width * 0.95,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(width * 0.05),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: width * 0.02,
                  spreadRadius: width * 0.01,
                ),
              ],
            ),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.01,
                ),
                ListTile(
                  title: const Text(
                    "Muahmmad saim",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text("03001212123",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  trailing: CircleAvatar(
                    radius: width * 0.08,
                  ),
                ),
                const Divider(),
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.07,
                    ),
                    const Icon(Icons.calendar_month_rounded),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    const Text("11/11/2020",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: width * 0.06,
                    ),
                    const Icon(Icons.access_time_filled),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    const Text("3:12 Am",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: width * 0.06,
                    ),
                    CircleAvatar(
                      radius: width * 0.015,
                      backgroundColor: Colors.green,
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    const Text("Cancel",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
