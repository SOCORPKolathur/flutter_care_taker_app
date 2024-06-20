import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/Constants/colors.dart';
import 'package:flutter_care_taker_app/views/profile_details.dart';
import 'package:flutter_care_taker_app/views/searchscreen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'chatting_page.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: width / 0.98,
                  child: Image.asset('assets/Ellipse.png'),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: height/12.56, left: width/10.28),
                  child: Text(
                    'Chats',
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: height/6.28, left: width/36),
                  child: Row(
                    children: [
                      SizedBox(
                        width: width / 19.6,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            //Navigator.of(context).push(MaterialPageRoute(
                            // builder: (context) => SearchScreen()));
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
                                padding: EdgeInsets.only(left: width/180),
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
                ),
              ],
            ),
            SizedBox(
              height: height / 25.3,
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
                    width: width / 1.12,
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          var document = snapshot.data!.docs[index];
                          return Column(
                            children: [
                              ListTile(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ChattingPage(
                                          document["imageUrl"],
                                          document["name"],
                                          document["option"],
                                          document['userid'])));
                                },
                                leading: CircleAvatar(
                                  radius: 25,
                                  backgroundImage:
                                      NetworkImage(document["imageUrl"]),
                                ),
                                title: Text(
                                  document["name"],
                                  style: GoogleFonts.openSans(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff18353F),
                                  ),
                                ),
                                subtitle: Text(
                                  document["option"],
                                  style: GoogleFonts.openSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff18353F),
                                  ),
                                ),
                                trailing: Padding(
                                  padding:  EdgeInsets.only(bottom: height/37.7),
                                  child: Text('12:34 pm'),
                                ),
                              ),
                              SizedBox(
                                height: height / 37.95,
                              ),
                            ],
                          );
                        }),
                  );
                }),
            SizedBox(
              height: height / 37.95,
            ),
          ],
        ),
      ),
    );
  }
}
