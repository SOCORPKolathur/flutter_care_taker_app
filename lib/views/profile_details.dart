import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/views/searchscreen.dart';
import 'package:google_fonts/google_fonts.dart';


import 'navbar.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({Key? key}) : super(key: key);

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              Container(
                width: width / 0.98,
                child: Image.asset('assets/Ellipse.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 300),
                child: Container(
                  width: width / 7.84,
                  height: height / 16.86,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child:  IconButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> NavBar()));
                  }, icon: Icon(Icons.menu)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 15),
                child: Container(
                  width: width / 7.84,
                  height: height / 16.86,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: IconButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchScreen()));
                  }, icon: Icon(Icons.arrow_back)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60, left: 95),
                child: Text(
                  'Profile details',
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 120, left: 15),
                child: Container(
                    height: height / 3.79,
                    width: width / 1.08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffECF5FF),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 15),
                          child: Stack(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 80,top: 15),
                                    child: Text(
                                      'Dr. David Green',
                                      style: GoogleFonts.openSans(
                                        color: Color(0xff18353F),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25),
                                    child: Container(
                                      height: height / 25.3,
                                      width: width / 2.61,
                                      child: Row(children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.person, color: Color(0xff18353F).withOpacity(.6),size: 16,)),
                                        Text(
                                          'Nurologist',
                                          style: GoogleFonts.openSans(

                                            color: Color(0xff18353F).withOpacity(.6),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        )
                                      ]),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        AssetImage('assets/doctor_person.png'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 200,bottom: 10
                                    ),
                                    child: Container(
                                      height: height / 18.97,
                                      width: width / 9.8,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.white,
                                      ),
                                      child: Icon(Icons.save),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 6),
                          child: Text(
                              'Dr. David green is a board-certified neurologist with over 15 years of experience in diagnosing and treating neurological disorders',
                            style:GoogleFonts.openSans(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Color(0xff18353F).withOpacity(.8),
                            ) ,
                          textAlign: TextAlign.start,),
                        ),
                      ],
                    )),
              )
            ],
          ),
          SizedBox(
            height: height / 25.3,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 220),
            child: Text(
              'Overview',
              style: GoogleFonts.openSans(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Color(0xff18353F),
              ),
            ),
          ),
          Container(
            height: height / 3.16, // Set the height here
            width:
                double.infinity,
            // Set the width to occupy the available space
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Table(


                border:
                    TableBorder.all(
                      color: Color(0xff18353F).withOpacity(.3),
                      borderRadius: BorderRadius.circular(25),


                    ),
                children: [
                  TableRow(children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, right: 68),
                          child: Text(
                            'Work',
                            style: GoogleFonts.openSans(
                              color: Color(0xff18353F),
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            top: 10,
                            bottom: 5,
                          ),
                          child: Row(children: [
                            Icon(
                              Icons.person,
                              color: Color(0xff2F649A),
                            ),
                            SizedBox(
                              width: width/39.2,
                            ),
                            Text(
                              'Doctor',
                              style: GoogleFonts.openSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff18353F).withOpacity(.4),
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 10),
                          child: Text(
                            'Job category',
                            style: GoogleFonts.openSans(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff18353F),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 10, bottom: 6),
                          child: Row(children: [
                            Icon(
                              Icons.person,
                              color: Color(0xff2F649A),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Nuerologist',
                              style: GoogleFonts.openSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff18353F).withOpacity(.4),
                              ),
                            )
                          ]),
                        ),
                      ],
                    ),
                  ]),
                  TableRow(children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, right: 15),
                          child: Text(
                            'Experience',
                            style: GoogleFonts.openSans(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff18353F),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 10, bottom: 6),
                          child: Row(children: [
                            Icon(
                              Icons.calendar_today_rounded,
                              color: Color(0xff2F649A),
                            ),
                            SizedBox(
                              width: width / 39.2,
                            ),
                            Text(
                              '5 Years',
                              style: GoogleFonts.openSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff18353F).withOpacity(.4),
                              ),
                            )
                          ]),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, right: 13),
                          child: Text(
                            'Work type',
                            style: GoogleFonts.openSans(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff18353F),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 26, top: 10, bottom: 6),
                          child: Row(children: [
                            Icon(
                              Icons.calendar_today,
                              color: Color(0xff2F649A),
                            ),
                            SizedBox(
                              width: width / 39.2,
                            ),
                            Text(
                              'Day',
                              style: GoogleFonts.openSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff18353F).withOpacity(.4),
                              ),
                            )
                          ]),
                        ),
                      ],
                    ),
                  ]),
                  TableRow(children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, right: 25),
                          child: Text(
                            'Language',
                            style: GoogleFonts.openSans(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff18353F),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 25, top: 10, bottom: 10),
                          child: Row(children: [
                            Icon(
                              Icons.translate,
                              color: Color(0xff2F649A),
                            ),
                            SizedBox(
                              width: width / 39.2,
                            ),
                            Text(
                              'Tamil',
                              style: GoogleFonts.openSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff18353F).withOpacity(.4),
                              ),
                            )
                          ]),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, right: 25),
                          child: Text(
                            'Address',
                            style: GoogleFonts.openSans(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff18353F),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 26, top: 10, bottom: 10),
                          child: Row(children: [
                            Icon(
                              Icons.location_on,
                              color: Color(0xff2F649A),
                            ),
                            SizedBox(
                              width: width / 39.2,
                            ),
                            Text(
                              'Chennai',
                              style: GoogleFonts.openSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff18353F).withOpacity(.4),
                              ),
                            )
                          ]),
                        ),
                      ],
                    ),
                  ]),
                ],
              ),
            ),
          ),
          SizedBox(
            height: height / 8.43,
          ),
          Container(
            height: height / 15.18,
            width: width / 1.15,
            decoration: BoxDecoration(
              color: Color(0xff2F649A),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'Contact ',
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Color(0xffFFFFFF),
                ),
              ),
            ),
          ),
          SizedBox(
            height: height /18.97 ,
          ),

        ]),
      ),
    );
  }
}
