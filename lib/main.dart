import 'package:doc_bookr/screen/AppTheme/AppTheme.dart';

import 'package:doc_bookr/screen/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Apptheme.primary, statusBarBrightness: Brightness.dark));
  // await tz.initializeTimeZone();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xff0EBE7F),
        ),
        useMaterial3: true,
      ),
      home: const MyCustomSplashScreen(),
    );
  }
}
