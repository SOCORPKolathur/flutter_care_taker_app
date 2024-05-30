import 'dart:async';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'LanguageScreen.dart';

class SecondSplashScreen extends StatefulWidget {
  const SecondSplashScreen({Key? key}) : super(key: key);

  @override
  State<SecondSplashScreen> createState() => _SecondSplashScreenState();
}

class _SecondSplashScreenState extends State<SecondSplashScreen> {
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
      backgroundColor: Color(0xffFFFFFF),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Padding(
               padding: const EdgeInsets.all(80),
               child: Image(image: AssetImage('assets/Frame.png'),),
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
