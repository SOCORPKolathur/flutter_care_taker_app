import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/views/searchscreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'navbar.dart';

class ProfileDetails extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String option;
  final String docid;

  ProfileDetails(
    this.imageUrl,
    this.name,
    this.option,
    this.docid,
  );

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  int currentIndex = 0;

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
                padding:
                    EdgeInsets.only(top: height / 15.08, left: width / 1.2),
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
                    EdgeInsets.only(top: height / 12.56, left: width / 3.78),
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
                padding: EdgeInsets.only(top: height / 6.28, left: width / 24),
                child: Container(
                    height: height / 7.54,
                    width: width / 1.09,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffECF5FF),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(widget.imageUrl),
                      ),
                      title: Padding(
                        padding: EdgeInsets.only(
                            left: width / 18, top: height / 50.26),
                        child: Text(
                          widget.name,
                          style: GoogleFonts.openSans(
                            color: Color(0xff18353F),
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.only(right: width / 36),
                        child: Container(
                          height: height / 25.3,
                          child: Row(children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.person,
                                  color: Color(0xff18353F).withOpacity(.6),
                                  size: 16,
                                )),
                            Text(
                              widget.option,
                              style: GoogleFonts.openSans(
                                color: Color(0xff18353F),
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ]),
                        ),
                      ),
                      trailing: Container(
                        height: height / 18.97,
                        width: width / 9.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: Icon(Icons.save),
                      ),
                    )),
              )
            ],
          ),
          SizedBox(
            height: height / 75.4,
          ),
          Padding(
            padding: EdgeInsets.only(right: width / 1.8, top: height / 37.7),
            child: Text(
              'Overview',
              style: GoogleFonts.openSans(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Color(0xff18353F),
              ),
            ),
          ),
          FutureBuilder(
            future: Future.delayed(
              Duration(seconds: 2),
              () => FirebaseFirestore.instance
                  .collection("JobSeeking")
                  .doc(widget.docid)
                  .get(),
            ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Show a CircularProgressIndicator while the data is loading
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.hasError) {
                // Handle the error state
                return Center(
                  child: Text('An error occurred!'),
                );
              }

              if (!snapshot.hasData || !snapshot.data!.exists) {
                // Handle the case when there is no data
                return Center(
                  child: Text('No data available'),
                );
              }
              Map<String, dynamic>? document = snapshot.data!.data();
              List<dynamic> docLanguages = document!["language"];
              List<dynamic> docCategories = document["category"];
              if (widget.name == document!["name"]) {
                return Padding(
                  padding: EdgeInsets.only(top: height / 75.4),
                  child: Container(
                    height: height / 1.25, // Set the height here
                    width: double.infinity,
                    // Set the width to occupy the available space
                    child: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Table(
                              border: TableBorder.all(
                                color: Color(0xff18353F).withOpacity(.3),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              children: [
                                TableRow(children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: height / 37.7,
                                            right: width / 12),
                                        child: Text(
                                          'Profession',
                                          style: GoogleFonts.openSans(
                                            color: Color(0xff18353F),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: width / 14.4,
                                          top: height / 75.4,
                                          bottom: height / 150.8,
                                        ),
                                        child: Row(children: [
                                          Icon(
                                            Icons.person,
                                            color: Color(0xff2F649A),
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            document["option"],
                                            style: GoogleFonts.openSans(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xff18353F)
                                                  .withOpacity(.4),
                                            ),
                                          ),
                                        ]),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: height / 37.7,
                                            right: width / 12),
                                        child: Text(
                                          'Experience',
                                          style: GoogleFonts.openSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff18353F),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 25,
                                            top: height / 75.4,
                                            bottom: height / 60),
                                        child: Row(children: [
                                          Icon(
                                            Icons.calendar_today_rounded,
                                            color: Color(0xff2F649A),
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            document["Experience"],
                                            style: GoogleFonts.openSans(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xff18353F)
                                                  .withOpacity(.4),
                                            ),
                                          )
                                        ]),
                                      ),
                                    ],
                                  ),
                                ]),
                                TableRow(children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: height / 37.7,
                                            right: width / 22.5,
                                            left: 10),
                                        child: Text(
                                          'Working shift',
                                          style: GoogleFonts.openSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff18353F),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: width / 12,
                                            top: height / 75.4,
                                            bottom: height / 60),
                                        child: Row(children: [
                                          Icon(
                                            Icons.calendar_today,
                                            color: Color(0xff2F649A),
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            document["available"],
                                            style: GoogleFonts.openSans(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xff18353F)
                                                  .withOpacity(.4),
                                            ),
                                          )
                                        ]),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: height / 37.7, right: 50),
                                        child: Text(
                                          'Location',
                                          style: GoogleFonts.openSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff18353F),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 20,
                                            top: height / 75.4,
                                            bottom: height / 75.4),
                                        child: Row(children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                bottom: height / 37.7),
                                            child: Icon(
                                              Icons.location_on,
                                              color: Color(0xff2F649A),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            width: width / 3.6,
                                            height: height / 15.08,
                                            child: Text(
                                              document["location"],
                                              style: GoogleFonts.openSans(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xff18353F)
                                                    .withOpacity(.4),
                                              ),
                                            ),
                                          )
                                        ]),
                                      ),
                                    ],
                                  ),
                                ]),
                                TableRow(children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: height / 75.4,
                                            right: width / 14.4),
                                        child: Text(
                                          'Language',
                                          style: GoogleFonts.openSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff18353F),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: width / 11.25,
                                            top: height / 75.4),
                                        child: Row(children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                              bottom: height / 37.7,
                                            ),
                                            child: Icon(
                                              Icons.translate,
                                              color: Color(0xff2F649A),
                                              size: 20,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Container(
                                            width: width / 3.78,
                                            child: Text(
                                              docLanguages.join(", "),
                                              style: GoogleFonts.openSans(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xff18353F)
                                                    .withOpacity(.4),
                                              ),
                                            ),
                                          )
                                        ]),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: height / 75.4,
                                            left: width / 14.4),
                                        child: Text(
                                          'Williking to Work Outstation?',
                                          style: GoogleFonts.openSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff18353F),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: height / 75.4,
                                            right: width / 4.8),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.person,
                                                color: Color(0xff2F649A),
                                              ),
                                              SizedBox(
                                                width: width / 72,
                                              ),
                                              Text(
                                                document["prefer"],
                                                style: GoogleFonts.openSans(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xff18353F)
                                                      .withOpacity(.4),
                                                ),
                                              )
                                            ]),
                                      ),
                                    ],
                                  )
                                ]),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: width / 0.9,
                              height: height / 7.54,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Color(0xff18353F).withOpacity(.3),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: height / 75.4, right: width / 1.8),
                                    child: Text(
                                      'Job category',
                                      style: GoogleFonts.openSans(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff18353F),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: width / 18, top: height / 37.7),
                                    child: Row(children: [
                                      Icon(
                                        Icons.person,
                                        color: Color(0xff2F649A),
                                      ),
                                      SizedBox(
                                        width: width / 72,
                                      ),
                                      Container(
                                        width: width / 1.28,
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              for (var category
                                                  in docCategories)
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 2),
                                                  child: Container(
                                                    width: width / 4,
                                                    height: height / 30.16,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                          color: Color(
                                                                  0xff18353F)
                                                              .withOpacity(.3),
                                                        )),
                                                    child: Text(
                                                      category.toString(),
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height / 25.13,
                          ),
                          Container(
                            height: height / 15.18,
                            width: width / 1.15,
                            decoration: BoxDecoration(
                              color: Color(0xff2F649A),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(top: height / 75.4),
                              child: Text(
                                'Contact ',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  color: Color(0xffFFFFFF),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return SizedBox(
                  height: height / 75.4,
                );
              }
            },
          ),
        ]),
      ),
    );
  }
}
