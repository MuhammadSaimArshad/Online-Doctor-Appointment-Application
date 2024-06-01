// import 'package:doc_bookr/controller/Doctor/Doctor_Add_Medicine.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

// class MedicineHistory extends StatefulWidget {
//   const MedicineHistory({super.key});

//   @override
//   State<MedicineHistory> createState() => _MedicineHistoryState();
// }

// class _MedicineHistoryState extends State<MedicineHistory> {
//   @override
//   void initState() {
//     Get.put(DoctorAddMedicine());
//     // TODO: implement initState
//     super.initState();
//   }

//   var height, width;
//   @override
//   Widget build(BuildContext context) {
//     height = MediaQuery.of(context).size.height;
//     width = MediaQuery.of(context).size.width;

//     return GetBuilder<DoctorAddMedicine>(builder: (obj) {
//       return Scaffold(
//         body: Container(
//           height: height,
//           width: width,
//           decoration: const BoxDecoration(color: Colors.white),
//           child: Column(
//             children: [
//               // SizedBox(
//               //   height: height * 0.35,
//               //   width: width,
//               //   child: Stack(
//               //     children: [
//               //       Container(
//               //         height: height * 0.35,
//               //         width: width,
//               //         decoration: BoxDecoration(
//               //             color: Color(0xff0EBE7F),
//               //             borderRadius: BorderRadius.only(
//               //                 bottomLeft: Radius.circular(width * 0.05),
//               //                 bottomRight: Radius.circular(width * 0.05))),
//               //       ),
//               //       Container(
//               //         height: height * 0.3,
//               //         width: width,
//               //         decoration: BoxDecoration(
//               //             color: Color.fromARGB(255, 59, 219, 163),
//               //             borderRadius: BorderRadius.only(
//               //                 bottomLeft: Radius.circular(width * 0.05),
//               //                 bottomRight: Radius.circular(width * 0.05))),
//               //       ),
//               //       Container(
//               //         height: height * 0.25,
//               //         width: width,
//               //         decoration: BoxDecoration(
//               //             color: Color(0xff0EBE7F),
//               //             borderRadius: BorderRadius.only(
//               //                 bottomLeft: Radius.circular(width * 0.05),
//               //                 bottomRight: Radius.circular(width * 0.05))),
//               //       ),
//               //     ],
//               //   ),
//               // ),

//               SizedBox(
//                 height: height * 0.1,
//               ),
//               SizedBox(
//                 height: height * 0.02,
//               ),
//               // row1
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   SizedBox(
//                     height: height * 0.06,
//                     width: width * 0.6,
//                     child: TextFormField(
//                       controller: obj.medicine1,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.black,
//                             width: width * 0.01,
//                           ),
//                         ),
//                         label: Text(
//                           "Medicine 1",
//                           style: TextStyle(
//                               color: Colors.black, fontSize: width * 0.035),
//                         ),
//                         prefixIcon: Icon(
//                           Icons.medical_services,
//                           color: Colors.black,
//                           size: width * 0.05,
//                         ),
//                       ),
//                       validator: (String? value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please Enter Your  Medicine 1';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     height: height * 0.06,
//                     width: width * 0.3,
//                     child: TextFormField(
//                       controller: obj.time1,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.black,
//                             width: width * 0.01,
//                           ),
//                         ),
//                         label: Text(
//                           "Time",
//                           style: TextStyle(
//                               color: Colors.black, fontSize: width * 0.035),
//                         ),
//                         prefixIcon: Icon(
//                           Icons.schedule,
//                           color: Colors.black,
//                           size: width * 0.05,
//                         ),
//                       ),
//                       validator: (String? value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please Enter Your  Time';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: height * 0.02,
//               ),
//               // row2
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   SizedBox(
//                     height: height * 0.06,
//                     width: width * 0.6,
//                     child: TextFormField(
//                       controller: obj.medicine2,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.black,
//                             width: width * 0.01,
//                           ),
//                         ),
//                         label: Text(
//                           "Medicine 2",
//                           style: TextStyle(
//                               color: Colors.black, fontSize: width * 0.035),
//                         ),
//                         prefixIcon: Icon(
//                           Icons.medical_services,
//                           color: Colors.black,
//                           size: width * 0.05,
//                         ),
//                       ),
//                       validator: (String? value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please Enter Your  Medicine 1';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     height: height * 0.06,
//                     width: width * 0.3,
//                     child: TextFormField(
//                       controller: obj.time2,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.black,
//                             width: width * 0.01,
//                           ),
//                         ),
//                         label: Text(
//                           "Time",
//                           style: TextStyle(
//                               color: Colors.black, fontSize: width * 0.035),
//                         ),
//                         prefixIcon: Icon(
//                           Icons.schedule,
//                           color: Colors.black,
//                           size: width * 0.05,
//                         ),
//                       ),
//                       validator: (String? value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please Enter Your  Time';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: height * 0.02,
//               ),
//               // row3
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   SizedBox(
//                     height: height * 0.06,
//                     width: width * 0.6,
//                     child: TextFormField(
//                       controller: obj.medicine3,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.black,
//                             width: width * 0.01,
//                           ),
//                         ),
//                         label: Text(
//                           "Medicine 3",
//                           style: TextStyle(
//                               color: Colors.black, fontSize: width * 0.035),
//                         ),
//                         prefixIcon: Icon(
//                           Icons.medical_services,
//                           color: Colors.black,
//                           size: width * 0.05,
//                         ),
//                       ),
//                       validator: (String? value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please Enter Your  Medicine 1';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     height: height * 0.06,
//                     width: width * 0.3,
//                     child: TextFormField(
//                       controller: obj.time3,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.black,
//                             width: width * 0.01,
//                           ),
//                         ),
//                         label: Text(
//                           "Time",
//                           style: TextStyle(
//                               color: Colors.black, fontSize: width * 0.035),
//                         ),
//                         prefixIcon: Icon(
//                           Icons.schedule,
//                           color: Colors.black,
//                           size: width * 0.05,
//                         ),
//                       ),
//                       validator: (String? value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please Enter Your  Time';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                 ],
//               ),

//               SizedBox(
//                 height: height * 0.02,
//               ),
//               // row4
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   SizedBox(
//                     height: height * 0.06,
//                     width: width * 0.6,
//                     child: TextFormField(
//                       controller: obj.medicine4,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.black,
//                             width: width * 0.01,
//                           ),
//                         ),
//                         label: Text(
//                           "Medicine 4",
//                           style: TextStyle(
//                               color: Colors.black, fontSize: width * 0.035),
//                         ),
//                         prefixIcon: Icon(
//                           Icons.medical_services,
//                           color: Colors.black,
//                           size: width * 0.05,
//                         ),
//                       ),
//                       validator: (String? value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please Enter Your  Medicine 1';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     height: height * 0.06,
//                     width: width * 0.3,
//                     child: TextFormField(
//                       controller: obj.time4,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.black,
//                             width: width * 0.01,
//                           ),
//                         ),
//                         label: Text(
//                           "Time",
//                           style: TextStyle(
//                               color: Colors.black, fontSize: width * 0.035),
//                         ),
//                         prefixIcon: Icon(
//                           Icons.schedule,
//                           color: Colors.black,
//                           size: width * 0.05,
//                         ),
//                       ),
//                       validator: (String? value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please Enter Your  Time';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                 ],
//               ),

//               SizedBox(
//                 height: height * 0.02,
//               ),
//               // row5
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   SizedBox(
//                     height: height * 0.06,
//                     width: width * 0.6,
//                     child: TextFormField(
//                       controller: obj.medicine5,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.black,
//                             width: width * 0.01,
//                           ),
//                         ),
//                         label: Text(
//                           "Medicine 5",
//                           style: TextStyle(
//                               color: Colors.black, fontSize: width * 0.035),
//                         ),
//                         prefixIcon: Icon(
//                           Icons.medical_services,
//                           color: Colors.black,
//                           size: width * 0.05,
//                         ),
//                       ),
//                       validator: (String? value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please Enter Your  Medicine 1';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     height: height * 0.06,
//                     width: width * 0.3,
//                     child: TextFormField(
//                       controller: obj.time5,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.black,
//                             width: width * 0.01,
//                           ),
//                         ),
//                         label: Text(
//                           "Time",
//                           style: TextStyle(
//                               color: Colors.black, fontSize: width * 0.035),
//                         ),
//                         prefixIcon: Icon(
//                           Icons.schedule,
//                           color: Colors.black,
//                           size: width * 0.05,
//                         ),
//                       ),
//                       validator: (String? value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please Enter Your  Time';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                 ],
//               ),

//               SizedBox(
//                 height: height * 0.02,
//               ),
//               // row6
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   SizedBox(
//                     height: height * 0.06,
//                     width: width * 0.6,
//                     child: TextFormField(
//                       controller: obj.medicine6,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.black,
//                             width: width * 0.01,
//                           ),
//                         ),
//                         label: Text(
//                           "Medicine 6",
//                           style: TextStyle(
//                               color: Colors.black, fontSize: width * 0.035),
//                         ),
//                         prefixIcon: Icon(
//                           Icons.medical_services,
//                           color: Colors.black,
//                           size: width * 0.05,
//                         ),
//                       ),
//                       validator: (String? value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please Enter Your  Medicine 1';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     height: height * 0.06,
//                     width: width * 0.3,
//                     child: TextFormField(
//                       controller: obj.time6,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.black,
//                             width: width * 0.01,
//                           ),
//                         ),
//                         label: Text(
//                           "Time",
//                           style: TextStyle(
//                               color: Colors.black, fontSize: width * 0.035),
//                         ),
//                         prefixIcon: Icon(
//                           Icons.schedule,
//                           color: Colors.black,
//                           size: width * 0.05,
//                         ),
//                       ),
//                       validator: (String? value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please Enter Your  Time';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                 ],
//               ),

//               SizedBox(
//                 height: height * 0.02,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     height: height * 0.06,
//                     width: width * 0.3,
//                     child: TextFormField(
//                       controller: obj.day,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.black,
//                             width: width * 0.01,
//                           ),
//                         ),
//                         label: Text(
//                           "Day",
//                           style: TextStyle(
//                               color: Colors.black, fontSize: width * 0.035),
//                         ),
//                         // prefixIcon: Icon(
//                         //   Icons.colner,
//                         //   color: Colors.black,
//                         //   size: width * 0.05,
//                         // ),
//                       ),
//                       validator: (String? value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please Enter Your  Day';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                 ],
//               ),

//               SizedBox(
//                 height: height * 0.02,
//               ),
//               InkWell(
//                 onTap: () {
//                   obj.addmedicine(context);
//                 },
//                 child: Container(
//                   height: height * 0.07,
//                   width: width * 0.9,
//                   decoration: BoxDecoration(
//                     border:
//                         Border.all(width: width * 0.004, color: Colors.white),
//                     borderRadius: BorderRadius.circular(width * 0.02),
//                     color: const Color(0xff0EBE7F),
//                   ),
//                   child: Center(
//                     child: Text(
//                       "Add Medicine",
//                       style: TextStyle(
//                           fontSize: width * 0.04,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: height * 0.01,
//               ),
//             ],
//           ),
//         ),
//       );
//     });
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Medicineadd extends StatefulWidget {
  const Medicineadd({super.key});

  @override
  State<Medicineadd> createState() => _MedicineaddState();
}

class _MedicineaddState extends State<Medicineadd> {
  List<String> pills = [
    'Aspirin',
    'Ibuprofen',
    'Paracetamol',
    // Add more pills as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pill Reminder'),
      ),
      body: ListView.builder(
        itemCount: pills.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(pills[index]),
            // Add more details like dosage, frequency, etc. as needed
            onTap: () {
              // Handle tapping on a pill
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Pill Details'),
                    content: Text('Details for ${pills[index]}'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to screen to add a new pill reminder
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
