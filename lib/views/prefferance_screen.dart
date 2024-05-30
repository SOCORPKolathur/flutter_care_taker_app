import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/Constants/colors.dart';
import 'package:flutter_care_taker_app/views/chat_screen.dart';
import 'package:flutter_care_taker_app/views/first_screen.dart';
import 'package:flutter_care_taker_app/views/navbar.dart';
import 'package:flutter_care_taker_app/views/product_screen.dart';
import 'package:flutter_care_taker_app/views/profile_details.dart';
import 'package:flutter_care_taker_app/views/searchscreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class PrefferenceScreen extends StatefulWidget {
  const PrefferenceScreen({Key? key}) : super(key: key);

  @override
  State<PrefferenceScreen> createState() => _PrefferenceScreenState();
}

class _PrefferenceScreenState extends State<PrefferenceScreen> {
  int _selectedIndex = 0;
  String option = "Doctors";

  late final PageController _pageController;

  @override
  void initState() {

    _pageController = PageController(initialPage: _selectedIndex);

    super.initState();
  }


  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _key,
      endDrawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                'CareTaker',
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              accountEmail: Text('Version 0.1'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/Frame.png'),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('assets/background_images.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              title: Text('Prefference Screen'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PrefferenceScreen()));
              },
            ),
            ListTile(
              title: Text('Search Screen'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SearchScreen()));
              },
            ),
            ListTile(
              title: Text('Profile Screen'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ProfileDetails()));
              },
            )
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
       onPageChanged: (val){
          setState(() {
            _selectedIndex=val;
          });
       },
        children: [
          SingleChildScrollView(
            child: Column(children: [
              Stack(
                children: [
                  Container(
                    width: width/0.98,
                    child: Image.asset('assets/Ellipse.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 46, left: 300),
                    child: Container(
                      width: width/7.12,
                      height: height/15.18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.white,
                      ),
                      child: IconButton(
                          onPressed: (){
                        _key.currentState!.openEndDrawer();
                      }, icon: Icon(Icons.menu)),
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
                            width: width/30.36,
                          ),
                          Container(
                            height: height/18.97,
                            width: width/3.01,
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
                                  height: height/31.62,
                                  width: width/16.33,
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
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      option = "Doctors";
                                    });
                                  },
                                  child: Text(
                                    'Doctors',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w600,
                                      color: option == "Doctors"
                                          ? Colors.white
                                          : Color(0xff2F649A).withOpacity(.5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: width/39.2,
                          ),

                          Container(
                            height: height/18.97,
                            width: width/3.01,
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
                                  height: height/31.62,
                                  width: width/16.33,
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
                            width: width/39.2,
                          ),
                          Container(
                            height: height/18.97,
                            width: width/3.01,
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
                                  height: height/31.62,
                                  width: width/16.33,
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
                            width: width/39.2,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height/37.95,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width/19.6,
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchScreen()));
                          });
                        },
                        child: Container(
                          height: height/16.86,
                          width: width/1.45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade100,
                          ),
                          child: Row(
                            children: [
                              IconButton(onPressed: () {}, icon: Icon(Icons.search,color: Colors.grey,)),
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
                        width: width/19.6,
                      ),
                      Container(
                        height: height/15.18,
                        width: width/7.12,
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
                    height: height/37.95,
                    width: width/1.12,
                    child: Divider(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20,top: 10),
                        child: Text('Profiles from your search',style: GoogleFonts.openSans(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color(0xff18353F),

                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 80,top: 12),
                        child: Text('See all',style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: Color(0xff2F649A),

                        ),),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: height/75.9,
              ),
              Container(
                height: height/4.21,
                width: width/1.12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
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
                                padding: const EdgeInsets.only(left: 70,top: 5),
                                child: Text(
                                  'Dr. David Green',
                                  style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w600,
                                      fontSize: 16,color: Color(0xff18353F)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16,),
                                child: Text(
                                  'Nuerologist',
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,color: Colors.grey),
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
                                  left: 155,bottom: 20
                                ),
                                child: Container(
                                  height: height/18.97,
                                  width: width/4.35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.blue.shade50,
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(top: 11, left: 10),
                                    child: Text(
                                      'See details',
                                      style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        color: Color(0xff2F649A),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Text(
                          'Our goal is to make your nuerology system   experience to good ',
                      style: GoogleFonts.openSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff18353F).withOpacity(.7),
                      ),),
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.folder_copy_sharp, color: Color(0xff2F649A),
                              size: 14,
                            )),
                        Text(
                          '5 Years',
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                              color: Color(0xff18353F).withOpacity(.7),
                          ),
                        ),
                        SizedBox(
                          width: width/6.53,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.person, color: Color(0xff2F649A),
                              size: 14,
                            )),
                        Text(
                          '33 , Pudhur, Chennai',
                          style: GoogleFonts.openSans(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff18353F).withOpacity(.7),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height/37.95,
              ),
              Container(
                height: height/4.21,
                width: width/1.12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
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
                                padding: const EdgeInsets.only(left: 70,top: 5),
                                child: Text(
                                  'Dr. Stephen',
                                  style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,color: Color(0xff18353F)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16,),
                                child: Text(
                                  'Dentist',
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,color: Colors.grey),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                AssetImage('assets/doctor_person_two.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 155,bottom: 20
                                ),
                                child: Container(
                                  height: height/18.97,
                                  width: width/4.35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.blue.shade50,
                                  ),
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.only(top: 11, left: 10),
                                    child: Text(
                                      'See details',
                                      style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        color: Color(0xff2F649A),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Text(
                        'Our goal is to make your nuerology system   experience to good ',
                        style: GoogleFonts.openSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff18353F).withOpacity(.7),
                        ),),
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.folder_copy_sharp, color: Color(0xff2F649A),
                              size: 14,
                            )),
                        Text(
                          '2 Years',
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Color(0xff18353F).withOpacity(.7),
                          ),
                        ),
                        SizedBox(
                          width: width/7.12,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.person, color: Color(0xff2F649A),
                              size: 14,
                            )),
                        Text(
                          '13 , Kolathur, Chennai',
                          style: GoogleFonts.openSans(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff18353F).withOpacity(.7),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height/50.6,
              )
            ]),
          ),
          ChatScreen(),
          ProductScreen(),
          ProfileScreen()
        ],
      ),
      bottomNavigationBar: Container(
        height: height/10.84,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(

              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: primaryColor,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.white.withOpacity(0.50),
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.chat,
                  text: 'Chat',
                ),
                GButton(
                  icon: Icons.shopping_cart,
                  text: 'Product',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                  );
                  _selectedIndex = index;
                });
              },

            ),
          ),
        ),

      ),
    );
  }
}
