import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/views/health_care_screen.dart';
import 'package:flutter_care_taker_app/views/homepage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_care_taker_app/Constants/colors.dart';

class SuccessfullPage extends StatefulWidget {
  const SuccessfullPage({Key? key}) : super(key: key);

  @override
  State<SuccessfullPage> createState() => _SuccessfullPageState();
}

class _SuccessfullPageState extends State<SuccessfullPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: width/1.8, top:height/9.42),
                    child: Container(
                        height: height / 18.97,
                        width: width / 9.8,
                        child: Image.asset('assets/success_tick.png')),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: width/1.8,top:height/9.42),
                    child: Container(
                        height: height / 18.97,
                        width: width / 9.8,
                        child: Image.asset('assets/success_tick.png')),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(
                      top: height/37.7,
                    ),
                    child: Container(
                        height: height / 18.97,
                        width: width / 9.8,
                        child: Image.asset('assets/success_tick.png')),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(
                      top: height/18.85,
                    ),
                    child: Container(
                        width: width / 2.53,
                        height: height / 2.45,
                        child: Image.asset('assets/shield.png')),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(
                      top: height/18.85,
                    ),
                    child: Container(
                        width: width / 4.74,
                        height: height / 2.45,
                        child: Image.asset('assets/tick.png')),
                  ),
                ],
              ),
              Text(
                'Successfully !',
                style: GoogleFonts.openSans(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                'Your account has been\n created',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: height / 37.95,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => HomePage()));
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(340, 50),
                  backgroundColor: primaryColor,
                ),
                child: Text(
                  'Done',
                  style: GoogleFonts.openSans(
                      color: Color(0xffFFFFFF),
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
