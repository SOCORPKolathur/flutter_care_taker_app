import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/Constants/colors.dart';
import 'package:flutter_care_taker_app/views/buynow.dart';
import 'package:flutter_care_taker_app/views/product_screen.dart';
import 'package:flutter_care_taker_app/views/role_page.dart';
import 'package:flutter_care_taker_app/views/welcomeback_screen.dart';
import 'package:flutter_care_taker_app/views/your_cart.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'navbar.dart';

class ProductDetailScreen extends StatefulWidget {
  String image;
  String docid;
  String name;
  int price;
  String description;

  ProductDetailScreen(
      this.image, this.docid, this.name, this.price, this.description);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _selectedIndex = 0;
  int _counter = 1;
  late int _currentPrice;

  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: _selectedIndex);
    _currentPrice = widget.price * _counter;
    super.initState();
    getdocid();
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
                  padding:
                      EdgeInsets.only(top: height / 15.08, left: width / 1.2),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => YourCart()));
                    },
                    child: Container(
                      width: width / 7.84,
                      height: height / 16.86,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: Icon(Icons.shopping_cart),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: height / 15.08, left: width / 24),
                  child: Container(
                    width: width / 7.84,
                    height: height / 16.86,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.arrow_back)),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: height / 12.56, left: width / 3.78),
                  child: Text(
                    'Product details',
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height / 5.2, left: width / 12),
                  child: Container(
                      height: height / 2.81,
                      width: width / 1.18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffECF5FF),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: width / 18, top: height / 75.4),
                            child: Stack(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: height / 21.54,
                                          left: width / 36),
                                      child: Container(
                                          height: height / 3.45,
                                          width: width / 1.78,
                                          child: Image.network(widget.image)),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: width / 1.71),
                                  child: Container(
                                    height: height / 18.97,
                                    width: width / 9.8,
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
                padding: EdgeInsets.only(left: width / 18, top: height / 37.7),
                child: Text(
                  widget.name,
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                      color: Color(0xff18353F)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: width / 3.6, top: height / 37.7),
                child: Text(
                  '₹ ${widget.price}',
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                      color: Color(0xff2F649A)),
                ),
              ),
            ]),
            Padding(
              padding: EdgeInsets.only(top: height / 50.26, left: width / 18),
              child: Text(
                widget.description,
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xff18353F).withOpacity(.5),
                ),
              ),
            ),
            SizedBox(
              height: height / 75.9,
            ),
            Padding(
              padding: EdgeInsets.only(left: width / 18, top: height / 37.7),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: CircleAvatar(
                      backgroundColor: Color(0xff2F649A),
                      radius: 15,
                      child: Padding(
                        padding: EdgeInsets.only(right: width / 36),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              if (_counter > 1) {
                                _counter--;
                                _currentPrice = widget.price * _counter;
                              }
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
                    padding:
                        EdgeInsets.only(left: width / 36, right: width / 36),
                    child: Text(
                      '$_counter',
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        color: Color(0xff2F649A),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Color(0xff2F649A),
                    radius: 15,
                    child: Padding(
                      padding: EdgeInsets.only(right: width / 36),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _counter++;
                            _currentPrice = widget.price * _counter;
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
                  SizedBox(
                    width: width / 19.6,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width / 2.76),
                    child: Text(
                      '₹ $_currentPrice/-',
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
              height: height / 37.95,
              width: width / 1.03,
              child: Divider(
                color: Color(0xff2F649A).withOpacity(.1),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: height / 75.4,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width / 18),
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
                    width: width / 19.6,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width / 4.5),
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
              height: height / 1.87,
              width: width / 0.98,
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                primary: false,
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                        height: height / 10.84,
                        width: width / 4.9,
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
                        padding: EdgeInsets.only(right: width / 7.2),
                        child: Text("red"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: height / 10.84,
                        width: width / 4.9,
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
                        padding: EdgeInsets.only(right: width / 7.2),
                        child: Text("red"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: height / 10.84,
                        width: width / 4.9,
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
                        padding: EdgeInsets.only(right: width / 7.2),
                        child: Text("red"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: height / 10.84,
                        width: width / 4.9,
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
                        padding: EdgeInsets.only(right: width / 7.2),
                        child: Text("red"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: height / 10.84,
                        width: width / 4.9,
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
                        padding: EdgeInsets.only(right: width / 7.2),
                        child: Text("red"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: height / 10.84,
                        width: width / 4.9,
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
                        padding: EdgeInsets.only(right: width / 7.2),
                        child: Text("red"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: height / 10.84,
                        width: width / 4.9,
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
                        padding: EdgeInsets.only(right: width / 7.2),
                        child: Text("red"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: height / 10.84,
                        width: width / 4.9,
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
                        padding: EdgeInsets.only(right: width / 7.2),
                        child: Text("red"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: height / 10.84,
                        width: width / 4.9,
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
                        padding: EdgeInsets.only(right: width / 7.2),
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
            InkWell(
              onTap: () {
                addToCart();
              },
              child: Container(
                width: width / 2.61,
                height: height / 18.97,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.only(left: width / 14.4, top: height / 107.71),
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
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BuyNowCart(
                      widget.docid,
                      widget.image,
                      widget.name,
                      _currentPrice,
                      _counter,
                      widget.price,
                      widget.description,
                    ),
                  ),
                );
              },
              child: Container(
                width: width / 2.61,
                height: height / 18.97,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding:
                      EdgeInsets.only(left: width / 14.4, top: height / 107.71),
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

  String UID = "  ";

  getdocid() async {
    var user = await FirebaseFirestore.instance.collection("Person").get();
    for (int i = 0; i < user.docs.length; i++) {
      if (user.docs[i]["userid"] == FirebaseAuth.instance.currentUser!.uid) {
        setState(() {
          UID = user.docs[i].id;
        });
      }
    }
  }

  void addToCart() {
    if (FirebaseAuth.instance.currentUser != null) {
      FirebaseFirestore.instance
          .collection("Person")
          .doc(UID)
          .collection("MyCart")
          .doc(widget.docid)
          .set({
        "name": widget.name,
        "description": widget.description,
        "price": widget.price,
        "image": widget.image,
        "count": 1, // Assuming initial count is 1
        "productprice": widget.price,
      }).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Item added to cart'),
          ),
        );
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to add item to cart: $error'),
          ),
        );
      });
    } else {
      showToastMessage('Please login to add items to the cart');
    }
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

  final snackBar = SnackBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.green, width: 3),
          boxShadow: const [
            BoxShadow(
              color: Color(0x19000000),
              spreadRadius: 2.0,
              blurRadius: 8.0,
              offset: Offset(2, 4),
            )
          ],
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            Icon(Icons.done, color: Colors.green),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text('Add to cart Successfully!!',
                  style: TextStyle(color: Colors.black)),
            ),
            const Spacer(),
          ],
        )),
  );
}
