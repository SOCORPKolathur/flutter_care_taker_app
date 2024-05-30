import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/views/prefferance_screen.dart';
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
                            padding: const EdgeInsets.only(top: 20),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('assets/Frame.png'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
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
                                    width: width/2.53,
                                    child: Image.asset('assets/girl.png')),
                                Padding(
                                  padding: const EdgeInsets.only(top: 250),
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



                ElevationButton("Get Started",PrefferenceScreen()),
                SizedBox(
                  height: height/37.95,
                ),
                ElevationButton("Sign in",VerificationScreen()),
                 //VerificationScreen
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50,
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
                        padding: const EdgeInsets.only(left: 10),
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
                  height: height/37.95,
                ),
              ],
            ),
          )),
    );
  }
}
