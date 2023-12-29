import 'package:flutter/material.dart';

class AdminMessageScreen extends StatefulWidget {
  const AdminMessageScreen({super.key});

  @override
  State<AdminMessageScreen> createState() => _AdminMessageScreenState();
}

class _AdminMessageScreenState extends State<AdminMessageScreen> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                children: [
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Text("Inbox",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: width * 0.06)),
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: width * 0.06,
                ),
                title: Text("MUhammad Saim",
                    style: TextStyle(fontSize: width * 0.05)),
                subtitle: Text("Hello how you are",
                    style: TextStyle(fontSize: width * 0.04)),
                trailing: Column(
                  children: [
                    Text("12:29 am"),
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: width * 0.035,
                      child: const Center(
                        child: Text(
                          "2",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(
                  radius: width * 0.06,
                ),
                title: Text("MUhammad Saim",
                    style: TextStyle(fontSize: width * 0.05)),
                subtitle: Text("Hello how you are",
                    style: TextStyle(fontSize: width * 0.04)),
                trailing: Column(
                  children: [
                    Text("12:29 am"),
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: width * 0.035,
                      child: const Center(
                        child: Text(
                          "2",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(
                  radius: width * 0.06,
                ),
                title: Text("MUhammad Saim",
                    style: TextStyle(fontSize: width * 0.05)),
                subtitle: Text("Hello how you are",
                    style: TextStyle(fontSize: width * 0.04)),
                trailing: Column(
                  children: [
                    Text("12:29 am"),
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: width * 0.035,
                      child: const Center(
                        child: Text(
                          "2",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(
                  radius: width * 0.06,
                ),
                title: Text("MUhammad Saim",
                    style: TextStyle(fontSize: width * 0.05)),
                subtitle: Text("Hello how you are",
                    style: TextStyle(fontSize: width * 0.04)),
                trailing: Column(
                  children: [
                    Text("12:29 am"),
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: width * 0.035,
                      child: const Center(
                        child: Text(
                          "2",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
