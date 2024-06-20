import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/views/LanguageScreen.dart';
import 'package:flutter_care_taker_app/views/profile_setup_screen.dart';
import 'package:flutter_care_taker_app/views/splash_screen.dart';
import '../Widgets/custombutton.dart';

class VerificationSuccessfully extends StatefulWidget {
  final String name;
  final String aadhar;
  final String phonenumber;
  final String uid;
  VerificationSuccessfully(this.name, this.aadhar, this.phonenumber, this.uid);

  @override
  State<VerificationSuccessfully> createState() =>
      _VerificationSuccessfullyState();
}

class _VerificationSuccessfullyState extends State<VerificationSuccessfully> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: height / 3.77,
                width: width / 1.8,
                child: Image.asset('assets/Verified.png'),
              ),
              SizedBox(
                height: height / 37.7,
              ),
              Text(
                'Verification Successful',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff18353F)),
              ),
              SizedBox(
                height: height / 75.4,
              ),
              Text(
                '"Thank you for verifying your identity.\n Your account is now secure.."',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: height / 10.77,
              ),
              ElevationButton(
                  "Continue",
                  ProfileSetUpScreen(widget.name, widget.aadhar,
                          widget.phonenumber, widget.uid)),
            ],
          ),
        ),
      ),
    );
  }
}
