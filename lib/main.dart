import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/views/demo.dart';
import 'package:flutter_care_taker_app/views/health_care_screen.dart';
import 'package:flutter_care_taker_app/views/homepage.dart';
import 'package:flutter_care_taker_app/views/splash_screen.dart';
import 'package:flutter_care_taker_app/views/welcomeback_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_android/geolocator_android.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GeolocatorAndroid.registerWith();
  GeolocatorPlatform.instance = GeolocatorAndroid();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home:CustomTable(),
      home: Demo(),
    );
  }
}
