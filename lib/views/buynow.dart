import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/views/productdetail_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constants/colors.dart';

class BuyNowCart extends StatefulWidget {
  const BuyNowCart({Key? key}) : super(key: key);

  @override
  State<BuyNowCart> createState() => _BuyNowCartState();
}

class _BuyNowCartState extends State<BuyNowCart> {
  int _counter = 0;

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
                padding: const EdgeInsets.only(top: 50, left: 15),
                child: Container(
                  width: width / 7.84,
                  height: height / 16.86,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: IconButton(
                      onPressed: () {Navigator.of(context).push(
                          MaterialPageRoute(builder: (context)=>ProductDetailScreen("Ima")));
                      },
                      icon: Icon(Icons.arrow_back)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60, left: 130),
                child: Text(
                  'My Cart',
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height/25.3,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  leading: Container(
                      height: height/12.65,
                      width: width/6.53,
                      decoration: BoxDecoration(
                        color: Color(0xffECF5FF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset('assets/walking_stick.png')),
                  title: Text(
                    'MCP Folding Walking ',
                    style: GoogleFonts.openSans(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff18353F)),
                  ),
                  subtitle: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 115),
                        child: Text(
                          'Stick - Silver',
                          style: GoogleFonts.openSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff18353F)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 165),
                        child: Text(
                          '₹ 395',
                          style: GoogleFonts.openSans(
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff2F649A)),
                        ),
                      ),
                    ],
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                        height: height/25.3,
                        width: width/13.06,
                        decoration: BoxDecoration(
                          color: Color(0xffECF5FF),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.close,
                              size: 15,
                            ))),
                  ),
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
                        width: width/19.6,
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
                  height: height/7.59,
                ),
                Container(
                  height: height/13.8,
                  width: width/1.15,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: primaryColor)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text('Shop more',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                            color: primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w800)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80, left: 5),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 7),
                        child: Text(
                          'Product price',
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xff18353F).withOpacity(.5),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width/16.86,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 150),
                        child: Text(
                          '₹ 790',
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                            color: Color(0xff2F649A).withOpacity(.8),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 5),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 7),
                        child: Text(
                          'Delivery charges',
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xff18353F).withOpacity(.5),
                          ),
                        ),
                      ),
                      SizedBox(
                        width:width/9.8,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 120),
                        child: Text(
                          '₹ 50',
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                            color: Color(0xff2F649A).withOpacity(.8),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height/37.95,
                  width: width/1.05,
                  child: Divider(
                    color: Color(0xff2F649A).withOpacity(.4),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Text(
                          'Total price',
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            color: Color(0xff18353F),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width/5.22,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 125),
                        child: Text(
                          '₹ 840',
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                            color: Color(0xff2F649A).withOpacity(.8),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height/25.3,
          ),
          Container(
            height: height/15.18,
            width: width/1.18,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Checkout',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                      color: Color(0xffFFFFFF),
                      fontSize: 20,
                      fontWeight: FontWeight.w600)),
            ),
          ),
          SizedBox(
            height: 40,
          ),
        ]),
      ),
    );
  }
}
