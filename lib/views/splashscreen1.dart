import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/views/splash_screen.dart';

import 'package:google_fonts/google_fonts.dart';

import '../Constants/colors.dart';

class SplashScreenOne extends StatefulWidget {
  const SplashScreenOne({Key? key}) : super(key: key);

  @override
  State<SplashScreenOne> createState() => _SplashScreenOneState();
}

class _SplashScreenOneState extends State<SplashScreenOne> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
            () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => SplashScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/Frame.png'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
