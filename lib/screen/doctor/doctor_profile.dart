// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:doc_bookr/controller/Doctor/Doctor_Profile_Controller.dart';
import 'package:doc_bookr/customwidgets.dart';
import 'package:doc_bookr/model/Doctor/Doctor_Model.dart';
import 'package:doc_bookr/signup_screen.dart';
import 'package:doc_bookr/staticdata.dart';

class DoctorProfileScreen extends StatefulWidget {
  final DoctorModel? doctorModel;
  const DoctorProfileScreen({
    Key? key,
    this.doctorModel,
  }) : super(key: key);

  @override
  State<DoctorProfileScreen> createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
  var height, width;
  List<String> list = [
    "Select Category",
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
  void initState() {
    Get.put(DoctorProfileController());
    print("docot data    ${widget.doctorModel}");
    widget.doctorModel == null
        ? DoctorProfileController.to.initalizedata(StaticData.doctorModel!)
        : DoctorProfileController.to.initalizedata(widget.doctorModel!);
    DoctorProfileController.to.clearprofile();

    print("2354565867897909808    ${widget.doctorModel}");
    super.initState();
  }

  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return GetBuilder<DoctorProfileController>(builder: (obj) {
      return Scaffold(
        body: SizedBox(
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.04,
                ),

                Container(
                  height: height * 0.07,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: width * 0.02,
                        spreadRadius: width * 0.001,
                      ),
                    ],
                  ),
                  child: Row(
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
                        "Profile",
                        style: TextStyle(
                          fontSize: height * 0.03,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: height * 0.02,
                ),

                Container(
                  height: height * 0.25,
                  width: width,
                  color: Colors.white,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: obj.hpickedFile != null
                            ? Container(
                                height: height * 0.15,
                                width: width * 0.3,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: FileImage(
                                            File(obj.hpickedFile!.path)),
                                        fit: BoxFit.fill)),
                                // radius: 75,
                              )
                            : CircleAvatar(
                                radius: width * 0.15,
                                backgroundImage:
                                    NetworkImage(obj.image.toString()),
                              ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: height * 0.15, left: width * 0.55),
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context1) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const ListTile(
                                      title: Text("Profile photo"),
                                    ),
                                    ListTile(
                                      leading: CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Colors.grey[300],
                                        child: Icon(
                                          Icons.add_a_photo,
                                          color: Color(0xff0EBE7F),
                                          size: width * 0.05,
                                        ),
                                      ),
                                      title: const Text("Camera"),
                                      onTap: () {
                                        obj.pickImage(ImageSource.camera);
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      leading: CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Colors.grey.shade300,
                                        child: Icon(
                                          Icons.photo,
                                          color: Color(0xff0EBE7F),
                                          size: width * 0.05,
                                        ),
                                      ),
                                      title: const Text("Gallery"),
                                      onTap: () {
                                        obj.pickImage(ImageSource.gallery);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const CircleAvatar(
                            backgroundColor: Color(0xff0EBE7F),
                            child: Icon(
                              Icons.photo_camera,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            obj.name.text,
                            style: TextStyle(
                                fontSize: width * 0.05,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  height: height * 0.2,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xff0EBE4f),
                          Color(0xff0EBE7F),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(width * 0.05),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: width * 0.01,
                          spreadRadius: 4,
                        ),
                      ]),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    controller: obj.name,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text(" Name"),
                      prefixIcon: Icon(Icons.person_outline),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your  Name';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    controller: obj.phonenumber,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Phone Number"),
                      prefixIcon: Icon(Icons.phone),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your Phone No';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    controller: obj.address,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Location"),
                      prefixIcon: Icon(Icons.phone),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your Location';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    controller: obj.bio,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Bio"),
                      prefixIcon: Icon(Icons.phone),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Bio';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    controller: obj.fee,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Fee"),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Fee';
                      }

                      try {
                        double fee = double.parse(value);

                        if (fee < 0) {
                          return 'Fee must be a non-negative value';
                        }

                        return null;
                      } catch (e) {
                        return 'Invalid fee format. Please enter a valid number.';
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    controller: obj.about,
                    minLines: 1,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("About"),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your About';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    controller: obj.specilest,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Experience"),
                      prefixIcon: Icon(Icons.phone),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your Experience';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  height: height * 0.073,
                  width: width * 0.94,
                  decoration: BoxDecoration(
                      // color: Colors.amber,
                      border:
                          Border.all(color: Colors.black, width: width * 0.002),
                      borderRadius: BorderRadius.circular(width * 0.01)),
                  child: DropdownButton<String>(
                    alignment: Alignment.centerLeft,
                    value: obj.dropdown,
                    items: list.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value, // Assigning unique values from the list
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      obj.dropdownupdate(value!);
                    },
                    underline: Container(),
                    icon: Icon(Icons.arrow_drop_down),
                    isExpanded: true,
                    elevation: 2,
                    style:
                        TextStyle(color: Colors.black, fontSize: width * 0.04),
                    dropdownColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    controller: obj.email,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Email Address"),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please enter your E-mail';
                      } else if (EmailValidator.validate(obj.email.text) ==
                          false) {
                        return 'Please Enter Correct E-mail';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    obscureText: obj.passToggle ? true : false,
                    controller: obj.password,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      label: const Text("Enter Password"),
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: InkWell(
                        onTap: () {
                          if (obj.passToggle == true) {
                            obj.passToggle = false;
                          } else {
                            obj.passToggle = true;
                          }
                          obj.update();
                        },
                        child: obj.passToggle
                            ? const Icon(CupertinoIcons.eye_slash_fill)
                            : const Icon(CupertinoIcons.eye_fill),
                      ),
                    ),
                    obscuringCharacter: "*",
                    validator: (String? value) {
                      RegExp regex = RegExp(r'^(?=.*?[!@#\$&*~]).{4,}$');
                      if (value!.isEmpty) {
                        return 'Please enter Password';
                      } else {
                        if (value.length < 5) {
                          return ("Password Must be more than 5 characters");
                        } else if (!regex.hasMatch(value)) {
                          return ("Password should contain Special character or number");
                        } else {
                          return null;
                        }
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: CustomWidget.largeText("   Select Available Time:",
                        height: 0.5)),
                // SizedBox(height: height*0.01,)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: height * 0.07,
                      width: width * 0.4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () async {
                            TimeOfDay? selectedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );

                            if (selectedTime != null) {
                              obj.startTime =
                                  " ${roundToNearestHalfHour(selectedTime).format(context)}";
                              obj.update();
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Apptheme.primary,
                              borderRadius: BorderRadius.circular(21),
                            ),
                            child: Center(
                              child: Text(
                                obj.startTime != null
                                    ? obj.startTime.toString()
                                    : "Start Time",
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.07,
                      width: width * 0.4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () async {
                            TimeOfDay? selectedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );

                            if (selectedTime != null) {
                              obj.endTime =
                                  "${roundToNearestHalfHour(selectedTime).format(context)}";
                              // obj.endTime =
                              //     " ${selectedTime.format(context)}";
                              obj.update();
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Apptheme.primary,
                              borderRadius: BorderRadius.circular(21),
                            ),
                            child: Center(
                              child: Text(
                                obj.endTime != null
                                    ? obj.endTime.toString()
                                    : "End Time",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: CustomWidget.largeText(
                        "   Select Max Appointment Duration:",
                        height: 0.5)),
                SizedBox(
                  height: height * 0.11,
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      itemCount: obj.time.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 18.0,
                              mainAxisSpacing: 18.0,
                              childAspectRatio: 3),
                      itemBuilder: (context1, i) {
                        return InkWell(
                          onTap: () {
                            obj.updateduration(i);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: obj.duration == i
                                    ? Apptheme.primary
                                    : Colors.grey[300],
                                borderRadius: BorderRadius.circular(21)),
                            child: Center(
                                child: Text(
                              "${obj.time[i]} Minute",
                              style: TextStyle(
                                  color: obj.duration == i
                                      ? Colors.white
                                      : Apptheme.primary),
                            )),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                InkWell(
                  onTap: () {
                    widget.doctorModel == null
                        ? obj.updateprofile()
                        : obj.adminUpdateprofile(context);
                  },
                  child: Container(
                    height: height * 0.07,
                    width: width * 0.9,
                    decoration: BoxDecoration(
                        color: const Color(0xff0EBE7F),
                        borderRadius: BorderRadius.circular(width * 0.03)),
                    child: Center(
                      child: Text(
                        "UpDate ",
                        style: TextStyle(
                            fontSize: width * 0.05,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.1,
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
