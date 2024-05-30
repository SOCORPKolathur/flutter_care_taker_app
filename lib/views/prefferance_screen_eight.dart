import 'package:dotted_border/dotted_border.dart';
import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/views/success_page.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

import '../Widgets/custombutton.dart';

class PrefferenceScreenEight extends StatefulWidget {
  const PrefferenceScreenEight({Key? key}) : super(key: key);

  @override
  State<PrefferenceScreenEight> createState() => _PrefferenceScreenEightState();
}

class _PrefferenceScreenEightState extends State<PrefferenceScreenEight> {
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
    const pageCount = 5;

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
            height: 40,
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
                        height: 20,
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
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: PageViewDotIndicator(
                          currentItem: selectedPage,
                          count: pageCount,
                          unselectedColor: Colors.black26,
                          selectedColor: Colors.blue,
                          duration: const Duration(milliseconds: 200),
                          boxShape: BoxShape.circle,
                          onItemClicked: (index) {
                            _pageController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 200),
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
