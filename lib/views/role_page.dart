import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/Widgets/custombutton.dart';
import 'package:flutter_care_taker_app/views/demo.dart';
import 'package:flutter_care_taker_app/views/health_care_screen.dart';
import 'package:flutter_care_taker_app/views/prefferance_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_care_taker_app/Constants/colors.dart';



class RolePageScreen extends StatefulWidget {
  const RolePageScreen({Key? key}) : super(key: key);

  @override
  State<RolePageScreen> createState() => _RolePageScreenState();
}

class _RolePageScreenState extends State<RolePageScreen> {
  String option = " ";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
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
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                            width: width/1.4,
                            height: height/3.45,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset('assets/Vector.png'),
                                Container(
                                    width: width/1.96,
                                    child: Image.asset('assets/Select-bro.png')),
                              ],
                            )),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                'Choose your role',
                style: GoogleFonts.openSans(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'Select the option that best describes you',
                  style:GoogleFonts.openSans(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 30),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          option = "job";

                        });
                      },
                      child: Stack(
                        children: [
                          Container(
                            width: width/2.61,
                            height: height/5.06,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: option == "job"
                                      ? primaryColor
                                      : Colors.black, // Here we checked!
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: SizedBox.fromSize(
                                      size: Size.fromRadius(30),
                                      child: Image(
                                        image: AssetImage(
                                            'assets/looking_job.png'),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    'Looking for a job',
                                    style: GoogleFonts.openSans(
                                      color: option == "job"
                                          ? primaryColor
                                          : Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: width/19.6,
                    ),
                    Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              option = "person";
                            });
                          },
                          child: Container(
                            width: width/2.61,
                            height: height/5.06,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: option == "person"
                                      ? primaryColor
                                      : Colors.black, // Here we checked!
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: SizedBox.fromSize(
                                      size: Size.fromRadius(30),
                                      child: Image(
                                        image:
                                            AssetImage('assets/two_person.png'),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    'Looking for a\n  Person',
                                    style: GoogleFonts.openSans(
                                      color: option == "person"
                                          ? primaryColor
                                          : Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height/30.36,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ElevationButton("Continue",

                    option == "person" ?

                    HealthCareScreen() : ProfileSetUpScreen()),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
