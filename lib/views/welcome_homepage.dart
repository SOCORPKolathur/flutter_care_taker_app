import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/Constants/colors.dart';
import 'package:flutter_care_taker_app/views/chat_screen.dart';
import 'package:flutter_care_taker_app/views/profile.dart';
import 'package:flutter_care_taker_app/views/navbar.dart';
import 'package:flutter_care_taker_app/views/product_screen.dart';
import 'package:flutter_care_taker_app/views/profile_details.dart';
import 'package:flutter_care_taker_app/views/profile_page_second.dart';
import 'package:flutter_care_taker_app/views/searchscreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            ListTile(
              title: Text('Search Screen'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              },
            ),
            ListTile(
              title: Text('Profile Screen'),
              onTap: () {
                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => ProfileDetails()));
              },
            )
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (val) {
          setState(() {
            _selectedIndex = val;
          });
        },
        children: [
          SingleChildScrollView(
            child: Column(children: [
              Stack(
                children: [
                  InkWell(
                    onTap: () {
                      print(width);
                      print(height);
                    },
                    child: Container(
                      width: width / 0.98,
                      child: Image.asset('assets/Ellipse.png'),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: height / 16.39, left: width / 1.2),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => NavBar()));
                      },
                      child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.menu,
                            color: Color(0xff2F649A),
                            size: 30,
                          )),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: height / 13.70, left: width / 24),
                    child: Text(
                      'Good Morning',
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xffFFFFFF).withOpacity(.6),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: height / 8.87, left: width / 24),
                    child: Text(
                      '',
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
                  SizedBox(
                    height: height/25.13,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width / 24,
                      ),
                      Container(
                        height: height / 7.54,
                        width: width / 2.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffECF5FF),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: height / 50.26,
                                ),
                                Text(
                                  '18',
                                  style: GoogleFonts.openSans(
                                      fontSize: 20,
                                      color: Color(0xff2F649A),
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'Connections',
                                  style: GoogleFonts.openSans(
                                      fontSize: 14,
                                      color: Color(0xff000000),
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'made',
                                  style: GoogleFonts.openSans(
                                      fontSize: 14,
                                      color: Color(0xff000000),
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: width / 4, bottom: height / 15.08),
                              child: Container(
                                  width: width / 9,
                                  child: Image.asset('assets/Login.png')),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: width / 36,
                      ),
                      Container(
                        height: height / 7.54,
                        width: width / 2.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffECF5FF),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: height / 50.26,
                                ),
                                Text(
                                  '26',
                                  style: GoogleFonts.openSans(
                                      fontSize: 20,
                                      color: Color(0xff2F649A),
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'Connections',
                                  style: GoogleFonts.openSans(
                                      fontSize: 14,
                                      color: Color(0xff000000),
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'left',
                                  style: GoogleFonts.openSans(
                                      fontSize: 14,
                                      color: Color(0xff000000),
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: width / 4, bottom: height / 15.08),
                              child: Container(
                                  width: width / 9,
                                  child: Image.asset('assets/Login.png')),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height/25.13,
                    width: width / 1.12,
                    child: Divider(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: width / 20, top: height / 75.4),
                        child: Text(
                          'Profiles from your search',
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color(0xff18353F),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: width / 4.5, top: height / 62.83),
                        child: Text(
                          'See all',
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: Color(0xff2F649A),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("JobSeeking")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Show a CircularProgressIndicator while the data is loading
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Container(
                      width: width / 1.04,
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            var document = snapshot.data!.docs[index];
                            return ListTile(
                              contentPadding: EdgeInsets.only(left: width / 36),
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    NetworkImage(document["imageUrl"]),
                              ),
                              title: Container(
                                width: width / 0.9,
                                child: Text(
                                  document["name"],
                                  style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Color(0xff18353F)),
                                ),
                              ),
                              subtitle: Container(
                                width: width / 0.9,
                                child: Text(
                                  document["option"],
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: Colors.grey),
                                ),
                              ),
                              trailing: Padding(
                                padding: EdgeInsets.only(right: width / 36),
                                child: Text(
                                  document["joindate"],
                                  style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    color: Color(0xff18353F).withOpacity(.5),
                                  ),
                                ),
                              ),
                            );
                          }),
                    );
                  }),
              SizedBox(
                height: height / 37.95,
              ),
            ]),
          ),
          ChatScreen(),
          ProfileScreen()
        ],
      ),
      bottomNavigationBar: Container(
        height: height / 10.84,
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
            padding: EdgeInsets.symmetric(
                horizontal: width / 24.0, vertical: height / 94.25),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 5,
              activeColor: primaryColor,
              iconSize: 24,
              padding: EdgeInsets.symmetric(
                  horizontal: width / 18, vertical: height / 62.83),
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

  String category = "";
}
