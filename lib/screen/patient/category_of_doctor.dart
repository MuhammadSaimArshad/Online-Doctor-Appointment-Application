import 'package:doc_bookr/screen/patient/mydoctor_screen.dart';
import 'package:flutter/material.dart';

class CategoryOfDoctor extends StatefulWidget {
  const CategoryOfDoctor({super.key});

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
    "Neurologist",
    "Radiologist",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                builder: (context) => const MYdoctor(),
                              ));
                        },
                        child: Text(
                          "Pediatrician",
                          style: TextStyle(
                              fontSize: width * 0.04,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
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
                                builder: (context) => const MYdoctor(),
                              ));
                        },
                        child: Text(
                          "Psychiatrist",
                          style: TextStyle(
                              fontSize: width * 0.04,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //2
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                builder: (context) => const MYdoctor(),
                              ));
                        },
                        child: Text(
                          "Cardiologist",
                          style: TextStyle(
                              fontSize: width * 0.04,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
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
                                builder: (context) => const MYdoctor(),
                              ));
                        },
                        child: Text(
                          "Dermatologist",
                          style: TextStyle(
                              fontSize: width * 0.04,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //3
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                builder: (context) => const MYdoctor(),
                              ));
                        },
                        child: Text(
                          "Endocrinologist",
                          style: TextStyle(
                              fontSize: width * 0.04,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
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
                                builder: (context) => const MYdoctor(),
                              ));
                        },
                        child: Text(
                          "Gynecologist",
                          style: TextStyle(
                              fontSize: width * 0.04,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //4
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                builder: (context) => const MYdoctor(),
                              ));
                        },
                        child: Text(
                          "Neurologist",
                          style: TextStyle(
                              fontSize: width * 0.04,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
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
                                builder: (context) => const MYdoctor(),
                              ));
                        },
                        child: Text(
                          "Radiologist",
                          style: TextStyle(
                              fontSize: width * 0.04,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //5
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: height * 0.05,
                    width: width * 0.4,
                    decoration: BoxDecoration(
                      color: const Color(0xff0EBE7F),
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
                                builder: (context) => const MYdoctor(),
                              ));
                        },
                        child: Text(
                          "Gastroenterologist",
                          style: TextStyle(
                              fontSize: width * 0.04,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
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
                                builder: (context) => const MYdoctor(),
                              ));
                        },
                        child: Text(
                          "Nephrologist",
                          style: TextStyle(
                              fontSize: width * 0.04,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //6
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: height * 0.05,
                    width: width * 0.4,
                    decoration: BoxDecoration(
                      color: const Color(0xff0EBE7F),
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
                                builder: (context) => const MYdoctor(),
                              ));
                        },
                        child: Text(
                          "Oncologist",
                          style: TextStyle(
                              fontSize: width * 0.04,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
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
                                builder: (context) => const MYdoctor(),
                              ));
                        },
                        child: Text(
                          "Ophthalmologist",
                          style: TextStyle(
                              fontSize: width * 0.04,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //7
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: height * 0.05,
                    width: width * 0.4,
                    decoration: BoxDecoration(
                      color: const Color(0xff0EBE7F),
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
                                builder: (context) => const MYdoctor(),
                              ));
                        },
                        child: Text(
                          "Otolaryngologist",
                          style: TextStyle(
                              fontSize: width * 0.04,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: height * 0.05,
                    width: width * 0.4,
                    decoration: BoxDecoration(
                      color: const Color(0xff0EBE7F),
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
                                builder: (context) => const MYdoctor(),
                              ));
                        },
                        child: Text(
                          "Pulmonologist",
                          style: TextStyle(
                              fontSize: width * 0.04,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
