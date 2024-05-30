import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/Constants/colors.dart';
import 'package:flutter_care_taker_app/views/chat_screen.dart';
import 'package:flutter_care_taker_app/views/searchscreen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'buynow.dart';
import 'navbar.dart';

class ChattingPage extends StatefulWidget {
  String name;
  ChattingPage(this.name);

  @override
  State<ChattingPage> createState() => _ChattingPageState();
}

class _ChattingPageState extends State<ChattingPage> {
  List<String> message = ["HI", "I have interested in this job", "HI Ajay"];

  List<bool> sender = [false, false, true];

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
                padding: const EdgeInsets.only(top: 50, left: 10),
                child: Container(
                  width: width / 7.84,
                  height: height / 15.18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: Icon(Icons.arrow_back),
                ),
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
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => NavBar()));
                      },
                      icon: Icon(Icons.menu)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 75),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/chat_image_one.png'),
                  ),
                  title: Text(
                    widget.name,
                    style: GoogleFonts.openSans(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text(
                    'Care giver',
                    style: GoogleFonts.openSans(
                        fontSize: 13,
                        color: Colors.white.withOpacity(.7),
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height/37.95,
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: message.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    BubbleSpecialThree(
                      text: message[index],
                      textStyle: GoogleFonts.openSans(
                          color: Colors.white, fontSize: 16),
                      color: Color(0xFF2F649A),
                      tail: sender[index],
                      isSender: false,
                    ),
                    SizedBox(
                      height:height/ 151.8,
                    ),
                    BubbleSpecialThree(
                      text: message[index],
                      textStyle: GoogleFonts.openSans(
                          color: Colors.white, fontSize: 16),
                      color: Color(0xFF2F649A),
                      tail: sender[index],
                      isSender: true,
                    ),
                    SizedBox(
                      height:height/ 151.8,
                    ),
                  ],
                );
              }),
        ],
      ),
      bottomNavigationBar: Container(
        height: 90,
        child: MessageBar(

          onSend: (_) => print(_),

        ),
      ),
    );
  }
}
