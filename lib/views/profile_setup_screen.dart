import 'dart:io';
import 'package:flutter_care_taker_app/views/role_page.dart';
import 'package:flutter_care_taker_app/views/welcome_homepage.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

import '../Constants/colors.dart';

class ProfileSetUpScreen extends StatefulWidget {
  final String name;
  final String aadhar;
  final String phonenumber;
  final String uid;

  ProfileSetUpScreen(this.name, this.aadhar, this.phonenumber, this.uid);

  @override
  State<ProfileSetUpScreen> createState() => _ProfileSetUpScreenState();
}

class _ProfileSetUpScreenState extends State<ProfileSetUpScreen> {
  String option = " ";
  String exp = " ";
  String perfer = " ";
  String lan = " ";
  String category = " ";
  String available = " ";

  late int selectedPage;
  late final PageController _pageController;
  List<String> selectedCategories = [];

  @override
  void initState() {
    selectedPage = 0;
    _pageController = PageController(initialPage: selectedPage);

    super.initState();
    selectedGender = '';
  }

  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _getImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        print('No image selected.');
      }
    });
  }

  String _currentAddress = 'Getting address...';
  Position? _currentPosition;

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        _getAddressFromLatLng();
      });
    }).catchError((e) {
      print(e);
    });
  }

  Future<void> _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        _currentPosition!.latitude,
        _currentPosition!.longitude,
      );
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress = '${place.subLocality}, ${place.locality}';
      });
    } catch (e) {
      setState(() {
        _currentAddress = 'Error getting address: $e';
      });
    }
  }

  List<String> selectedLanguages = [];
  late String selectedGender;

  @override
  Widget build(BuildContext context) {
    const pageCount = 7;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double baseWidth = 1512;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: width / 0.9,
                child: Image.asset('assets/rounded_ellipse.png'),
              ),
              Padding(
                padding: EdgeInsets.only(top: height / 12.56, left: width / 12),
                child: Container(
                  width: width / 7.2,
                  height: height / 15.08,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: Icon(Icons.arrow_back),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height / 8.37, left: width / 3),
                child: Text(
                  'Profile setup',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height / 5.8, left: width / 4.5),
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
            height: height / 25.13,
          ),
          Column(
            children: [
              Material(
                elevation: 1,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: height / 1.88,
                  width: width / 1.2,
                  decoration: BoxDecoration(
                    color: Color(0xffECF5FF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: height / 2.21,
                        width: width / 1.2,
                        child: PageView(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: height / 75.4),
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
                                  height: height / 15.08,
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
                                    height: height / 18.85,
                                    width: width / 1.44,
                                    decoration: BoxDecoration(
                                        color: option == "Doctor"
                                            ? primaryColor
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all()),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(top: height / 150.8),
                                      child: Text(
                                        'Doctor',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: option == "Doctor"
                                                ? Colors.white
                                                : Color(0xff2F649A)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height / 50.26,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      option = "Physiotherapist";
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
                                    height: height / 18.85,
                                    width: width / 1.44,
                                    decoration: BoxDecoration(
                                        color: option == "Physiotherapist"
                                            ? primaryColor
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all()),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(top: height / 150.8),
                                      child: Text(
                                        "Physiotherapist",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: option == "Physiotherapist"
                                                ? Colors.white
                                                : Color(0xff2F649A)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height / 50.26,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      option = "Nurse";
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
                                    height: height / 18.85,
                                    width: width / 1.44,
                                    decoration: BoxDecoration(
                                        color: option == "Nurse"
                                            ? primaryColor
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all()),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(top: height / 150.8),
                                      child: Text(
                                        'Nurse',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: option == "Nurse"
                                                ? Colors.white
                                                : Color(0xff2F649A)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height / 50.26,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      option = "Care taker";
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
                                    height: height / 18.85,
                                    width: width / 1.44,
                                    decoration: BoxDecoration(
                                        color: option == "Care taker"
                                            ? primaryColor
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all()),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(top: height / 150.8),
                                      child: Text(
                                        'Care taker',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: option == 'Care taker'
                                                ? Colors.white
                                                : Color(0xff2F649A)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: height / 75.4),
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
                                  height: height / 50.26,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      exp = '0 - 1 year';
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
                                    height: height / 18.85,
                                    width: width / 1.44,
                                    decoration: BoxDecoration(
                                        color: exp == '0 - 1 year'
                                            ? Color(0xff2F649A)
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all()),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(top: height / 150.8),
                                      child: Text(
                                        '0 - 1 year',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: exp == '0 - 1 year'
                                                ? Colors.white
                                                : Color(0xff2F649A)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height / 50.26,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      exp = '2 - 3 Years';
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
                                    height: height / 18.85,
                                    width: width / 1.44,
                                    decoration: BoxDecoration(
                                        color: exp == '2 - 3 Years'
                                            ? Color(0xff2F649A)
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all()),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(top: height / 150.8),
                                      child: Text(
                                        '2 - 3 Years',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: exp == '2 - 3 Years'
                                                ? Colors.white
                                                : Color(0xff2F649A)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height / 50.26,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      exp = 'Above 3 years';
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
                                    height: height / 18.85,
                                    width: width / 1.44,
                                    decoration: BoxDecoration(
                                        color: exp == 'Above 3 years'
                                            ? Color(0xff2F649A)
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all()),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(top: height / 150.8),
                                      child: Text(
                                        'Above 3 years',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: exp == 'Above 3 years'
                                                ? Colors.white
                                                : Color(0xff2F649A)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height / 50.26,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      exp = 'Above 6 years';
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
                                    height: height / 18.85,
                                    width: width / 1.44,
                                    decoration: BoxDecoration(
                                        color: exp == 'Above 6 years'
                                            ? Color(0xff2F649A)
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all()),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(top: height / 150.8),
                                      child: Text(
                                        'Above 6 years',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: exp == 'Above 6 years'
                                                ? Colors.white
                                                : Color(0xff2F649A)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: height / 75.4),
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
                                  height: height / 50.26,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      available = "Day";
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
                                    height: height / 18.85,
                                    width: width / 1.44,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: available == "Day"
                                            ? Color(0xff2F649A)
                                            : Colors.transparent,
                                        border: Border.all()),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(top: height / 150.8),
                                      child: Text(
                                        'Day',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: available == "Day"
                                                ? Colors.white
                                                : Color(0xff2F649A)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height / 50.26,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      available = "Night";
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
                                    height: height / 18.85,
                                    width: width / 1.44,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: available == "Night"
                                            ? Color(0xff2F649A)
                                            : Colors.transparent,
                                        border: Border.all()),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(top: height / 150.8),
                                      child: Text(
                                        'Night',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: available == "Night"
                                                ? Colors.white
                                                : Color(0xff2F649A)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height / 50.26,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      available = "24 Hours";
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
                                    height: height / 18.85,
                                    width: width / 1.44,
                                    decoration: BoxDecoration(
                                        color: available == "24 Hours"
                                            ? Color(0xff2F649A)
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all()),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(top: height / 150.8),
                                      child: Text(
                                        '24 Hours',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: available == "24 Hours"
                                                ? Colors.white
                                                : Color(0xff2F649A)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height / 50.26,
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                SingleChildScrollView(
                                  physics: NeverScrollableScrollPhysics(),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(top: height / 37.7),
                                        child: Text(
                                          'What are the languages \nyou know?',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height / 50.26,
                                      ),
                                      _buildLanguageSelectionRow(
                                          ["English", "Tamil"]),
                                      SizedBox(
                                        height: height / 50.26,
                                      ),
                                      _buildLanguageSelectionRow(
                                          ["Malayalam", "Gujarathi"]),
                                      SizedBox(
                                        height: height / 50.26,
                                      ),
                                      _buildLanguageSelectionRow(
                                          ["Bengali", "Hindi"]),
                                      SizedBox(
                                        height: height / 50.26,
                                      ),
                                      _buildLanguageSelectionRow(
                                          ["Marathi", "Kannada"]),
                                      SizedBox(
                                        height: height / 50.26,
                                      ),
                                      _buildLanguageSelectionRow(
                                          ["Telugu", "Urdu"]),
                                      SizedBox(height: height / 75.4),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            lan = "Next";
                                            selectedPage = 4;
                                          });
                                          _pageController.animateToPage(
                                            selectedPage,
                                            duration: const Duration(
                                                milliseconds: 800),
                                            curve: Curves.easeInOut,
                                          );
                                        },
                                        child: Container(
                                          height: height / 25.13,
                                          width: width / 3.6,
                                          decoration: BoxDecoration(
                                            color: Color(0xff2F649A),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: height / 150.8),
                                            child: Text(
                                              'Next',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height / 75.4,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            _addToCart(context);
                                          });
                                        },
                                        child: Text('Submit'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SingleChildScrollView(
                              physics: NeverScrollableScrollPhysics(),
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: height / 75.4),
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
                                    height: height / 75.4,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: width / 12,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (selectedCategories
                                                .contains('Cardiologist')) {
                                              selectedCategories
                                                  .remove('Cardiologist');
                                            } else {
                                              selectedCategories
                                                  .add('Cardiologist');
                                            }
                                          });
                                        },
                                        child: Container(
                                          height: height / 25.13,
                                          width: width / 3.6,
                                          decoration: BoxDecoration(
                                              color: selectedCategories
                                                      .contains('Cardiologist')
                                                  ? Color(0xff2F649A)
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all()),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: height / 150.8),
                                            child: Text(
                                              'Cardiologist',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: selectedCategories
                                                          .contains(
                                                              'Cardiologist')
                                                      ? Colors.white
                                                      : Color(0xff2F649A)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width / 24,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (selectedCategories
                                                .contains('Generalist')) {
                                              selectedCategories
                                                  .remove('Generalist');
                                            } else {
                                              selectedCategories
                                                  .add('Generalist');
                                            }
                                          });
                                        },
                                        child: Container(
                                          height: height / 25.13,
                                          width: width / 3.6,
                                          decoration: BoxDecoration(
                                              color: selectedCategories
                                                      .contains('Generalist')
                                                  ? Color(0xff2F649A)
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all()),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: height / 150.8),
                                            child: Text(
                                              'Generalist',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: selectedCategories
                                                          .contains(
                                                              'Generalist')
                                                      ? Colors.white
                                                      : Color(0xff2F649A)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height / 50.26,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: width / 12,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (selectedCategories
                                                .contains('Nuerologist')) {
                                              selectedCategories
                                                  .remove('Nuerologist');
                                            } else {
                                              selectedCategories
                                                  .add('Nuerologist');
                                            }
                                          });
                                        },
                                        child: Container(
                                          height: height / 25.13,
                                          width: width / 3.6,
                                          decoration: BoxDecoration(
                                              color:
                                                  selectedCategories.contains(
                                                'Nuerologist',
                                              )
                                                      ? Color(0xff2F649A)
                                                      : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all()),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: height / 150.8),
                                            child: Text(
                                              'Nuerologist',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: selectedCategories
                                                          .contains(
                                                    'Nuerologist',
                                                  )
                                                      ? Colors.white
                                                      : Color(0xff2F649A)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width / 24,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (selectedCategories
                                                .contains('Dentist')) {
                                              selectedCategories
                                                  .remove('Dentist');
                                            } else {
                                              selectedCategories.add('Dentist');
                                            }
                                          });
                                        },
                                        child: Container(
                                          height: height / 25.13,
                                          width: width / 3.6,
                                          decoration: BoxDecoration(
                                              color: selectedCategories
                                                      .contains('Dentist')
                                                  ? Color(0xff2F649A)
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all()),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: height / 150.8),
                                            child: Text(
                                              'Dentist',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: selectedCategories
                                                          .contains('Dentist')
                                                      ? Colors.white
                                                      : Color(0xff2F649A)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height / 50.26,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: width / 12,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (selectedCategories
                                                .contains('Radiologist')) {
                                              selectedCategories
                                                  .remove('Radiologist');
                                            } else {
                                              selectedCategories
                                                  .add('Radiologist');
                                            }
                                          });
                                        },
                                        child: Container(
                                          height: height / 25.13,
                                          width: width / 3.6,
                                          decoration: BoxDecoration(
                                              color: selectedCategories
                                                      .contains('Radiologist')
                                                  ? Color(0xff2F649A)
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all()),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: height / 150.8),
                                            child: Text(
                                              'Radiologist',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: selectedCategories
                                                          .contains(
                                                              'Radiologist')
                                                      ? Colors.white
                                                      : Color(0xff2F649A)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width / 24,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (selectedCategories
                                                .contains('Surgeons')) {
                                              selectedCategories
                                                  .remove('Surgeons');
                                            } else {
                                              selectedCategories
                                                  .add('Surgeons');
                                            }
                                          });
                                        },
                                        child: Container(
                                          height: height / 25.13,
                                          width: width / 3.6,
                                          decoration: BoxDecoration(
                                              color: selectedCategories
                                                      .contains('Surgeons')
                                                  ? Color(0xff2F649A)
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all()),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: height / 150.8),
                                            child: Text(
                                              'Surgeons',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: selectedCategories
                                                          .contains('Surgeons')
                                                      ? Colors.white
                                                      : Color(0xff2F649A)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height / 50.26,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: width / 12,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (selectedCategories
                                                .contains('ENT specialist')) {
                                              selectedCategories
                                                  .remove('ENT specialist');
                                            } else {
                                              selectedCategories
                                                  .add('ENT specialist');
                                            }
                                          });
                                        },
                                        child: Container(
                                          height: height / 25.13,
                                          width: width / 3.6,
                                          decoration: BoxDecoration(
                                              color:
                                                  selectedCategories.contains(
                                                          'ENT specialist')
                                                      ? Color(0xff2F649A)
                                                      : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all()),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: height / 150.8),
                                            child: Text(
                                              'ENT specialist',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: selectedCategories
                                                          .contains(
                                                              'ENT specialist')
                                                      ? Colors.white
                                                      : Color(0xff2F649A)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width / 24,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (selectedCategories
                                                .contains('Artho')) {
                                              selectedCategories
                                                  .remove('Artho');
                                            } else {
                                              selectedCategories.add('Artho');
                                            }
                                          });
                                        },
                                        child: Container(
                                          height: height / 25.13,
                                          width: width / 3.6,
                                          decoration: BoxDecoration(
                                              color: selectedCategories
                                                      .contains('Artho')
                                                  ? Color(0xff2F649A)
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all()),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: height / 150.8),
                                            child: Text(
                                              'Artho',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: selectedCategories
                                                          .contains('Artho')
                                                      ? Colors.white
                                                      : Color(0xff2F649A)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height / 50.26,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        category = "Next";
                                        selectedPage = 5;
                                      });
                                      _pageController.animateToPage(
                                        selectedPage,
                                        duration:
                                            const Duration(milliseconds: 800),
                                        curve: Curves.easeInOut,
                                      );
                                    },
                                    child: Container(
                                      height: height / 25.13,
                                      width: width / 3.6,
                                      decoration: BoxDecoration(
                                        color: Color(0xff2F649A),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: height / 150.8),
                                        child: Text(
                                          'Next',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: height / 25.13),
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
                                  height: height / 12.56,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      perfer = "No";
                                      selectedPage = 6;
                                    });
                                    _pageController.animateToPage(
                                      selectedPage,
                                      duration: Duration(milliseconds: 800),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  child: Container(
                                    height: height / 18.85,
                                    width: width / 1.44,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: perfer == "No"
                                            ? Color(0xff2F649A)
                                            : Colors.transparent,
                                        border: Border.all()),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(top: height / 150.8),
                                      child: Text(
                                        'No',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: perfer == "No"
                                                ? Colors.white
                                                : Color(0xff2F649A)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height / 50.26,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      perfer = "Yes";
                                      selectedPage = 6;
                                    });
                                    _pageController.animateToPage(
                                      selectedPage,
                                      duration: Duration(milliseconds: 800),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  child: Container(
                                    height: height / 18.85,
                                    width: width / 1.44,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: perfer == "Yes"
                                            ? Color(0xff2F649A)
                                            : Colors.transparent,
                                        border: Border.all()),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(top: height / 150.8),
                                      child: Text(
                                        'Yes',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: perfer == "Yes"
                                                ? Colors.white
                                                : Color(0xff2F649A)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: height / 75.4),
                                  child: Text(
                                    'Upload your profile pic',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    _getImage();
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Stack(
                                      children: [
                                        DottedBorder(
                                          borderType: BorderType.Circle,
                                          radius:
                                              Radius.circular(height / 7.0 / 2),
                                          padding: EdgeInsets.all(
                                              0), // Adjust padding as needed
                                          child: ClipOval(
                                            child: Container(
                                              height: height / 7.0,
                                              width: height / 7.0,
                                              child: _image == null
                                                  ? Center(
                                                      child: Text(
                                                        'Click here to add\n a photo',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    )
                                                  : Image.file(
                                                      _image!,
                                                      fit: BoxFit.cover,
                                                    ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Select the Gender",
                                        style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                      RadioListTile<String>(
                                        title: Text(
                                          'Male',
                                        ),
                                        value: 'Male',
                                        groupValue: selectedGender,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedGender = value!;
                                          });
                                        },
                                      ),
                                      RadioListTile<String>(
                                        title: Text('Female'),
                                        value: 'Female',
                                        groupValue: selectedGender,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedGender = value!;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _showAlertDialogBox(context);
                                      _getCurrentLocation;
                                    });
                                  },
                                  child: Container(
                                    height: height / 21.54,
                                    width: width / 1.8,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: Color(0xff2F649A))),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(top: height / 150.8),
                                      child: Text(
                                        'Submit',
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
                        height: height / 25.13,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width / 18),
                        child: PageViewDotIndicator(
                          currentItem: selectedPage,
                          count: pageCount,
                          unselectedColor: Colors.black26,
                          selectedColor: Colors.blue,
                          duration: Duration(milliseconds: 800),
                          boxShape: BoxShape.circle,
                          onItemClicked: (index) {
                            _pageController.animateToPage(
                              index,
                              duration: Duration(milliseconds: 800),
                              curve: Curves.easeInOut,
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: height / 47.12,
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

  Widget _buildLanguageSelectionRow(List<String> languages) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: languages.map((language) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 45),
          child: InkWell(
            onTap: () {
              setState(() {
                if (selectedLanguages.contains(language)) {
                  selectedLanguages.remove(language);
                } else {
                  selectedLanguages.add(language);
                }
              });
            },
            child: Container(
              height: height / 25.13,
              width: width / 3.6,
              decoration: BoxDecoration(
                color: selectedLanguages.contains(language)
                    ? Color(0xff2F649A)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color(0xff2F649A)),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: height / 150.8),
                child: Text(
                  language,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: selectedLanguages.contains(language)
                        ? Colors.white
                        : Color(0xff2F649A),
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  void _showAlertDialogBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          double width = MediaQuery.of(context).size.width;
          double height = MediaQuery.of(context).size.height;
          return StatefulBuilder(builder: (context, set) {
            return AlertDialog(
              backgroundColor: Color(0xffFFFFFF),
              title: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: height / 3.77,
                      width: width / 1.8,
                      child: Image.asset('assets/successful_purchase.png'),
                    ),
                    SizedBox(
                      height: height / 37.7,
                    ),
                    Text(
                      'Verification Successful!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff18353F)),
                    ),
                    SizedBox(
                      height: height / 75.4,
                    ),
                    Text(
                      'Thank you for your Verification.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: height / 10.77,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          set(() {
                            _addToCart(context);
                            // _getCurrentLocation();
                          });
                        },
                        child: Text("success....")),
                    if (isLoading)
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                  ],
                ),
              ),
            );
          });
        });
  }

  Future<String> _uploadImageToFirebaseStorage(File imageFile) async {
    final firebase_storage.Reference ref = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('images/${DateTime.now().toString()}');
    final firebase_storage.UploadTask uploadTask = ref.putFile(imageFile);
    final firebase_storage.TaskSnapshot downloadTask = await uploadTask;
    final String imageUrl = await downloadTask.ref.getDownloadURL();
    print('Image uploaded to Firebase Storage: $imageUrl');
    return imageUrl; // Return the download URL of the uploaded image
  }

  bool isLoading = false;

  void _addToCart(BuildContext context) async {
    setState(() {
      isLoading = true;
    });

    try {
      print(FirebaseAuth.instance.currentUser!.uid);
      String imageUrl = await _uploadImageToFirebaseStorage(_image!);
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("JobSeeking")
          .where("userid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Document already exists, show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Job Seeking already exists')),
        );
        return;
      }

      // Add document to Firestore
      await FirebaseFirestore.instance.collection("JobSeeking").add({
        "name": widget.name,
        "aadharno": widget.aadhar,
        "phone": widget.phonenumber,
        "option": option,
        "Experience": exp,
        "prefer": perfer,
        "available": available,
        "language": selectedLanguages,
        "category": selectedCategories,
        "imageUrl": imageUrl,
        "joindate": "",
        "status": "",
        "location": "",
        "gender": selectedGender,
        "userid": FirebaseAuth.instance.currentUser!.uid,
      });

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Job Seeking added  successfully')),
      );

      // Navigate back to home screen
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    } catch (error) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error adding Job Seeking: $error')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}
