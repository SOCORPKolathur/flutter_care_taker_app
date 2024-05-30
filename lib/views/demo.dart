import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/views/success_page.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

import '../Constants/colors.dart';
import '../Widgets/custombutton.dart';

class ProfileSetUpScreen extends StatefulWidget {
  const ProfileSetUpScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSetUpScreen> createState() => _ProfileSetUpScreenState();
}

class _ProfileSetUpScreenState extends State<ProfileSetUpScreen> {
  String option = " ";

  late int selectedPage;
  late final PageController _pageController;


  @override

  void initState() {
    selectedPage = 0;
    _pageController = PageController(initialPage: selectedPage);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const pageCount = 7;

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 400,
                child: Image.asset('assets/rounded_ellipse.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60, left: 30),
                child: Container(
                  width: width / 7.84,
                  height: height / 15.18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: Icon(Icons.arrow_back),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 90, left: 120),
                child: Text(
                  'Profile setup',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 130, left: 80),
                child: Text(
                  'Let s Personalize Your Profile',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            children: [
              Material(
                elevation: 1,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 400,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Color(0xffECF5FF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 340,
                        width: 300,
                        child: PageView(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    'What is  your work \npreference ?',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      option = "Doctor";
                                      selectedPage = 1;
                                    });
                                    _pageController.animateToPage(
                                      selectedPage,
                                      duration:
                                          const Duration(milliseconds: 800),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 250,
                                    decoration: BoxDecoration(
                                        color: option == "Doctor"
                                            ? primaryColor
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            )),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        'Doctor',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Color(0xff2F649A)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      option = "Physiotherapist";
                                      selectedPage = 1;
                                    });
                                    _pageController.animateToPage(selectedPage,
                                        duration: Duration(microseconds: 400),
                                        curve: Curves.easeInOut);
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 250,
                                    decoration: BoxDecoration(
                                        color: option == "Physiotherapist"
                                            ? primaryColor
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                           )),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        'Physiotherapist',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Color(0xff2F649A)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      option = "Nurse";
                                      selectedPage = 1;
                                    });
                                    _pageController.animateToPage(selectedPage,
                                        duration: Duration(microseconds: 400),
                                        curve: Curves.easeInOut);
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 250,
                                    decoration: BoxDecoration(
                                        color: option == "Nurse"
                                            ? primaryColor
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                           )),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        'Nurse',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: option == "Nurse" ?Colors.white : Color(0xff2F649A)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      option = "Care taker";
                                      selectedPage = 1;
                                    });
                                    _pageController.animateToPage(selectedPage,
                                        duration: Duration(microseconds: 400),
                                        curve: Curves.easeInOut);
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 250,
                                    decoration: BoxDecoration(
                                        color: option == "Care taker"
                                            ? primaryColor
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                           )),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        'Care taker',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Color(0xff2F649A)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    'What is  your previous \nwork experience ?',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedPage = 2;
                                    });
                                    _pageController.animateToPage(
                                      selectedPage,
                                      duration:
                                          const Duration(milliseconds: 800),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 250,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: Color(0xff2F649A))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        '0 - 1 Years',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Color(0xff2F649A)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedPage = 1;
                                    });
                                    _pageController.animateToPage(selectedPage,
                                        duration: Duration(microseconds: 400),
                                        curve: Curves.easeInOut);
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 250,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: Color(0xff2F649A))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        '2 - 3 Years',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Color(0xff2F649A)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedPage = 1;
                                    });
                                    _pageController.animateToPage(selectedPage,
                                        duration: Duration(microseconds: 400),
                                        curve: Curves.easeInOut);
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 250,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: Color(0xff2F649A))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        'Above 3 years',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Color(0xff2F649A)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedPage = 1;
                                    });
                                    _pageController.animateToPage(selectedPage,
                                        duration: Duration(microseconds: 400),
                                        curve: Curves.easeInOut);
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 250,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: Color(0xff2F649A))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        'Above 6 yeaers',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Color(0xff2F649A)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    'What type of work do \nyou prefer?',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedPage = 3;
                                    });
                                    _pageController.animateToPage(
                                      selectedPage,
                                      duration:
                                          const Duration(milliseconds: 800),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 250,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: Color(0xff2F649A))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        'Day',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Color(0xff2F649A)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedPage = 1;
                                    });
                                    _pageController.animateToPage(selectedPage,
                                        duration: Duration(microseconds: 400),
                                        curve: Curves.easeInOut);
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 250,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: Color(0xff2F649A))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        'Night',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Color(0xff2F649A)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedPage = 1;
                                    });
                                    _pageController.animateToPage(selectedPage,
                                        duration: Duration(microseconds: 400),
                                        curve: Curves.easeInOut);
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 250,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: Color(0xff2F649A))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        '24 Hrs',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Color(0xff2F649A)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Text(
                                      'What are the languages \nyou known?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 30,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectedPage = 4;
                                          });
                                          _pageController.animateToPage(
                                              selectedPage,
                                              duration:
                                                  Duration(microseconds: 400),
                                              curve: Curves.easeInOut);
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Color(0xff2F649A))),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: Text(
                                              'English',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Color(0xff2F649A)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectedPage = 1;
                                          });
                                          _pageController.animateToPage(
                                              selectedPage,
                                              duration:
                                                  Duration(microseconds: 400),
                                              curve: Curves.easeInOut);
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Color(0xff2F649A))),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: Text(
                                              'Tamil',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Color(0xff2F649A)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 30,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectedPage = 1;
                                          });
                                          _pageController.animateToPage(
                                              selectedPage,
                                              duration:
                                                  Duration(microseconds: 400),
                                              curve: Curves.easeInOut);
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Color(0xff2F649A))),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: Text(
                                              'Malayalam',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Color(0xff2F649A)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectedPage = 1;
                                          });
                                          _pageController.animateToPage(
                                              selectedPage,
                                              duration:
                                                  Duration(microseconds: 400),
                                              curve: Curves.easeInOut);
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Color(0xff2F649A))),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: Text(
                                              'Gujarathi',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Color(0xff2F649A)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 30,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectedPage = 1;
                                          });
                                          _pageController.animateToPage(
                                              selectedPage,
                                              duration:
                                                  Duration(microseconds: 400),
                                              curve: Curves.easeInOut);
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Color(0xff2F649A))),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: Text(
                                              'Bengali',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Color(0xff2F649A)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectedPage = 1;
                                          });
                                          _pageController.animateToPage(
                                              selectedPage,
                                              duration:
                                                  Duration(microseconds: 400),
                                              curve: Curves.easeInOut);
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Color(0xff2F649A))),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: Text(
                                              'Hindi',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Color(0xff2F649A)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 30,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectedPage = 1;
                                          });
                                          _pageController.animateToPage(
                                              selectedPage,
                                              duration:
                                                  Duration(microseconds: 400),
                                              curve: Curves.easeInOut);
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Color(0xff2F649A))),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: Text(
                                              'Marathi',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Color(0xff2F649A)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectedPage = 1;
                                          });
                                          _pageController.animateToPage(
                                              selectedPage,
                                              duration:
                                                  Duration(microseconds: 400),
                                              curve: Curves.easeInOut);
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Color(0xff2F649A))),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: Text(
                                              'Kannada',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Color(0xff2F649A)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 30,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectedPage = 1;
                                          });
                                          _pageController.animateToPage(
                                              selectedPage,
                                              duration:
                                                  Duration(microseconds: 400),
                                              curve: Curves.easeInOut);
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Color(0xff2F649A))),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: Text(
                                              'Telungu',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Color(0xff2F649A)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectedPage = 1;
                                          });
                                          _pageController.animateToPage(
                                              selectedPage,
                                              duration:
                                                  Duration(microseconds: 400),
                                              curve: Curves.easeInOut);
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: Color(0xff2F649A))),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5),
                                            child: Text(
                                              'Urdu',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Color(0xff2F649A)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      'What is your job \ncategory?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Container(
                                        height: 30,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                                color: Color(0xff2F649A))),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Text(
                                            'Cardiologist',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Color(0xff2F649A)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Container(
                                        height: 30,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                                color: Color(0xff2F649A))),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Text(
                                            'Generalist',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Color(0xff2F649A)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Container(
                                        height: 30,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                                color: Color(0xff2F649A))),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Text(
                                            'Nuerologist',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Color(0xff2F649A)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Container(
                                        height: 30,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                                color: Color(0xff2F649A))),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Text(
                                            'Dentist',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Color(0xff2F649A)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Container(
                                        height: 30,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                                color: Color(0xff2F649A))),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Text(
                                            'Radiologist',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Color(0xff2F649A)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Container(
                                        height: 30,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                                color: Color(0xff2F649A))),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Text(
                                            'Surgeons',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Color(0xff2F649A)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Container(
                                        height: 30,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                                color: Color(0xff2F649A))),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Text(
                                            'ENT specialist',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Color(0xff2F649A)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Container(
                                        height: 30,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                                color: Color(0xff2F649A))),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Text(
                                            'Kannada',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Color(0xff2F649A)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Container(
                                        height: 30,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                                color: Color(0xff2F649A))),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Text(
                                            'Telungu',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Color(0xff2F649A)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Container(
                                        height: 30,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                                color: Color(0xff2F649A))),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Text(
                                            'Urdu',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Color(0xff2F649A)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Text(
                                    'Are you willing to\n work out of stations ?',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 60,
                                ),
                                Container(
                                  height: 35,
                                  width: 230,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border:
                                          Border.all(color: Color(0xff2F649A))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      'No',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Color(0xff2F649A)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  height: 35,
                                  width: 230,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border:
                                          Border.all(color: Color(0xff2F649A))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      'Yes',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Color(0xff2F649A)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                             Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Text(
                                    'Upload your profile pic',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Stack(
                                    children: [
                                      DottedBorder(
                                        borderType: BorderType.Circle,
                                        radius: Radius.circular(10),
                                        padding: EdgeInsets.all(30),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 50,
                                              width: 50,
                                              child: Image.asset('assets/add_image.png'),
                                            ),
                                            Text(
                                              'Click here to add\n a photo',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () => _popupDialog(context),
                                  child: Container(
                                    height: 35,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(color: Color(0xff2F649A))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Text(
                                        'Submit',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 17, color: Color(0xff2F649A)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                          controller: _pageController,
                          onPageChanged: (val) {
                            setState(() {
                              val = selectedPage;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: PageViewDotIndicator(
                          currentItem: selectedPage,
                          count: pageCount,
                          unselectedColor: Colors.black26,
                          selectedColor: Colors.blue,
                          duration: const Duration(milliseconds: 800),
                          boxShape: BoxShape.circle,
                          onItemClicked: (index) {
                            _pageController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 800),
                              curve: Curves.easeInOut,
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  void _popupDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Color(0xffFFFFFF),
            title: Center(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                    height: 200,
                    width: 200,
                    child: Image.asset('assets/successful_purchase.png'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Payment Successful!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff18353F)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Thank you for your payment. Your account is now up to date.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  ElevationButton("Done", SuccessfullPage()),
                ],
              ),
            ),
          );
        });
  }
}
