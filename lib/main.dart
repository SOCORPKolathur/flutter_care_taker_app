import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/views/buynow.dart';
import 'package:flutter_care_taker_app/views/chat_screen.dart';
import 'package:flutter_care_taker_app/views/chatting_page.dart';
import 'package:flutter_care_taker_app/views/demo.dart';
import 'package:flutter_care_taker_app/views/first_screen.dart';
import 'package:flutter_care_taker_app/views/prefferance_screen.dart';
import 'package:flutter_care_taker_app/views/product_screen.dart';
import 'package:flutter_care_taker_app/views/productdetail_screen.dart';
import 'package:flutter_care_taker_app/views/profile_details.dart';
import 'package:flutter_care_taker_app/views/searchscreen.dart';
import 'package:flutter_care_taker_app/views/splash_screen.dart';
import 'package:flutter_care_taker_app/views/testdemo.dart';



void main() {
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
      home:SplashScreen(),
    );
  }
}


