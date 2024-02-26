import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MYPATIENT extends StatefulWidget {
  const MYPATIENT({super.key});

  @override
  State<MYPATIENT> createState() => _MYPATIENTState();
}

class _MYPATIENTState extends State<MYPATIENT> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: height,
          width: width,
          child: Column(
            children: [
              SizedBox(
                height: height * 0.03,
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
                      size: width * 0.05,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Text(
                    "Find Patient",
                    style: TextStyle(
                        fontSize: width * 0.05, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.04,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MYPATIENT(),
                      ));
                },
                child: Container(
                  height: height * 0.06,
                  width: width * 0.85,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.02),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: width * 0.01,
                          spreadRadius: width * 0.005,
                        ),
                      ]),
                  child: Row(
                    children: [
                      SizedBox(
                        width: width * 0.03,
                      ),
                      Icon(Icons.search),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      Text(
                        "Search.....",
                        style: TextStyle(fontSize: width * 0.04),
                      ),
                      SizedBox(
                        width: width * 0.46,
                      ),
                      Icon(Icons.cancel_outlined)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
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
                      subtitle: const Text("03030112123",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      trailing: CircleAvatar(
                        radius: width * 0.08,
                      ),
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("EMail",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        const Text("saim@gmail.com",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(
                          width: width * 0.02,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: height * 0.066,
                          width: width * 0.35,
                          decoration: BoxDecoration(
                            color: Color(0xff0EBE7F),
                            borderRadius: BorderRadius.circular(width * 0.02),
                          ),
                          child: Center(
                            child: Text(
                              "Accept",
                              style: TextStyle(
                                  fontSize: width * 0.04,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    )
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
