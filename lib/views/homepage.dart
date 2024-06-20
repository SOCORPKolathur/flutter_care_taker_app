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
import 'package:flutter_care_taker_app/views/searchscreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String option = "Doctors";

  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: _selectedIndex);

    super.initState();
    getdocid();
  }


  String docid = "  ";
  String name = "  ";


  getdocid() async {
    var user = await FirebaseFirestore.instance.collection("Person").get();
    for (int i = 0; i < user.docs.length; i++) {
      if (user.docs[i]["userid"] == FirebaseAuth.instance.currentUser!.uid) {
        setState(() {
          docid = user.docs[i].id;
          name = user.docs[i]["name"];

        });
      }
    }
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      // key: _key,
      // endDrawer: Drawer(
      //   child: Column(
      //     children: [
      //       UserAccountsDrawerHeader(
      //         accountName: Text(
      //           'CareTaker',
      //           style: GoogleFonts.openSans(
      //             fontWeight: FontWeight.w700,
      //             fontSize: 20,
      //             color: Colors.black,
      //           ),
      //         ),
      //         accountEmail: Text('Version 0.1'),
      //         currentAccountPicture: CircleAvatar(
      //           backgroundImage: AssetImage('assets/Frame.png'),
      //         ),
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(20),
      //           image: DecorationImage(
      //             image: AssetImage('assets/background_images.jpg'),
      //             fit: BoxFit.cover,
      //           ),
      //         ),
      //       ),
      //       ListTile(
      //         title: Text('Prefference Screen'),
      //         onTap: () {
      //           Navigator.of(context)
      //               .push(MaterialPageRoute(builder: (context) => HomePage()));
      //         },
      //       ),
      //       ListTile(
      //         title: Text('Search Screen'),
      //         onTap: () {
      //           Navigator.of(context).push(
      //               MaterialPageRoute(builder: (context) => SearchScreen()));
      //         },
      //       ),
      //       ListTile(
      //         title: Text('Profile Screen'),
      //         onTap: () {
      //           // Navigator.of(context).push(
      //           //     MaterialPageRoute(builder: (context) => ProfileDetails()));
      //         },
      //       )
      //     ],
      //   ),
      // ),
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
                  // Padding(
                  //   padding:
                  //       EdgeInsets.only(top: height / 16.39, left: width / 1.2),
                  //   child: InkWell(
                  //     onTap: () {
                  //       Navigator.of(context).push(
                  //           MaterialPageRoute(builder: (context) => NavBar()));
                  //     },
                  //     child: CircleAvatar(
                  //         radius: 25,
                  //         backgroundColor: Colors.white,
                  //         child: Icon(
                  //           Icons.menu,
                  //           color: Color(0xff2F649A),
                  //           size: 30,
                  //         )),
                  //   ),
                  // ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: height / 13.70, left: width / 24),
                    child: Text(
                      'Hello ,${name}',
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
                                builder: (context) => SearchScreen()));
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
                                padding: EdgeInsets.only(left: width / 180),
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
                        width: width / 7.12,
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
                            return Padding(
                              padding: EdgeInsets.only(
                                top: height / 75.4,
                              ),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ProfileDetails(
                                            document["imageUrl"],
                                            document["name"],
                                            document["option"],
                                            document.id,
                                          )));
                                },
                                child: Container(
                                  height: height / 4.18,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        contentPadding:
                                            EdgeInsets.only(left: width / 36),
                                        leading: CircleAvatar(
                                          radius: 30,
                                          backgroundImage: NetworkImage(
                                              document["imageUrl"]),
                                        ),
                                        title: Container(
                                          width: width / 0.9,
                                          child: Text(
                                            document["name"],
                                            style: GoogleFonts.openSans(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
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
                                          padding: EdgeInsets.only(
                                              right: width / 36),
                                          child: Container(
                                            height: height / 25.13,
                                            width: width / 4.23,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                              color: Colors.blue.shade50,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: width / 45,
                                                  top: height / 150.8),
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
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: width / 18),
                                        child: Container(
                                          width: width / 1.12,
                                          child: Text(
                                            'Proficient in ${document["language"].length} languages,'
                                            '${document["prefer"] == "Yes" ? " willing to work outstation," : " seeking  for a job opportunity ${document["location"] == "Location permissions are permanently denied." ? "" : " in ${document["location"]}"}."}'
                                            ' Available for ${document["available"]} shifts.',
                                            style: GoogleFonts.openSans(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xff18353F)
                                                  .withOpacity(.7),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height / 75.4,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: width / 24,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.calendar_month,
                                                color: Color(0xff2F649A),
                                                size: 14,
                                              ),
                                              SizedBox(
                                                width: width / 72,
                                              ),
                                              Container(
                                                width: width / 3.6,
                                                child: Text(
                                                  document["Experience"],
                                                  style: GoogleFonts.openSans(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                    color: Color(0xff18353F)
                                                        .withOpacity(.7),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: width / 5.14,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                height: height / 25.13,
                                                child: Icon(
                                                  Icons.location_on,
                                                  color: Color(0xff2F649A),
                                                  size: 16,
                                                ),
                                              ),
                                              SizedBox(
                                                width: width / 72,
                                              ),
                                              SizedBox(
                                                width: width / 3.27,
                                                child: Text(
                                                  document["location"] ==
                                                          "Location permissions are permanently denied."
                                                      ? "searching..."
                                                      : document["location"],
                                                  style: GoogleFonts.openSans(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff18353F)
                                                        .withOpacity(.7),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
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
          ProductScreen(),
          ProfilePage()
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
              gap: 8,
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

  String category = "";
}
