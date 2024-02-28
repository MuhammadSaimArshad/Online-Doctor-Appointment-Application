import 'package:doc_bookr/screen/patient/mydoctor_screen.dart';
import 'package:flutter/material.dart';

class CategoryOfDoctor extends StatefulWidget {
  CategoryOfDoctor({super.key});

  @override
  State<CategoryOfDoctor> createState() => _CategoryOfDoctorState();
}

class _CategoryOfDoctorState extends State<CategoryOfDoctor> {
  var height, width;
  List<String> list = [
    "Pediatrician",
    "Psychiatrist",
    "Cardiologist",
    "Dermatologist",
    "Endocrinologist",
    "Gynecologist",
    "Neurologist",
    "Radiologist",
    "Gastroenterologist",
    "Nephrologist",
    "Oncologist",
    "Ophthalmologist",
    "Otolaryngologist",
    "Pulmonologist",
  ];
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: height,
          width: width,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  Text(
                    "Our Specialized Doctor Are Below",
                    style: TextStyle(
                        fontSize: width * 0.04, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              //1
              SizedBox(
                height: height * 0.03,
              ),

              Expanded(
                  child: GridView.builder(
                itemCount: list.length,

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 3,
                    crossAxisSpacing: 5,
                    crossAxisCount: 2),
                // maxCrossAxisExtent: 1,
                // childAspectRatio: 1,
                // crossAxisSpacing: 2),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: height * 0.05,
                        width: width * 0.4,
                        decoration: BoxDecoration(
                          color: Color(0xff0EBE7F),
                          borderRadius: BorderRadius.circular(width * 0.02),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: width * 0.01,
                              spreadRadius: width * 0.01,
                            ),
                          ],
                        ),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MYdoctor(
                                      category: "${list[index]}",
                                    ),
                                  ));
                            },
                            child: Text(
                              "${list[index]}",
                              style: TextStyle(
                                  fontSize: width * 0.04,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      //2
                      SizedBox(
                        height: height * 0.03,
                      ),
                    ],
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
