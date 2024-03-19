import 'dart:async';

import 'package:doc_bookr/model/Doctor_Model.dart';
import 'package:doc_bookr/model/Patient_Model.dart';

import 'package:doc_bookr/onborading_screen1.dart';
import 'package:doc_bookr/screen/doctor/home/dcotor_home_navbar.dart';
import 'package:doc_bookr/screen/patient/home/home_navbar_screen.dart';
import 'package:doc_bookr/staticdata.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
// import 'package:doctor_appointment_app/screens/massage/notification_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyCustomSplashScreen extends StatefulWidget {
  const MyCustomSplashScreen({super.key});

  @override
  _MyCustomSplashScreenState createState() => _MyCustomSplashScreenState();
}

class _MyCustomSplashScreenState extends State<MyCustomSplashScreen>
    with TickerProviderStateMixin {
  double _fontSize = 2;

  double _textOpacity = 0.0;
  double _containerOpacity = 0.0;

  AnimationController? _controller;
  Animation<double>? animation1;

  late final AnimationController _scaleController = AnimationController(
    duration: const Duration(seconds: 4),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _scaleAnimation = CurvedAnimation(
    parent: _scaleController,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    getDataFromSF();
    getToken();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    animation1 = Tween<double>(begin: 40, end: 20).animate(CurvedAnimation(
        parent: _controller!, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {
          _textOpacity = 1.0;
        });
      });

    _controller!.forward();

    Timer(const Duration(seconds: 2), () {
      setState(() {
        _fontSize = 1.06;
      });
    });

    Timer(const Duration(seconds: 2), () {
      setState(() {
        _containerOpacity = 1;
      });
    });

    // Timer(const Duration(seconds: 4), () {
    //   Navigator.pushReplacement(
    //     context,
    //     PageTransition(
    //       const IntroScreen(),
    //     ),
    //   );
    // });

    super.initState();
    // FirebaseMessaging.instance.getInitialMessage().then(
    //   (message) {
    //     if (message != null) {
    //       print(message);
    //     }
    //   },
    // );
    // FirebaseMessaging.onMessage.listen(
    //   (message) {
    //     print("123231${message.data}");
    //     if (message.notification != null) {
    //       // LocalNotificationService.createAndDisplayChatNotification(message);
    //     }
    //   },
    // );
    // FirebaseMessaging.onMessageOpenedApp.listen(
    //   (message) {
    //     print('app open on click');
    //     print(message.notification!.body);
    //     print(message.notification!.title);
    //     print(message.data);

    //     if (message.notification != null) {}
    //   },
    // );
  }

  getToken() {
    // messaging = FirebaseMessaging.instance;
    // messaging.getToken().then((value) {
    //   if (value != null) {
    //     StaticData.token = value;
    //   }

    //   print(value);
    // });
  }

  Future<bool?> getDataFromSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? v = prefs.getString("patient");
    String? v1 = prefs.getString("doctor");
    print("v:$v");
    print("v1:$v1");
    getToken();
    StaticData.patient = v ?? "";
    StaticData.doctor = v1 ?? "";
    if (v != null && v != "") {
      try {
        await fetchpatientByUUID(v, context);
        return true;
      } catch (e) {
        print("error");
      }
    } else if (v1 != null && v1 != "") {
      try {
        await fetchdoctorByUUID(v1, context);
        return true;
      } catch (e) {
        print("error");
      }
    } else {
      Future.delayed(const Duration(milliseconds: 2000), () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const IntroScreen(),
          ),
          (route) => true,
        );
      });
      return false;
    }

    return null;
  }

  bool isLoggedIn = false;
  Future<void> fetchdoctorByUUID(String uuid, context) async {
    DoctorModel? users;
    print("get data");
    try {
      var snapshot =
          await StaticData.firebase.collection("doctor").doc(uuid).get();
      if (snapshot.exists) {
        print("get data");
        users = DoctorModel.fromMap(snapshot.data()!);
        isLoggedIn = true;
        StaticData.doctor = users.id;
        StaticData.doctorModel = users;

        StaticData.updatetokken(
            StaticData.token, users.id.toString(), "doctor");
        Future.delayed(const Duration(milliseconds: 1000), () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const DoctorHomeNavbar(),
            ),
            (route) => true,
          );
        });

        print("Current user: $users");
      } else {
        print('Document with UUID $uuid does not exist.');
        Future.delayed(const Duration(milliseconds: 1000), () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const IntroScreen(),
            ),
            (route) => true,
          );
        });
      }
    } catch (e) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const IntroScreen(),
          ),
          (route) => true,
        );
      });

      print('Error fetching user data: $e');
    }
  }

  Future<void> fetchpatientByUUID(String uuid, context) async {
    PatientModel? users;
    try {
      var snapshot =
          await StaticData.firebase.collection("patient").doc(uuid).get();
      if (snapshot.exists) {
        users = PatientModel.fromMap(snapshot.data()!);
        isLoggedIn = true;
        StaticData.patient = users.id;
        StaticData.patientmodel = users;

        StaticData.updatetokken(
            StaticData.token, users.id.toString(), "patient");
        Future.delayed(const Duration(milliseconds: 2000), () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeNavbarScreen(),
            ),
            (route) => true,
          );
        });

        print("Current user: $users");
      } else {
        print('Document with UUID $uuid does not exist.');
        Future.delayed(const Duration(milliseconds: 1000), () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const IntroScreen(),
            ),
            (route) => true,
          );
        });
      }
    } catch (e) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const IntroScreen(),
          ),
          (route) => true,
        );
      });

      print('Error fetching user data: $e');
    }
  }

  late FirebaseMessaging messaging;

  // void initState() {
  //   super.initState();

  //   _controller =
  //       AnimationController(vsync: this, duration: const Duration(seconds: 3));

  //   animation1 = Tween<double>(begin: 40, end: 20).animate(CurvedAnimation(
  //       parent: _controller!, curve: Curves.fastLinearToSlowEaseIn))
  //     ..addListener(() {
  //       setState(() {
  //         _textOpacity = 1.0;
  //       });
  //     });

  //   _controller!.forward();

  //   Timer(const Duration(seconds: 2), () {
  //     setState(() {
  //       _fontSize = 1.06;
  //     });
  //   });

  //   Timer(const Duration(seconds: 2), () {
  //     setState(() {
  //       _containerOpacity = 1;
  //     });
  //   });

  //   Timer(const Duration(seconds: 4), () {
  //     Navigator.pushReplacement(
  //       context,
  //       PageTransition(
  //         const IntroScreen(),
  //       ),
  //     );
  //   });
  // }

  @override
  void dispose() {
    _controller!.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff0EBE7F),
      body: Stack(
        children: [
          Column(
            children: [
              AnimatedContainer(
                  duration: const Duration(milliseconds: 2000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: height / _fontSize),
              AnimatedOpacity(
                  duration: const Duration(milliseconds: 1000),
                  opacity: _textOpacity,
                  child: const Text(
                    "Doc Bookr",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
          Center(
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 2000),
                curve: Curves.fastLinearToSlowEaseIn,
                opacity: _containerOpacity,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 2000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: height * 0.08,
                  width: width * 0.4,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Colors.white, width: width * 0.005),
                    color: const Color(0xff0EBE7F),
                    borderRadius: BorderRadius.circular(width * 0.03),
                  ),
                  child: Center(
                    child: Text(
                      "Doc Bookr",
                      style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageTransition extends PageRouteBuilder {
  final Widget page;

  PageTransition(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 2000),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
              curve: Curves.fastLinearToSlowEaseIn,
              parent: animation,
            );
            return Align(
              alignment: Alignment.bottomCenter,
              child: SizeTransition(
                sizeFactor: animation,
                axisAlignment: 0,
                child: page,
              ),
            );
          },
        );
}
