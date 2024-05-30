import 'dart:ffi';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/Constants/colors.dart';
import 'package:flutter_care_taker_app/views/first_screen.dart';
import 'package:flutter_care_taker_app/views/navbar.dart';
import 'package:flutter_care_taker_app/views/productdetail_screen.dart';
import 'package:flutter_care_taker_app/views/profile_details.dart';
import 'package:flutter_care_taker_app/views/role_page.dart';
import 'package:flutter_care_taker_app/views/searchscreen.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List NameProduct = [
    "Aluminium walking Strick",
    "Senior citizens chair red",
    "Tourist walking stick",
    "Tourist walking stick",
    "Tourist walking stick",
    "Bathroom safety products "
  ];
  List Product = [
    " stick",
    "red",
  ];
  List Price = ["₹ 1588", "₹ 4338", "₹ 1588", "₹ 4338", "₹ 4338", "₹ 1588",];
  List Ima = [
    "assets/walking_stick.png",
    "assets/flat_char.png",
    "assets/bluestrick.png",
    "assets/fold_walking.png",
    "assets/Group 80.png",
    "assets/char.png",
  ];

  int _selectedIndex = 0;
  String option = " All";

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
                    MaterialPageRoute(builder: (context) => ProductScreen()));
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
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfileDetails()));
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
                  Container(
                    width: width / 0.98,
                    child: Image.asset('assets/Ellipse.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 46, left: 300),
                    child: Container(
                      width: width / 7.12,
                      height: height / 15.18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.white,
                      ),
                      child: IconButton(
                          onPressed: () {
                            _key.currentState!.openEndDrawer();
                          },
                          icon: Icon(Icons.menu)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 35, left: 15),
                    child: Text(
                      ' Hello , Bharath',
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xffFFFFFF).withOpacity(.6),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 65, left: 15),
                    child: Text(
                      ' Buy your neccessary\n things here,',
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 130, left: 10),
                    child: Row(
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
                  ),
                ],
              ),
              SizedBox(
                height: height /25.3,
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
                            width: width / 30.36,
                          ),
                          Container(
                            height: height / 18.97,
                            width: width / 3.01,
                            decoration: BoxDecoration(
                                color: option == "All"
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
                                    'assets/Basket.png',
                                    color: option == "All"
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
                                      option = "All";
                                    });
                                  },
                                  child: Text(
                                    'All',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w600,
                                      color: option == "All"
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
                                color: option == "Baby"
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
                                    'assets/Sleeping Baby.png',
                                    color: option == "Baby"
                                        ? Colors.white
                                        : Color(0xff2F649A),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      option = "Baby";
                                    });
                                  },
                                  child: Text(
                                    'Baby',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.openSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: option == "Baby"
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
                                color: option == "Senior"
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
                                    'assets/Elderly Person.png',
                                    color: option == "Senior"
                                        ? Colors.white
                                        : Color(0xff2F649A),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      option = "Senior";
                                    });
                                  },
                                  child: Text(
                                    'Senior',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: option == "Senior"
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
                    height: height/25.3,
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 4 / 5),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: Ima.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 15,left: 20),
                          child: Container(
                            width: width/1.26,
                            height: height/4.46,

                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(20),
                            ),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ProductDetailScreen("Ima")));
                                  },
                                  child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      Container(
                                          width: width/1.86,
                                          height: height/4.97,
                                          decoration: BoxDecoration(
                                            color: Color(0xffECF5FF),
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: Image.asset(Ima[index]),
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                            height: height/25.97,
                                            width: width/13.8,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: Color(0xff2F649A),
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.bookmark,
                                                color: Colors.white,
                                                size: 17,
                                              ),
                                            )
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0,top: 4),
                                  child: Text(
                                    NameProduct[index],
                                    style: GoogleFonts.openSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff18353F),
                                  ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left:10,right: 0),
                                  child: Text(
                                    Price[index],
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.openSans(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xff2F649A),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),

                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
