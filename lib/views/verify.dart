import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/views/health_care_screen.dart';
import 'package:flutter_care_taker_app/views/phone_page.dart';
import 'package:flutter_care_taker_app/views/success_page.dart';
import 'package:flutter_care_taker_app/views/verification_successfull.dart';
import 'package:flutter_care_taker_app/views/welcomeback_screen.dart';

import 'package:flutterotpfield/flutterotpfield.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_care_taker_app/Constants/colors.dart';

import '../Widgets/custombutton.dart';

class VerifyOtp extends StatefulWidget {
  final String name;
  final String aadhar;
  final String phonenumber;

  VerifyOtp(this.name, this.aadhar, this.phonenumber);

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  sendOtp() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+91${widget.phonenumber}",
      verificationCompleted: (PhoneAuthCredential credential) {
        print("Verification Complete");
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == "Invalid Username") {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String VerificationId, int? resendToken) {
        setState(() {
          verificationid = VerificationId;
        });
      },
      codeAutoRetrievalTimeout: (String VerificationId) {},
      timeout: Duration(milliseconds: 300),
    );
  }

  var verificationid;
  @override
  void initState() {
    sendOtp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: height / 2.37,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(
                              MediaQuery.of(context).size.width, 180.0)),
                    ),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.only(right: width/1.28, left: width/36, top: height/50.26),
                    child: Container(
                      width: width/7.2,
                      height: height / 15.08,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.arrow_back)),
                    ),
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          print(width);
                          print(height);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: height/25.13),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/Frame.png'),
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: height/75.4, bottom: width/36),
                        child: Text('Happy CareTakers',
                            style: GoogleFonts.openSans(
                                color: Color(0xffFFFFFF),
                                fontSize: 20,
                                fontWeight: FontWeight.w700)),
                      ),
                      Container(
                          width: width / 0.78,
                          height: height / 4.21,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Image.asset('assets/verification.png'),
                            ],
                          )),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: height / 37.95,
              ),
              Text(
                'Verification code',
                style: GoogleFonts.openSans(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: height / 75.9,
              ),
              Text(
                'Please enter the verification code sent to\nyour mobile number',
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${widget.phonenumber}',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700)),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => WelcomeBackScreen()));
                      },
                      icon: Icon(
                        Icons.edit,
                        color: primaryColor,
                      ),),
                ],
              ),
              SizedBox(height: height / 37.95),
              FlutterOtpField(
                inputFieldLength: 6,
                spaceBetweenFields: 6,
                inputDecoration: InputDecoration(
                    constraints: const BoxConstraints(maxHeight: 40),
                    fillColor: Colors.transparent,
                    filled: true,
                    hintText: " ",
                    counterText: "",
                    hintStyle: const TextStyle(
                        color: Color(0xff656565),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xff969696), width: 1.0),
                        borderRadius: BorderRadius.circular(30)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xff969696), width: 1.0),
                        borderRadius: BorderRadius.circular(30))),
                onValueChange: (String value) {
                  print("otp changed $value");
                },
                onCompleted: (String value) {
                  setState(() {
                    otp = value;
                  });
                  print("otp  $value");
                },
              ),
              SizedBox(
                height: height / 18.97,
              ),
              ElevatedButton(
                onPressed: () {
                  verifyotp();
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(width/1.05, height/15.08),
                  backgroundColor: primaryColor,
                ),
                child: Text(
                  "Submit OTP",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String otp = "";
  String option = "";
  verifyotp() {
    FirebaseAuth.instance
        .signInWithCredential(PhoneAuthProvider.credential(
            verificationId: verificationid, smsCode: otp))
        .then((value) {
      if (value.user != null) {
        print(FirebaseAuth.instance.currentUser!.uid);

        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => VerificationSuccessfully(
                widget.name,
                widget.aadhar,
                widget.phonenumber,
                FirebaseAuth.instance.currentUser!.uid)));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text(' Successfully Verify OTP')),
        );
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid OTP')),
        );
      }
    });
  }
}
