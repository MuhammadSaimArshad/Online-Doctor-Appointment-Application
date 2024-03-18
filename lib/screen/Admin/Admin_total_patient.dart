import 'package:flutter/material.dart';

class TotalPatient extends StatefulWidget {
  const TotalPatient({super.key});

  @override
  State<TotalPatient> createState() => _TotalPatientState();
}

class _TotalPatientState extends State<TotalPatient> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
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
                    "Total Patient",
                    style: TextStyle(
                        fontSize: width * 0.05, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Container(
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
                    const Icon(Icons.search),
                    Expanded(
                        child: TextFormField(
                      // controller: obj.search,
                      // onChanged: (value) {
                      //   obj.updateQure(value);
                      // },
                      decoration: const InputDecoration(
                          hintText: "Search.....", border: InputBorder.none),
                    )),
                    const Icon(Icons.cancel_outlined),
                    SizedBox(
                      width: width * 0.03,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Row(
                children: [
                  SizedBox(
                    width: width * 0.06,
                  ),
                  Text(
                    "All Patient",
                    style: TextStyle(
                        fontSize: width * 0.05, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
