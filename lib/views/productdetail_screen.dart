import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/Constants/colors.dart';
import 'package:flutter_care_taker_app/views/buynow.dart';
import 'package:flutter_care_taker_app/views/product_screen.dart';
import 'package:flutter_care_taker_app/views/role_page.dart';
import 'package:flutter_care_taker_app/views/welcomeback_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'navbar.dart';

class ProductDetailScreen extends StatefulWidget {
  String Ima;

  ProductDetailScreen(this.Ima);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {

  int _selectedIndex = 0;
  int _counter = 0;

  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: _selectedIndex);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: width / 0.98,
                  child: Image.asset('assets/ellipse_one.png'),
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
                    child: IconButton(
                        onPressed: () {}, icon: Icon(Icons.shopping_cart)),
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
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductScreen()));
                        },
                        icon: Icon(Icons.arrow_back)),
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
                  padding: const EdgeInsets.only(top: 145, left: 30),
                  child: Container(
                      height: height/2.81,
                      width: width/1.18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffECF5FF),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: Stack(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 35,left: 10),
                                      child: Container(
                                          height: height/3.45,
                                          width: width/1.78,
                                          child: Image.asset(
                                              'assets/walking_stick.png')),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 210),
                                  child: Container(
                                    height: height/18.97,
                                    width: width/9.8,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color(0xff2F649A),
                                    ),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.bookmark,
                                          color: Colors.white,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                )
              ],
            ),
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  'MCP Folding Walking',
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                      color: Color(0xff18353F)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 90, top: 20),
                child: Text(
                  '₹ 395/-',
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                      color: Color(0xff2F649A)),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.only(right: 215),
              child: Text(
                'Stick - Silver',
                style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                    color: Color(0xff18353F)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 20),
              child: Text(
                'Its sturdy aluminum construction ensures both strength and lightness, making it easy to carry and maneuver throughout your daily activities.',
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xff18353F).withOpacity(.5),
                ),
              ),
            ),
            SizedBox(
              height: height/75.9,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: CircleAvatar(
                      backgroundColor: Color(0xff2F649A),
                      radius: 15,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _counter--;
                            });
                          },
                          icon: Icon(
                            Icons.remove,
                            size: 15,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      '$_counter',
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        color: Color(0xff2F649A),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: CircleAvatar(
                      backgroundColor: Color(0xff2F649A),
                      radius: 15,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _counter++;
                            });
                          },
                          icon: Icon(
                            Icons.add,
                            size: 15,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width / 19.6,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 130),
                    child: Text(
                      '₹ 790/-',
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Color(0xff2F649A),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height/37.95,
              width: width/1.03,
              child: Divider(
                color: Color(0xff2F649A).withOpacity(.1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Similar products',
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        color: Color(0xff18353F),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width/19.6,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 80),
                    child: Text(
                      'See all',
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Color(0xff2F649A),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: height/1.87,
              width: width/0.98,
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                primary: false,
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                        height: height/10.84,
                        width: width/4.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade100,
                        ),
                        child: Image.asset('assets/bluestrick.png'),
                      ),
                      Text(
                        "Senior citizens \nchair",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Text("red"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: height/10.84,
                        width: width/4.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade100,
                        ),
                        child: Image.asset('assets/walkingstrick_stand.png'),
                      ),
                      Text(
                        "Senior citizens \nchair",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Text("red"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: height/10.84,
                        width: width/4.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade100,
                        ),
                        child: Image.asset('assets/Group 80.png'),
                      ),
                      Text(
                        "Senior citizens \nchair",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Text("red"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: height/10.84,
                        width: width/4.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade100,
                        ),
                        child: Image.asset('assets/walking_stick.png'),
                      ),
                      Text(
                        "Senior citizens \nchair",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Text("red"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: height/10.84,
                        width: width/4.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade100,
                        ),
                        child: Image.asset('assets/walking_stick.png'),
                      ),
                      Text(
                        "Senior citizens \nchair",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Text("red"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: height/10.84,
                        width: width/4.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade100,
                        ),
                        child: Image.asset('assets/Group 80.png'),
                      ),
                      Text(
                        "Senior citizens \nchair",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Text("red"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: height/10.84,
                        width: width/4.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade100,
                        ),
                        child: Image.asset('assets/walking_stick.png'),
                      ),
                      Text(
                        "Senior citizens \nchair",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Text("red"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: height/10.84,
                        width: width/4.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade100,
                        ),
                        child: Image.asset('assets/walkingstrick_stand.png'),
                      ),
                      Text(
                        "Senior citizens \nchair",
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Text("red"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: height/10.84,
                        width: width/4.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade100,
                        ),
                        child: Image.asset('assets/walking_stick.png'),
                      ),
                      Text(
                        "Senior citizens \nchair",
                        style: GoogleFonts.openSans(
                          fontSize: 10,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Text("red"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          color: primaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: width/2.61,
              height: height/18.97,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 25, top: 7),
                child: Text(
                  'Add to cart',
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BuyNowCart()));
              },
              child: Container(
                width: width/2.61,
                height: height/18.97,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 35, top: 7),
                  child: Text(
                    'Buy now',
                    style: GoogleFonts.openSans(
                      color: primaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
