// import 'package:doc_bookr/controller/Login_Controller.dart';
// import 'package:email_validator/email_validator.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class add extends StatefulWidget {
//   const add({Key? key}) : super(key: key);

//   @override
//   State<add> createState() => _addState();
// }

// class _addState extends State<add> {
//   @override
//   void initState() {
//     // Get.put(LoginController());
//     super.initState();
//   }

//   final GlobalKey<FormState> form = GlobalKey<FormState>();
//   var height, width;

//   @override
//   Widget build(BuildContext context) {
//     height = MediaQuery.of(context).size.height;
//     width = MediaQuery.of(context).size.width;

//     return GetBuilder<LoginController>(builder: (obj) {
//       return Material(
//         color: Colors.white,
//         child: Form(
//           key: form,
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: height * 0.2,
//                   width: width,
//                   // child: Center(
//                   //     child: Image(image: AssetImage("images/youtube.png"))),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(12),
//                   child: TextFormField(
//                     controller: obj.email,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       label: Text("Email Address"),
//                       prefixIcon: Icon(Icons.email),
//                     ),
//                     validator: (String? value) {
//                       if (value!.isEmpty) {
//                         return 'Please enter your E-mail';
//                       } else if (EmailValidator.validate(obj.email.text) ==
//                           false) {
//                         return 'Please enter correct E-mail';
//                       }
//                       return null;
//                     },
//                     keyboardType: TextInputType.emailAddress,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(12),
//                   child: TextFormField(
//                     obscureText: obj.passToggle ? true : false,
//                     controller: obj.password,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       label: Text("Enter Password"),
//                       prefixIcon: Icon(Icons.lock),
//                       suffixIcon: InkWell(
//                         onTap: () {
//                           if (obj.passToggle == true) {
//                             obj.passToggle = false;
//                           } else {
//                             obj.passToggle = true;
//                           }
//                           obj.update();
//                         },
//                         child: obj.passToggle
//                             ? Icon(CupertinoIcons.eye_slash_fill)
//                             : Icon(CupertinoIcons.eye_fill),
//                       ),
//                     ),
//                     obscuringCharacter: "*",
//                     validator: (String? value) {
//                       RegExp regex = RegExp(r'^(?=.?[!@#\$&~]).{4,}$');
//                       if (value!.isEmpty) {
//                         return 'Please enter Password';
//                       } else {
//                         if (value.length < 5) {
//                           return ("Password Must be more than 5 characters");
//                         } else if (!regex.hasMatch(value)) {
//                           return ("Password should contain Special character or number");
//                         } else {
//                           return null;
//                         }
//                       }
//                     },
//                     keyboardType: TextInputType.emailAddress,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(12),
//                   child: TextFormField(
//                     // obscureText: obj.api ? true : false,
//                     // controller: obj.apikey,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       label: Text("Enter Api Key"),
//                       prefixIcon: Icon(Icons.lock),
//                       // suffixIcon: InkWell(
//                       //   onTap: () {
//                       //     if (obj.api == true) {
//                       //       obj.api = false;
//                       //     } else {
//                       //       obj.api = true;
//                       //     }
//                       //     obj.update();
//                       //   },
//                       //   child: obj.api
//                       //       ? Icon(CupertinoIcons.eye_slash_fill)
//                       //       : Icon(CupertinoIcons.eye_fill),
//                       // ),
//                     ),
//                     obscuringCharacter: "*",
//                     keyboardType: TextInputType.emailAddress,
//                   ),
//                 ),
//                 ...obj.channal.asMap().entries.map((entry) {
//                   final index = entry.key;
//                   final tab = entry.value;
//                   return Column(
//                     children: [
//                       SizedBox(
//                         child: Padding(
//                           padding: const EdgeInsets.all(12),
//                           child: TextFormField(
//                             onChanged: (value) {
//                               print("adfjsdlfhs");
//                               // obj.updateChannel(index, value);
//                             },
//                             decoration: InputDecoration(
//                               suffixIcon: index == 0
//                                   ? InkWell(
//                                       onTap: () {
//                                         // obj.channal.add("");
//                                         obj.update();
//                                         setState(() {});
//                                       },
//                                       child: Icon(
//                                         Icons.add,
//                                         size: 30,
//                                         color: Colors.black,
//                                       ))
//                                   : InkWell(
//                                       onTap: () {
//                                         // obj.channal.removeAt(index);
//                                         obj.update();
//                                         setState(() {});
//                                       },
//                                       child: Icon(
//                                         Icons.minimize,
//                                         size: 30,
//                                         color: Colors.black,
//                                       )),
//                               border: OutlineInputBorder(),
//                               labelText:
//                                   "Channel ${index + 1}", // Changed label to labelText
//                               prefixIcon: Icon(Icons.lock),
//                             ),
//                             keyboardType: TextInputType.emailAddress,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 15,
//                       ),
//                     ],
//                   );
//                 }),
//                 SizedBox(
//                   width: double.infinity,
//                   child: Padding(
//                     padding: const EdgeInsets.all(15),
//                     child: Material(
//                       color: Color.fromARGB(255, 221, 90, 80),
//                       borderRadius: BorderRadius.circular(10),
//                       child: InkWell(
//                         onTap: () {
//                           // DateTime time = obj.parseTime("12:00 PM");
//                           // print("Time${time}");
//                           if (form.currentState!.validate()) {
//                             // obj.register1(context);
//                           }
//                         },
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(
//                               vertical: 10, horizontal: 30),
//                           child: Center(
//                             child: Text(
//                               "Creat Account",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Already have account ?",
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black54,
//                       ),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         // Navigator.pushReplacement(
//                         //     context,
//                         //     MaterialPageRoute(
//                         //       builder: (context) => LoginScreen(),
//                         //     ));
//                       },
//                       child: Text(
//                         "Sign In",
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Color.fromARGB(255, 221, 90, 80),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: height * 0.1,
//                 )
//               ],
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }
