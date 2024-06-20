import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empty_widget/empty_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/views/profile_details.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constants/colors.dart';
import 'navbar.dart';

class ListingPage extends StatefulWidget {
  final String profession;
  final List<String> selectedCategories;
  final String type;
  final String option;
  final String gender;
  final List<String> selectedLanguages;
  ListingPage(this.profession, this.selectedCategories, this.type, this.option,
      this.selectedLanguages, this.gender);

  @override
  State<ListingPage> createState() => _ListingPageState();
}

class _ListingPageState extends State<ListingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdocid();
    print(widget.option);
    print(widget.type);
    print(widget.selectedCategories);
    print(widget.selectedLanguages);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: width / 0.98,
                child: Image.asset('assets/Ellipse.png'),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: height / 16.39, left: width / 1.22),
                child: Container(
                  width: width / 6.63,
                  height: height / 15.18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                  ),
                  child: IconButton(
                    onPressed: () {
                     Navigator.of(context).pop();
                      getdocid();
                      print("Document ID: ${docid}");
                      print("Name: ${name}");
                      print("Phone: ${phone}");
                      print("Type: ${type}");
                      print("Image URL: ${image}");
                      print("Address: ${address}");
                    },
                    icon: Container(
                        height: 30, child: Image.asset('assets/Slider.png')),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height / 15.08, left: width / 24),
                child: Text(
                  'Search Listing ',
                  style: GoogleFonts.openSans(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffFFFFFF),
                  ),
                ),
              ),
            ],
          ),
          FutureBuilder(
            future: Future.delayed(
              Duration(seconds: 2),
              () => FirebaseFirestore.instance
                  .collection("JobSeeking")
                  .doc(docid)
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
                return Center(
                  child: EmptyWidget(
                    image: null,
                    packageImage: PackageImage.Image_2,
                    title: 'No match data available',
                    titleTextStyle: TextStyle(
                      fontSize: 18,
                      color: primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }

              Map<String, dynamic>? document = snapshot.data!.data();

              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProfileDetails(
                            document["imageUrl"],
                            document["name"],
                            document["option"],
                            "${docid}",
                          )));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: height / 4.71,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.only(left: width / 36),
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                NetworkImage(document!["imageUrl"]),
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
                            padding: EdgeInsets.only(right: width / 36),
                            child: Container(
                              height: height / 25.13,
                              width: width / 4.23,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: Colors.blue.shade50,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: width / 36, top: height / 150.8),
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
                          padding: EdgeInsets.only(left: width / 18),
                          child: Container(
                            width: width / 1.12,
                            child: Text(
                              'Proficient in ${document["language"].length} languages,'
                              '${document["prefer"] == "Yes" ? " willing to work outstation," : " seeking  for a job opportunity ${document["location"] == "Location permissions are permanently denied." ? "" : " in ${document["location"]}"}."}'
                              ' Available for ${document["available"]} shifts.',
                              style: GoogleFonts.openSans(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff18353F).withOpacity(.7),
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
                                      color: Color(0xff18353F).withOpacity(.7),
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
                                      color: Color(0xff18353F).withOpacity(.7),
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
            },
          ),
        ],
      ),
    );
  }

  String? docid;
  String name = "  ";
  String phone = "  ";
  String image = "  ";
  String type = "  ";
  String address = "  ";
  String Gender = "  ";
  getdocid() async {
    var user = await FirebaseFirestore.instance.collection("JobSeeking").get();
    for (var doc in user.docs) {
      var data = doc.data();

      bool professionMatches = data["option"] == widget.profession;
      bool experienceMatches =
          data["Experience"] == widget.option || widget.option.isEmpty;
      bool availabilityMatches = data["available"] == widget.type;
      bool genderMatches =
          data["gender"] == widget.gender || widget.gender.isEmpty;
      bool categoriesMatch = _containsAny(
              List<String>.from(data["category"]), widget.selectedCategories) ||
          widget.selectedCategories.isEmpty;
      bool languagesMatch = _containsAny(
          List<String>.from(data["language"]), widget.selectedLanguages);

      if (professionMatches &&
          experienceMatches &&
          availabilityMatches &&
          categoriesMatch &&
          languagesMatch &&
          genderMatches) {
        setState(() {
          docid = doc.id;
          name = data["name"];
          phone = data["phone"];
          type = data["available"];
          image = data["imageUrl"];
          address = data["location"];
          Gender = data["gender"];
        });
        // Exit the loop after finding the first match
        break;
      } else {
        // Print a message indicating no match found for this document
        print('No match found for this document.');
      }
    }
  }

// Utility function to check if any elements in list1 are in list2
  bool _containsAny(List<String> list1, List<String> list2) {
    for (String item in list1) {
      if (list2.contains(item)) {
        return true;
      }
    }
    return false;
  }
}
