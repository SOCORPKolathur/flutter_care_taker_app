import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/Constants/colors.dart';
import 'package:flutter_care_taker_app/views/searchscreen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'chatting_page.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
                  padding: const EdgeInsets.only(top: 60, left: 35),
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
                  padding: const EdgeInsets.only(top: 120, left: 10),
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
              height: height/25.3,
            ),
        
            Column(
              children: [
        
                ListTile(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChattingPage('Ajay kumar')));
                  },
                  leading: CircleAvatar(radius: 30,
                  backgroundImage: AssetImage('assets/profile_image.png'),
                  ),
                  title: Text('Ajay kumar',
                    style: GoogleFonts.openSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff18353F),
                  ),),
                  subtitle: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 125),
                        child: Text('Care giver',
                          style: GoogleFonts.openSans(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff18353F),
                          ),
                        ),
                      ),
                      Text('Hi, Do you want a any need?',
                        style: GoogleFonts.openSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                  trailing: Text('12:34 pm'),
                ),
                SizedBox(
                  height: height/37.95,
                ),
                ListTile(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChattingPage('Jose')));
                  },
                  leading: CircleAvatar(radius: 30,
                    backgroundImage: AssetImage('assets/chat_image_one.png'),
                  ),
                  title: Text('Jose'),
                  subtitle: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 125),
                        child: Text('Medicare',
                          style: GoogleFonts.openSans(
                            fontSize: 9,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff18353F),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Text('Hi, did u see my profile?',
                          style: GoogleFonts.openSans(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  trailing: Text('January 17'),
                ),

                SizedBox(
                  height: height/37.95,
                ),
                ListTile(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChattingPage('Silvi')));
                  },
                  leading: CircleAvatar(radius: 30,
                    backgroundImage: AssetImage('assets/chat_girl_image.png'),
                  ),
                  title: Text('Silvi'),
                  subtitle: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 130),
                        child: Text('Doctor',
                          style: GoogleFonts.openSans(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff18353F),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Text('Hi, Are you need anything?',
                          style: GoogleFonts.openSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  trailing: Text('January 05'),
                ),
                SizedBox(
                  height: height/37.95,
                ),
                ListTile(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChattingPage('Jose')));
                  },
                  leading: CircleAvatar(radius: 30,
                    backgroundImage: AssetImage('assets/chat_image_one.png'),
                  ),
                  title: Text('Ajee'),
                  subtitle: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 125),
                        child: Text('Medicare',
                          style: GoogleFonts.openSans(
                            fontSize: 9,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff18353F),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 17),
                        child: Text('Hi, did u see my profile?',
                          style: GoogleFonts.openSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  trailing: Text('January 02'),
                ),
                SizedBox(
                  height: height/37.95,
                ),
                ListTile(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChattingPage('Jose')));
                  },
                  leading: CircleAvatar(radius: 30,
                    backgroundImage: AssetImage('assets/chat_image_two.png'),
                  ),
                  title: Text('Ajee'),
                  subtitle: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 135),
                        child: Text('Medicare',
                          style: GoogleFonts.openSans(
                            fontSize: 9,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff18353F),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 27),
                        child: Text('Hi, did u see my profile?',
                          style: GoogleFonts.openSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  trailing: Text('12:34 pm'),
                ),
                SizedBox(
                  height: height/37.95,
                ),
                ListTile(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChattingPage('Jose')));
                  },
                  leading: CircleAvatar(radius: 30,
                    backgroundImage: AssetImage('assets/chat_image_two.png'),
                  ),
                  title: Text('Ajee'),
                  subtitle: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 135),
                        child: Text('Medicare',
                          style: GoogleFonts.openSans(
                            fontSize: 9,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff18353F),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 27),
                        child: Text('Hi, did u see my profile?',
                          style: GoogleFonts.openSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  trailing: Text('12:34 pm'),
                ),
                SizedBox(
                  height: height/37.95,
                ),
                ListTile(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChattingPage('Jose')));
                  },
                  leading: CircleAvatar(radius: 30,
                    backgroundImage: AssetImage('assets/chat_image_two.png'),
                  ),
                  title: Text('Ajee'),
                  subtitle: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 135),
                        child: Text('Medicare',
                          style: GoogleFonts.openSans(
                            fontSize: 9,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff18353F),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 27),
                        child: Text('Hi, did u see my profile?',
                          style: GoogleFonts.openSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  trailing: Text('12:34 pm'),
                ),
                SizedBox(
                  height: height/37.95,
                ),
              ],
            ),
            SizedBox(
              height: height/37.95,
            ),
          ],
        ),
      ),

    );
  }
}
