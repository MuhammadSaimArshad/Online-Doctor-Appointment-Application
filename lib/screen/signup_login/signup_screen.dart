import 'package:doc_bookr/controller/Signup_Controller.dart';
import 'package:doc_bookr/screen/AppTheme/AppTheme.dart';
import 'package:doc_bookr/screen/custom_widgets/customwidgets.dart';

import 'package:doc_bookr/screen/signup_login/signin_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
    Get.put(SignupController());
    SignupController.to.dropdown = "Select Category";
    SignupController.to.update();
    super.initState();
  }

  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GetBuilder<SignupController>(builder: (obj) {
        return Container(
          height: height,
          width: width,
          color: Colors.white,
          child: ListView(
            children: [
              SizedBox(
                height: height * 0.03,
              ),
              Container(
                height: height * 0.15,
                width: width,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create A Account",
                      style: TextStyle(
                        fontSize: width * 0.07,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Easy Appointments And Chat with Doctor \n Personal and Family Solve Health Issue.",
                      style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      obj.updateindex(0);
                    },
                    child: Container(
                        height: height * 0.15,
                        width: width * 0.3,
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(width * 0.02),
                            border: Border.all(
                                width: width * 0.005,
                                color: obj.index == 0
                                    ? const Color(0xff0EBE7F)
                                    : Colors.grey)),
                        child: Column(
                          children: [
                            Image(
                                height: height * 0.11,
                                image: const AssetImage("images/image5.png")),
                            const Text("Doctor")
                          ],
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      obj.updateindex(1);
                    },
                    child: Container(
                        height: height * 0.15,
                        width: width * 0.3,
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(width * 0.02),
                            border: Border.all(
                                width: width * 0.005,
                                color: obj.index == 1
                                    ? const Color(0xff0EBE7F)
                                    : Colors.grey)),
                        child: Column(
                          children: [
                            Image(
                                height: height * 0.11,
                                image: const AssetImage("images/image4.png")),
                            const Text("Patient")
                          ],
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
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
              if (obj.index == 0)
                SizedBox(
                  height: height * 0.01,
                ),
              if (obj.index == 0)
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
              if (obj.index == 0)
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
              if (obj.index == 0)
                SizedBox(
                  height: height * 0.01,
                ),
              if (obj.index == 0)
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
              if (obj.index == 0)
                SizedBox(
                  height: height * 0.01,
                ),
              if (obj.index == 0)
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
              if (obj.index == 0)
                SizedBox(
                  height: height * 0.01,
                ),
              if (obj.index == 0)
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    controller: obj.experience,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Experience In Year"),
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
              if (obj.index == 0)
                SizedBox(
                  height: height * 0.004,
                ),
              if (obj.index == 0)
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    height: height * 0.073,
                    width: width * 0.9,
                    decoration: BoxDecoration(
                        // color: Colors.amber,
                        border: Border.all(
                            color: Colors.black, width: width * 0.002),
                        borderRadius: BorderRadius.circular(width * 0.01)),
                    child: DropdownButton<String>(
                      alignment: Alignment.center,
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
                      style: TextStyle(
                          fontSize: width * 0.04, color: Colors.black),
                      dropdownColor: Colors.white,
                    ),
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
              if (obj.index == 0)
                Align(
                    alignment: Alignment.centerLeft,
                    child: CustomWidget.largeText("   Select Available Time:",
                        height: 0.5)),
              if (obj.index == 0)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: height * 0.08,
                      width: width * 0.3,
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
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.08,
                      width: width * 0.3,
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
              SizedBox(
                height: height * 0.01,
              ),
              if (obj.index == 0)
                Align(
                    alignment: Alignment.centerLeft,
                    child: CustomWidget.largeText(
                        "   Select Max Appointment Duration:",
                        height: 0.5)),
              if (obj.index == 0)
                SizedBox(
                    height: height * 0.11,
                    width: width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        itemCount: obj.time.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 18.0,
                            mainAxisSpacing: 18.0,
                            childAspectRatio: 3),
                        itemBuilder: (context, i) {
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
                    )),

              InkWell(
                onTap: () {
                  obj.index == 0
                      ? obj.register(context)
                      : obj.register1(context);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => Home_Navbar_Screen(),
                  //     ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    height: height * 0.07,
                    width: width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.02),
                      color: Color(0xff0EBE7F),
                    ),
                    child: Center(
                      child: Text(
                        "SignUp",
                        style: TextStyle(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: height * 0.0001,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have account ?",
                    style: TextStyle(
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SigninScreen(),
                          ));
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff0EBE7F),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: height * 0.02,
              ),
            ],
          ),
        );
      }),
    );
  }
}

TimeOfDay roundToNearestHalfHour(TimeOfDay timeOfDay) {
  int roundedHour = timeOfDay.hour;
  int roundedMinute = (timeOfDay.minute / 30).round() * 30;

  if (roundedMinute == 60) {
    roundedMinute = 0;
    roundedHour++;
  }

  return TimeOfDay(hour: roundedHour, minute: roundedMinute);
}
