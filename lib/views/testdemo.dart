import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/views/profile_details.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constants/colors.dart';
import 'navbar.dart';

class ContainnerList extends StatefulWidget {
  const ContainnerList({Key? key}) : super(key: key);

  @override
  State<ContainnerList> createState() => _ContainnerListState();
}

class _ContainnerListState extends State<ContainnerList> {
  String option = "Doctors";
  String workcategory = "Surgeon";
  String worktype = "Day";
  String experience = "0 - 1 year";
  String language = "Tamil";

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
                padding: const EdgeInsets.only(top: 46, left: 295),
                child: Container(
                  width: width / 6.63,
                  height: height / 15.18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                  ),
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => NavBar()));
                      },
                      icon: Icon(Icons.menu)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 55, left: 15),
                child: Text(
                  'Hello , Bharath',
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xffFFFFFF).withOpacity(.6),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 85, left: 15),
                child: Text(
                  'Professionals near you',
                  style: GoogleFonts.openSans(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffFFFFFF),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Row(
                    children: [
                      SizedBox(
                        width: width / 19.6,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            option = "Doctors";
                          });
                        },
                        child: Container(
                          height: height / 18.97,
                          width: width / 3.01,
                          decoration: BoxDecoration(
                              color: option == "Doctors"
                                  ? primaryColor
                                  : Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: height / 31.62,
                                width: width / 16.33,
                                child: Image.asset(
                                  'assets/doctor.png',
                                  color: option == "Doctors"
                                      ? Colors.white
                                      : Color(0xff2F649A),
                                ),
                              ),
                              // SizedBox(
                              //   width: width/9.2,
                              // ),
                              Text(
                                'Doctors',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w600,
                                  color: option == "Doctors"
                                      ? Colors.white
                                      : Color(0xff2F649A).withOpacity(.5),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width / 39.2,
                      ),
                      Container(
                        height: height / 18.97,
                        width: width / 3.01,
                        decoration: BoxDecoration(
                            color: option == "Nurse"
                                ? primaryColor
                                : Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: height / 31.62,
                              width: width / 16.33,
                              child: Image.asset(
                                'assets/Nurse.png',
                                color: option == "Nurse"
                                    ? Colors.white
                                    : Color(0xff2F649A),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  option = "Nurse";
                                });
                              },
                              child: Text(
                                'Nurse',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.openSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: option == "Nurse"
                                      ? Colors.white
                                      : Color(0xff2F649A).withOpacity(.5),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: width / 39.2,
                      ),
                      Container(
                        height: height / 18.97,
                        width: width / 3.01,
                        decoration: BoxDecoration(
                            color: option == "CareTaker"
                                ? primaryColor
                                : Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: height / 31.62,
                              width: width / 16.33,
                              child: Image.asset(
                                'assets/Caretaker.png',
                                color: option == "CareTaker"
                                    ? Colors.white
                                    : Color(0xff2F649A),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  option = "CareTaker";
                                });
                              },
                              child: Text(
                                'CareTaker',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: option == "CareTaker"
                                      ? Colors.white
                                      : Color(0xff2F649A).withOpacity(.5),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: width / 39.2,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height / 37.95,
              ),
              Row(
                children: [
                  SizedBox(
                    width: width / 19.6,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ContainnerList()));
                      });
                    },
                    child: Container(
                      height: height / 16.86,
                      width: width / 1.45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade100,
                      ),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.search,
                                color: Colors.grey,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: Text(
                              'Search here...',
                              style: GoogleFonts.openSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff18353F),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width / 19.6,
                  ),
                  Container(
                    height: height / 15.18,
                    width: width / 7.84,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset('assets/Slider.png'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height / 37.95,
                width: width / 1.12,
                child: Divider(
                  color: Colors.grey.shade300,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 170),
            child: Text('Work category',
                style: GoogleFonts.manrope(
                    color: Color(0xff18353F),
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 15,
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        workcategory = "Surgeon";
                      });
                    },
                    child: Container(
                      height: height / 16.86,
                      width: width / 3.56,
                      decoration: BoxDecoration(
                          color: workcategory == "Surgeon"
                              ? primaryColor
                              : Colors.transparent,
                          border: Border.all(
                            color: primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: Text(
                          'Surgeon',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: workcategory == "Surgeon"
                                ? Colors.white
                                : Color(0xff2F649A).withOpacity(.7),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width / 39.2,
                  ),
                  Container(
                    height: height / 16.86,
                    width: width / 3.56,
                    decoration: BoxDecoration(
                        color: workcategory == "Cardiologist"
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            workcategory = "Cardiologist";
                          });
                        },
                        child: Text(
                          'Cardiologist',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: workcategory == "Cardiologist"
                                ? Colors.white
                                : Color(0xff2F649A).withOpacity(.7),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width / 39.2,
                  ),
                  Container(
                    height: height / 16.86,
                    width: width / 3.56,
                    decoration: BoxDecoration(
                        color: workcategory == "Artho"
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            workcategory = "Artho";
                          });
                        },
                        child: Text(
                          'Artho',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: workcategory == "Artho"
                                ? Colors.white
                                : Color(0xff2F649A).withOpacity(.7),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: height / 25.3,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 220),
            child: Text('Work type',
                style: GoogleFonts.manrope(
                    color: Color(0xff18353F),
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(top: 13, right: 47),
              child: Row(
                children: [
                  Container(
                    height: height / 18.97,
                    width: width / 4.35,
                    decoration: BoxDecoration(
                        color: worktype == "Day"
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            worktype = "Day";
                          });
                        },
                        child: Text(
                          'Day',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: worktype == "Day"
                                ? Colors.white
                                : Color(0xff2F649A),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width / 39.2,
                  ),
                  Container(
                    height: height / 18.97,
                    width: width / 4.12,
                    decoration: BoxDecoration(
                        color: worktype == "Night"
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            worktype = "Night";
                          });
                        },
                        child: Text(
                          'Night',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: worktype == "Night"
                                ? Colors.white
                                : Color(0xff2F649A),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width / 39.2,
                  ),
                  Container(
                    height: height / 18.97,
                    width: width / 4.12,
                    decoration: BoxDecoration(
                        color: worktype == "24 Hours"
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            worktype = "24 Hours";
                          });
                        },
                        child: Text(
                          '24 Hours',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: worktype == "24 Hours"
                                ? Colors.white
                                : Color(0xff2F649A),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: height / 25.3,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 155),
            child: Text('Work experience',
                style: GoogleFonts.manrope(
                    color: Color(0xff18353F),
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 15,
              ),
              child: Row(
                children: [
                  Container(
                    height: height / 16.86,
                    width: width / 3.56,
                    decoration: BoxDecoration(
                        color: experience == "0 - 1 year"
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            experience = "0 - 1 year";
                          });
                        },
                        child: Text(
                          '0 - 1 year',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: experience == "0 - 1 year"
                                ? Colors.white
                                : Color(0xff2F649A),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width / 39.2,
                  ),
                  Container(
                    height: height / 16.86,
                    width: width / 3.56,
                    decoration: BoxDecoration(
                        color: experience == "2 - 3 years"
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            experience = "2 - 3 years";
                          });
                        },
                        child: Text(
                          '2 - 3 years',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: experience == "2 - 3 years"
                                ? Colors.white
                                : Color(0xff2F649A),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width / 39.2,
                  ),
                  Container(
                    height: height / 16.86,
                    width: width / 3.56,
                    decoration: BoxDecoration(
                        color: experience == "3 - 6 years"
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            experience = "3 - 6 years";
                          });
                        },
                        child: Text(
                          '3 - 6 years',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: experience == "3 - 6 years"
                                ? Colors.white
                                : Color(0xff2F649A),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: height / 25.3,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 140),
            child: Text('Languages known',
                style: GoogleFonts.manrope(
                    color: Color(0xff18353F),
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Container(
                    height: height / 16.86,
                    width: width / 3.56,
                    decoration: BoxDecoration(
                        color: language == "Tamil"
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            language = "Tamil";
                          });
                        },
                        child: Text(
                          'Tamil',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: language == "Tamil"
                                ? Colors.white
                                : Color(0xff2F649A),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width / 39.2,
                  ),
                  Container(
                    height: height / 16.86,
                    width: width / 3.56,
                    decoration: BoxDecoration(
                        color: language == "English"
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            language = "English";
                          });
                        },
                        child: Text(
                          'English',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: language == "English"
                                ? Colors.white
                                : Color(0xff2F649A),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width / 39.2,
                  ),
                  Container(
                    height: height / 16.86,
                    width: width / 3.56,
                    decoration: BoxDecoration(
                        color: language == "Hindi"
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            language = "Hindi";
                          });
                        },
                        child: Text(
                          'Hindi',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: language == "Hindi"
                                ? Colors.white
                                : Color(0xff2F649A),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: height / 75.9,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Container(
                  height: height / 16.86,
                  width: width / 3.26,
                  decoration: BoxDecoration(
                      color: language == "Malayalam"
                          ? primaryColor
                          : Colors.transparent,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          language = "Malayalam";
                        });
                      },
                      child: Text(
                        'Malayalam',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: language == "Malayalam"
                              ? Colors.white
                              : Color(0xff2F649A),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: width / 39.2,
                ),
                Container(
                  height: height / 16.86,
                  width: width / 3.26,
                  decoration: BoxDecoration(
                      color: language == "Marathi"
                          ? primaryColor
                          : Colors.transparent,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          language = "Marathi";
                        });
                      },
                      child: Text(
                        'Marathi',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: language == "Marathi"
                              ? Colors.white
                              : Color(0xff2F649A),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height / 25.3,
          ),
          InkWell(
            onTap: () {
              setState(() {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfileDetails()));
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Container(
                height: height / 16.86,
                width: width / 1.17,
                decoration: BoxDecoration(
                  color: Color(0xff2F649A),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Search',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: height / 18.97,
          ),
        ]),
      ),
    );
  }
}
