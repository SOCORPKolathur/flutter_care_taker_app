import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/views/phone_page.dart';
import 'package:flutter_care_taker_app/views/homepage.dart';
import 'package:flutter_care_taker_app/views/verification_code_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_care_taker_app/Constants/colors.dart';

import '../Widgets/custombutton.dart';

class HealthCareScreen extends StatefulWidget {
  const HealthCareScreen({Key? key}) : super(key: key);

  @override
  State<HealthCareScreen> createState() => _HealthCareScreenState();
}

class _HealthCareScreenState extends State<HealthCareScreen> {
  String _deviceID = '';
  @override
  void initState() {
    super.initState();
    _getDeviceID();
  }

  Future<void> _getDeviceID() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    setState(() {
      _deviceID = androidInfo.androidId;
    });
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
                  height: height / 2.61,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(
                            MediaQuery.of(context).size.width, 160.0)),
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
                        padding: EdgeInsets.only(top: height / 37.7),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('assets/Frame.png'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height / 75.4),
                      child: Text('Happy CareTakers',
                          style: GoogleFonts.openSans(
                              color: Color(0xffFFFFFF),
                              fontSize: 20,
                              fontWeight: FontWeight.w700)),
                    ),
                    Container(
                        width: width / 1.56,
                        height: height / 2.16,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset('assets/Vector.png'),
                            Container(
                                width: width / 2.53,
                                child: Image.asset('assets/girl.png')),
                            Padding(
                              padding: EdgeInsets.only(top: height / 3.01),
                              child: Text(
                                'Healthy gets easier now on your hand',
                                style: GoogleFonts.openSans(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ],
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(width / 1.2, height / 18.85),
                backgroundColor: primaryColor,
              ),
              onPressed: () {
                FirebaseFirestore.instance
                    .collection("Deviceid")
                    .doc(_deviceID)
                    .set({
                  "deviceid": _deviceID,
                  "token": "",
                  "timestamp": DateTime.now().millisecondsSinceEpoch
                }).then((value) {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => HomePage()),
                    (Route<dynamic> route) => false,
                  );
                }).catchError((error) {
                  print("Error setting document: $error");
                  // Handle error scenarios
                });
              },
              child: Text(
                "Get Started",
                style: GoogleFonts.openSans(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            SizedBox(
              height: height / 37.95,
            ),
            ElevationButton("Sign in", Phonepage()),

            //VerificationScreen
            Padding(
              padding: EdgeInsets.only(
                top: height / 15.08,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don’t have an account?',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700)),
                  Padding(
                    padding: EdgeInsets.only(left: width / 36),
                    child: Text('Sign up',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                            color: primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w700)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height / 37.95,
            ),
          ],
        ),
      )),
    );
  }
}
