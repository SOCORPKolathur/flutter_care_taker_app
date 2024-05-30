import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/Constants/colors.dart';

import 'package:google_fonts/google_fonts.dart';

import 'LanguageScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LanguageScreen())));
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
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text('Happy CareTakers',
                    style: GoogleFonts.openSans(
                        color: Color(0xffFFFFFF),
                        fontSize: 20,
                        fontWeight: FontWeight.w700)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
