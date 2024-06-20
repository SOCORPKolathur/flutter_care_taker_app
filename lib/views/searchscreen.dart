import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/views/professional_search_listing_page.dart';
import 'package:flutter_care_taker_app/views/profile_details.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constants/colors.dart';
import 'navbar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String option = "";
  String type = "";
  String profession = "";
  String gender = "";
  List<String> selectedCategories = [];
  List<String> selectedType = [];
  List<String> selectedExperience = [];
  List<String> selectedLanguages = [];
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
                padding:
                    EdgeInsets.only(top: height / 16.39, left: width / 1.22),
                child: Container(
                  width: width / 6.63,
                  height: height / 15.18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                  ),
                  child: Icon(Icons.menu)
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 55, left: width / 36),
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
          SizedBox(
            height: height / 37.7,
          ),
          Padding(
            padding: EdgeInsets.only(right: width / 2.25),
            child: Text('Work Profession',
                style: GoogleFonts.manrope(
                    color: Color(0xff18353F),
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: EdgeInsets.only(top: height / 50.26, left: width / 16.36),
            child: Row(
              children: [
                SizedBox(
                  width: width / 39.2,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      profession = "Doctor";
                    });
                  },
                  child: Container(
                    height: height / 21.54,
                    width: width / 4.5,
                    decoration: BoxDecoration(
                        color: profession == "Doctor"
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.only(top: height / 107.71),
                      child: Text(
                        'Doctor',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: profession == "Doctor"
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
                InkWell(
                  onTap: () {
                    setState(() {
                      profession = 'Nurse';
                    });
                  },
                  child: Container(
                    height: height / 21.54,
                    width: width / 4.5,
                    decoration: BoxDecoration(
                        color: profession == 'Nurse'
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.only(top: height / 107.71),
                      child: Text(
                        'Nurse',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: profession == 'Nurse'
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
                InkWell(
                  onTap: () {
                    setState(() {
                      profession = 'Care taker';
                    });
                  },
                  child: Container(
                    height: height / 21.54,
                    width: width / 4,
                    decoration: BoxDecoration(
                        color: profession == 'Care taker'
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.only(top: height / 75.4),
                      child: Text(
                        'Care taker',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: profession == 'Care taker'
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
          Padding(
            padding: EdgeInsets.only(top: height / 50.26, left: width / 16.36),
            child: Row(
              children: [
                SizedBox(
                  width: width / 39.2,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      profession = 'Physiotherapist';
                    });
                  },
                  child: Container(
                    height: height / 21.54,
                    width: width / 3,
                    decoration: BoxDecoration(
                        color: profession == 'Physiotherapist'
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.only(top: height / 75.4),
                      child: Text(
                        'Physiotherapist',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: profession == 'Physiotherapist'
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
              ],
            ),
          ),
          SizedBox(
            height: height / 25.3,
          ),
          Padding(
            padding: EdgeInsets.only(right: width / 2),
            child: Text('Work category',
                style: GoogleFonts.manrope(
                    color: Color(0xff18353F),
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: EdgeInsets.only(top: height / 50.26, left: width / 16.36),
            child: Row(
              children: [
                SizedBox(
                  width: width / 39.2,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      if (selectedCategories.contains("Surgeons")) {
                        selectedCategories.remove("Surgeons");
                      } else {
                        selectedCategories.add("Surgeons");
                      }
                    });
                  },
                  child: Container(
                    height: height / 21.54,
                    width: width / 4.5,
                    decoration: BoxDecoration(
                        color: selectedCategories.contains("Surgeons")
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.only(top: height / 107.71),
                      child: Text(
                        'Surgeons',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: selectedCategories.contains("Surgeons")
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
                InkWell(
                  onTap: () {
                    setState(() {
                      if (selectedCategories.contains("Dentist")) {
                        selectedCategories.remove("Dentist");
                      } else {
                        selectedCategories.add("Dentist");
                      }
                    });
                  },
                  child: Container(
                    height: height / 21.54,
                    width: width / 4.5,
                    decoration: BoxDecoration(
                        color: selectedCategories.contains("Dentist")
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.only(top: height / 107.71),
                      child: Text(
                        'Dentist',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: selectedCategories.contains("Dentist")
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
                InkWell(
                  onTap: () {
                    setState(() {
                      if (selectedCategories.contains("Cardiologist")) {
                        selectedCategories.remove("Cardiologist");
                      } else {
                        selectedCategories.add("Cardiologist");
                      }
                    });
                  },
                  child: Container(
                    height: height / 21.54,
                    width: width / 4,
                    decoration: BoxDecoration(
                        color: selectedCategories.contains("Cardiologist")
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.only(top: height / 75.4),
                      child: Text(
                        'Cardiologist',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: selectedCategories.contains("Cardiologist")
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
          Padding(
            padding: EdgeInsets.only(top: height / 50.26, left: width / 16.36),
            child: Row(
              children: [
                SizedBox(
                  width: width / 39.2,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      if (selectedCategories.contains("Artho")) {
                        selectedCategories.remove("Artho");
                      } else {
                        selectedCategories.add("Artho");
                      }
                    });
                  },
                  child: Container(
                    height: height / 21.54,
                    width: width / 4.5,
                    decoration: BoxDecoration(
                        color: selectedCategories.contains("Artho")
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.only(top: height / 94.25),
                      child: Text(
                        'Artho',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: selectedCategories.contains("Artho")
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
                InkWell(
                  onTap: () {
                    setState(() {
                      if (selectedCategories.contains("Generalist")) {
                        selectedCategories.remove("Generalist");
                      } else {
                        selectedCategories.add("Generalist");
                      }
                    });
                  },
                  child: Container(
                    height: height / 21.54,
                    width: width / 4.5,
                    decoration: BoxDecoration(
                        color: selectedCategories.contains("Generalist")
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.only(top: height / 107.71),
                      child: Text(
                        'Generalist',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: selectedCategories.contains("Generalist")
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
                InkWell(
                  onTap: () {
                    setState(() {
                      if (selectedCategories.contains("Radiologist")) {
                        selectedCategories.remove("Radiologist");
                      } else {
                        selectedCategories.add("Radiologist");
                      }
                    });
                  },
                  child: Container(
                    height: height / 21.54,
                    width: width / 4.5,
                    decoration: BoxDecoration(
                        color: selectedCategories.contains("Radiologist")
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.only(top: height / 107.71),
                      child: Text(
                        'Radiologist',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: selectedCategories.contains("Radiologist")
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
          Row(
            children: [
              SizedBox(width: 13),
              Padding(
                padding: EdgeInsets.only(top: height / 50.26, left: width / 18),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      if (selectedCategories.contains("ENT specialist")) {
                        selectedCategories.remove("ENT specialist");
                      } else {
                        selectedCategories.add('ENT specialist');
                      }
                    });
                  },
                  child: Container(
                    height: height / 21.54,
                    width: width / 3.6,
                    decoration: BoxDecoration(
                        color: selectedCategories.contains('ENT specialist')
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.only(top: height / 107.71),
                      child: Text(
                        'ENT specialist',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: selectedCategories.contains('ENT specialist')
                              ? Colors.white
                              : Color(0xff2F649A).withOpacity(.7),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width / 39.2,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: height / 50.26,
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      if (selectedCategories.contains("Nuerologist")) {
                        selectedCategories.remove("Nuerologist");
                      } else {
                        selectedCategories.add("Nuerologist");
                      }
                    });
                  },
                  child: Container(
                    height: height / 21.54,
                    width: width / 3.6,
                    decoration: BoxDecoration(
                        color: selectedCategories.contains("Nuerologist")
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.only(top: height / 107.71),
                      child: Text(
                        "Nuerologist",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: selectedCategories.contains("Nuerologist")
                              ? Colors.white
                              : Color(0xff2F649A).withOpacity(.7),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height / 25.3,
          ),
          Padding(
            padding: EdgeInsets.only(right: width / 2),
            child: Text('Working Shift',
                style: GoogleFonts.manrope(
                    color: Color(0xff18353F),
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: EdgeInsets.only(top: height / 58, left: width / 72),
            child: Row(
              children: [
                SizedBox(
                  width: width / 12,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      type = "Day";
                    });
                  },
                  child: Container(
                    height: height / 25.13,
                    width: width / 4.5,
                    decoration: BoxDecoration(
                        color:
                            type == "Day" ? primaryColor : Colors.transparent,
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.only(top: height / 150.8),
                      child: Text(
                        'Day',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color:
                              type == "Day" ? Colors.white : Color(0xff2F649A),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: width / 39.2,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      type = "Night";
                    });
                  },
                  child: Container(
                    height: height / 25.13,
                    width: width / 4.5,
                    decoration: BoxDecoration(
                        color:
                            type == "Night" ? primaryColor : Colors.transparent,
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.only(top: height / 150.8),
                      child: Text(
                        'Night',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: type == "Night"
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
                InkWell(
                  onTap: () {
                    setState(() {
                      type = '24 Hours';
                    });
                  },
                  child: Container(
                    height: height / 25.13,
                    width: width / 4.5,
                    decoration: BoxDecoration(
                        color: type == '24 Hours'
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.only(top: height / 125.66),
                      child: Text(
                        '24 Hours',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: type == '24 Hours'
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
          Padding(
            padding: EdgeInsets.only(right: width / 2.4),
            child: Text('Work experience',
                style: GoogleFonts.manrope(
                    color: Color(0xff18353F),
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: EdgeInsets.only(top: height / 50.26, left: width / 72),
            child: Row(
              children: [
                SizedBox(
                  width: width / 12,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      option = "0 - 1 Year";
                    });
                  },
                  child: Container(
                    height: height / 21.54,
                    width: width / 4.5,
                    decoration: BoxDecoration(
                        color: option == "0 - 1 Year"
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.only(top: height / 75.4),
                      child: Text(
                        '0 - 1 Year',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: option == "0 - 1 Year"
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
                InkWell(
                  onTap: () {
                    setState(() {
                      option = '2 - 3 Years';
                    });
                  },
                  child: Container(
                    height: height / 21.54,
                    width: width / 4.5,
                    decoration: BoxDecoration(
                        color: option == '2 - 3 Years'
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.only(top: height / 75.4),
                      child: Text(
                        '2 - 3 Years',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: option == '2 - 3 Years'
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
          Padding(
            padding: EdgeInsets.only(top: height / 50.26, left: width / 13.84),
            child: Row(
              children: [
                SizedBox(
                  width: width / 39.2,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      option = 'Above 3 years';
                    });
                  },
                  child: Container(
                    height: height / 21.54,
                    width: width / 3,
                    decoration: BoxDecoration(
                        color: option == 'Above 3 years'
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.only(top: height / 75.4),
                      child: Text(
                        'Above 3 years',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: option == 'Above 3 years'
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
                InkWell(
                  onTap: () {
                    setState(() {
                      option = 'Above 6 years';
                    });
                  },
                  child: Container(
                    height: height / 21.54,
                    width: width / 3,
                    decoration: BoxDecoration(
                        color: option == 'Above 6 years'
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.only(top: height / 75.4),
                      child: Text(
                        'Above 6 years',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: option == 'Above 6 years'
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
          Padding(
            padding: EdgeInsets.only(right: width / 2.57),
            child: Text('Languages known',
                style: GoogleFonts.manrope(
                    color: Color(0xff18353F),
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: EdgeInsets.only(top: height / 50.26, left: width / 18),
            child: Row(
              children: [
                SizedBox(
                  width: width / 19.6,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      if (selectedLanguages.contains("Tamil")) {
                        selectedLanguages.remove("Tamil");
                      } else {
                        selectedLanguages.add("Tamil");
                      }
                    });
                  },
                  child: Container(
                    height: height / 21.54,
                    width: width / 4.5,
                    decoration: BoxDecoration(
                        color: selectedLanguages.contains("Tamil")
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.only(top: height / 75.4),
                      child: Text(
                        'Tamil',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: selectedLanguages.contains("Tamil")
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
                InkWell(
                  onTap: () {
                    setState(() {
                      if (selectedLanguages.contains("English")) {
                        selectedLanguages.remove("English");
                      } else {
                        selectedLanguages.add("English");
                      }
                    });
                  },
                  child: Container(
                    height: height / 21.54,
                    width: width / 4.5,
                    decoration: BoxDecoration(
                        color: selectedLanguages.contains("English")
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.only(top: height / 75.4),
                      child: Text(
                        'English',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: selectedLanguages.contains("English")
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
                InkWell(
                  onTap: () {
                    setState(() {
                      if (selectedLanguages.contains("Hindi")) {
                        selectedLanguages.remove("Hindi");
                      } else {
                        selectedLanguages.add("Hindi");
                      }
                    });
                  },
                  child: Container(
                    height: height / 21.54,
                    width: width / 4.5,
                    decoration: BoxDecoration(
                        color: selectedLanguages.contains("Hindi")
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.only(top: height / 75.4),
                      child: Text(
                        'Hindi',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: selectedLanguages.contains("Hindi")
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
            height: height / 75.9,
          ),
          Padding(
            padding: EdgeInsets.only(left: width / 9),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      if (selectedLanguages.contains("Malayalam")) {
                        selectedLanguages.remove("Malayalam");
                      } else {
                        selectedLanguages.add("Malayalam");
                      }
                    });
                  },
                  child: Container(
                    height: height / 21.54,
                    width: width / 4.5,
                    decoration: BoxDecoration(
                        color: selectedLanguages.contains("Malayalam")
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.only(top: height / 75.4),
                      child: Text(
                        'Malayalam',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: selectedLanguages.contains("Malayalam")
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
                InkWell(
                  onTap: () {
                    setState(() {
                      if (selectedLanguages.contains("Marathi")) {
                        selectedLanguages.remove("Marathi");
                      } else {
                        selectedLanguages.add("Marathi");
                      }
                    });
                  },
                  child: Container(
                    height: height / 21.54,
                    width: width / 4.5,
                    decoration: BoxDecoration(
                        color: selectedLanguages.contains("Marathi")
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.only(top: height / 75.4),
                      child: Text(
                        'Marathi',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: selectedLanguages.contains("Marathi")
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
                InkWell(
                  onTap: () {
                    setState(() {
                      if (selectedLanguages.contains("Gujarathi")) {
                        selectedLanguages.remove("Gujarathi");
                      } else {
                        selectedLanguages.add("Gujarathi");
                      }
                    });
                  },
                  child: Container(
                    height: height / 21.54,
                    width: width / 4.5,
                    decoration: BoxDecoration(
                        color: selectedLanguages.contains("Gujarathi")
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.only(top: height / 75.4),
                      child: Text(
                        'Gujarathi',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: selectedLanguages.contains("Gujarathi")
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
            height: height / 75.9,
          ),
          Padding(
            padding: EdgeInsets.only(left: width / 9),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      if (selectedLanguages.contains("Bengali")) {
                        selectedLanguages.remove("Bengali");
                      } else {
                        selectedLanguages.add("Bengali");
                      }
                    });
                  },
                  child: Container(
                    height: height / 21.54,
                    width: width / 4.5,
                    decoration: BoxDecoration(
                        color: selectedLanguages.contains("Bengali")
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.only(top: height / 75.4),
                      child: Text(
                        'Bengali',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: selectedLanguages.contains("Bengali")
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
                InkWell(
                  onTap: () {
                    setState(() {
                      if (selectedLanguages.contains("Kannada")) {
                        selectedLanguages.remove("Kannada");
                      } else {
                        selectedLanguages.add("Kannada");
                      }
                    });
                  },
                  child: Container(
                    height: height / 21.54,
                    width: width / 4.5,
                    decoration: BoxDecoration(
                        color: selectedLanguages.contains("Kannada")
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.only(top: height / 75.4),
                      child: Text(
                        'Kannada',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: selectedLanguages.contains("Kannada")
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
                InkWell(
                  onTap: () {
                    setState(() {
                      if (selectedLanguages.contains("Telungu")) {
                        selectedLanguages.remove("Telungu");
                      } else {
                        selectedLanguages.add("Telungu");
                      }
                    });
                  },
                  child: Container(
                    height: height / 21.54,
                    width: width / 4.5,
                    decoration: BoxDecoration(
                        color: selectedLanguages.contains("Telungu")
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.only(top: height / 75.4),
                      child: Text(
                        'Telungu',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: selectedLanguages.contains("Telungu")
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
          Padding(
            padding: EdgeInsets.only(right: width / 1.8, top: height / 75.4),
            child: InkWell(
              onTap: () {
                setState(() {
                  if (selectedLanguages.contains("Urdu")) {
                    selectedLanguages.remove("Urdu");
                  } else {
                    selectedLanguages.add("Urdu");
                  }
                });
              },
              child: Container(
                height: height / 21.54,
                width: width / 4.5,
                decoration: BoxDecoration(
                    color: selectedLanguages.contains("Urdu")
                        ? primaryColor
                        : Colors.transparent,
                    border: Border.all(color: primaryColor),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: EdgeInsets.only(top: height / 75.4),
                  child: Text(
                    'Urdu',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: selectedLanguages.contains("Urdu")
                          ? Colors.white
                          : Color(0xff2F649A),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: height / 25.3,
          ),
          Padding(
            padding: EdgeInsets.only(left: 23),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text('Gender',
                  style: GoogleFonts.manrope(
                      color: Color(0xff18353F),
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height / 50.26, left: width / 18),
            child: Row(
              children: [
                SizedBox(
                  width: width / 19.6,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      gender = "Male";
                    });
                  },
                  child: Container(
                    height: height / 21.54,
                    width: width / 4.5,
                    decoration: BoxDecoration(
                        color: gender == "Male"
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.only(top: height / 75.4),
                      child: Text(
                        'Male',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: gender == "Male"
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
                InkWell(
                  onTap: () {
                    setState(() {
                      gender = "Female";
                    });
                  },
                  child: Container(
                    height: height / 21.54,
                    width: width / 4.5,
                    decoration: BoxDecoration(
                        color: gender == "Female"
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.only(top: height / 75.4),
                      child: Text(
                        'Female',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: gender == "Female"
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
                InkWell(
                  onTap: () {
                    setState(() {
                      gender = "Others";
                    });
                  },
                  child: Container(
                    height: height / 21.54,
                    width: width / 4.5,
                    decoration: BoxDecoration(
                        color: gender == "Others"
                            ? primaryColor
                            : Colors.transparent,
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.only(top: height / 75.4),
                      child: Text(
                        'Others',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: gender == "Others"
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
              if (profession != null &&
                  type!= null &&

                  selectedLanguages.isNotEmpty
                  ) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ListingPage(
                      profession,
                      selectedCategories,
                      type,
                      option,
                      selectedLanguages,
                      gender,
                    ),
                  ),
                );
              } else {
                showToastMessage('Please select required options.');
              }
            },
            child: Padding(
              padding: EdgeInsets.only(right: width / 24),
              child: Container(
                height: height / 16.86,
                width: width / 1.17,
                decoration: BoxDecoration(
                  color: Color(0xff2F649A),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: height / 75.4),
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

  void showToastMessage(String message) {
    Fluttertoast.showToast(
        msg: message, //message to show toast
        toastLength: Toast.LENGTH_LONG, //duration for message to show
        gravity: ToastGravity.CENTER, //where you want to show, top, bottom
        timeInSecForIosWeb: 1, //for iOS only
        backgroundColor: Color(0xff2F649A), //background Color for message
        textColor: Colors.white,
        //message text color
        fontSize: 16.0 //message font size
        );
  }
}
