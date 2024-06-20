import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/views/productdetail_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../Constants/colors.dart';

class BuyNowCart extends StatefulWidget {
  final String docid;
  final String image;
  final String name;
  final int currentPrice;
  final int counter;
  final int productPrice;
  final String description;

  BuyNowCart(this.docid, this.image, this.name, this.currentPrice, this.counter,
      this.productPrice, this.description);

  // Rest of your BuyNowCart widget implementation

  @override
  State<BuyNowCart> createState() => _BuyNowCartState();
}

class _BuyNowCartState extends State<BuyNowCart> {
  int deliveryCharge = 50; // Delivery charge
  late int
      totalPrice; // Total price including product price and delivery charge

  @override
  void initState() {
    super.initState();
    totalPrice = widget.currentPrice + deliveryCharge;
    getdocid();
  }

  String? UID;

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
                padding: EdgeInsets.only(top: height / 15.08, left: width / 24),
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
                    EdgeInsets.only(top: height / 12.56, left: width / 2.4),
                child: Text(
                  'Orders',
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
            height: height / 25.3,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  leading: Container(
                    height: height / 9.42,
                    width: width / 4.5,
                    decoration: BoxDecoration(
                      color: Color(0xffECF5FF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.network(widget.image),
                  ),
                  title: Text(
                    widget.name,
                    style: GoogleFonts.openSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff18353F)),
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.only(right: width / 3.13),
                    child: Text(
                      'Stick - Silver',
                      style: GoogleFonts.openSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: Color(0xff18353F)),
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 9.42,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: width / 18),
                    child: Text(
                      "Order Details :-",
                      style: GoogleFonts.openSans(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 75.4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: width / 18),
                        child: Text(
                          "Product Name ",
                          style: GoogleFonts.openSans(
                              fontSize: 16,
                              color: Color(0xff18353F).withOpacity(.5),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width / 12,
                    ),
                    Text(
                      ":",
                      style: GoogleFonts.openSans(
                          fontSize: 20,
                          color: Color(0xff18353F).withOpacity(.5),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: width / 18,
                    ),
                    Text(
                      widget.name,
                      style: GoogleFonts.openSans(
                          fontSize: 16,
                          color: Color(0xff18353F).withOpacity(.5),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 75.4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: width / 18),
                        child: Text(
                          "QTY",
                          style: GoogleFonts.openSans(
                              fontSize: 16,
                              color: Color(0xff18353F).withOpacity(.5),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width / 3,
                    ),
                    Text(
                      ":",
                      style: GoogleFonts.openSans(
                          fontSize: 20,
                          color: Color(0xff18353F).withOpacity(.5),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: width / 18,
                    ),
                    Text(
                      widget.counter.toString(),
                      style: GoogleFonts.openSans(
                          fontSize: 16,
                          color: Color(0xff18353F).withOpacity(.5),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 75.4,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: width / 18),
                      child: Text(
                        'Product price:',
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Color(0xff18353F).withOpacity(.5),
                        ),
                      ),
                    ),
                    SizedBox(width: width / 9.47),
                    Text(
                      ":",
                      style: GoogleFonts.openSans(
                          fontSize: 20,
                          color: Color(0xff18353F).withOpacity(.5),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: width / 18,
                    ),
                    Text(
                      "₹ ${widget.currentPrice.toString()}",
                      style: GoogleFonts.openSans(
                          fontSize: 16,
                          color: Color(0xff18353F).withOpacity(.5),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 75.4,
                ),
                // Padding(
                //   padding: EdgeInsets.only(left: width / 18),
                //   child: Row(
                //     children: [
                //       Text(
                //         'Delivery charges',
                //         style: GoogleFonts.openSans(
                //           fontWeight: FontWeight.w700,
                //           fontSize: 16,
                //           color: Color(0xff18353F).withOpacity(.5),
                //         ),
                //       ),
                //       SizedBox(
                //         width: width / 20,
                //       ),
                //       Text(
                //         ":",
                //         style: GoogleFonts.openSans(
                //             fontSize: 20,
                //             color: Color(0xff18353F).withOpacity(.5),
                //             fontWeight: FontWeight.bold),
                //       ),
                //       SizedBox(
                //         width: width / 18,
                //       ),
                //       Text(
                //         "₹ ${deliveryCharge.toString()}",
                //         style: GoogleFonts.openSans(
                //             fontSize: 16,
                //             color: Color(0xff18353F).withOpacity(.5),
                //             fontWeight: FontWeight.bold),
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: height / 75.4,
                // ),
                SizedBox(
                  height: height / 37.95,
                  width: width / 1.05,
                  child: Divider(
                    color: Color(0xff2F649A),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: height / 75.4, left: width / 36),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: width / 90),
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
                        width: width / 5.22,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: width / 2.88),
                        child: Text(
                          "₹ ${widget.currentPrice.toString()}",
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
            height: height / 9.42,
          ),
          InkWell(
            onTap: () {
              if (FirebaseAuth.instance.currentUser != null) {
                FirebaseFirestore.instance
                    .collection("Person")
                    .doc(UID)
                    .collection("MyOrders")
                    .doc(widget.docid)
                    .set({
                  "name": widget.name,
                  "price": widget.currentPrice,
                  "image": widget.image,
                  "count": widget.counter.toString(),
                  "productprice": "₹ ${widget.currentPrice.toString()}",
                  "totalprice": "₹ ${totalPrice.toString()}",
                });

                showTopSnackBar(
                  Overlay.of(context),
                  CustomSnackBar.success(
                    backgroundColor:Color(0xff2F649A),

                    message:
                    'Item added to orders',
                  ),
                );
              } else {
                showToastMessage('Please login to add items to the Orders');
              }
            },
            child: Container(
              height: height / 15.18,
              width: width / 1.18,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Checkout',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                        color: Color(0xffFFFFFF),
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
              ),
            ),
          ),
          SizedBox(
            height: height / 18.85,
          ),
        ]),
      ),
    );
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
}
