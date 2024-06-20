import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info/device_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/Constants/colors.dart';
import 'package:flutter_care_taker_app/views/homepage.dart';
import 'package:flutter_care_taker_app/views/role_page.dart';
import 'package:flutter_care_taker_app/views/welcome_homepage.dart';

import 'package:google_fonts/google_fonts.dart';

import 'LanguageScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String _deviceID = '';

  Future<void> _getDeviceID() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    setState(() {
      _deviceID = androidInfo.androidId;
    });
  }

  @override
  void initState() {
    _getDeviceID();
    super.initState();
    userdat();
  }

  userdat() async {

    Timer(Duration(seconds: 5), () async {
      var user = await FirebaseFirestore.instance
          .collection("Deviceid")
          .where("deviceid", isEqualTo: _deviceID)
          .get();
      if (FirebaseAuth.instance.currentUser != null) {
        var document = await FirebaseFirestore.instance
            .collection("JobSeeking")
            .where("userid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .get();
        if (document.docs.length > 0) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeScreen()));
        } else {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomePage()));
        }
      } else if (user.docs.length > 0) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LanguageScreen()));
      }
    });
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
