import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(children: [
            Container(
              width: width / 0.98,
              child: Image.asset('assets/Ellipse.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 300),
              child: Container(
                width: width / 7.84,
                height: height / 15.18,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: Icon(Icons.menu),
              ),
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
              padding: const EdgeInsets.only(top: 60, left: 135),
              child: Text(
                'Profile ',
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 26,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 120, left: 110),
              child: Container(
                height: 140,
                width: 140,
                child: Image.asset('assets/Group 68.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 90, left: 180),
              child: Container(
                height: 120,
                width: 120,
                child: Image.asset('assets/edit profile icon.png'),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 160,),
              child: Container(
                height: 120,
                width: 120,
                child: Image.asset('assets/image 21.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150, left: 250),
              child: Container(
                height: 140,
                width: 150,
                child: Image.asset('assets/image 22.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 265, left: 110),
              child: Text(
                'Jonathan Rick',
                style: GoogleFonts.openSans(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 300, left: 120),
              child: Text(
                '+91 9876487368',
                style: GoogleFonts.openSans(
                  fontSize: 16,
                ),
              ),
            ),
          ]),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                height: 130,
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffECF5FF),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 90, top: 5),
                      child: Container(
                          height: 40,
                          width: 40,
                          child: Image(image: AssetImage('assets/Login.png'))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text('18'),
                    ),
                    Text('Connections'),
                    Text('made'),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                height: 130,
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffECF5FF),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 90, top: 5),
                      child: Container(
                          height: 40,
                          width: 40,
                          child: Image(image: AssetImage('assets/Login.png'))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text('18'),
                    ),
                    Text('Connections'),
                    Text('left'),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 50,
            width: 330,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xff2F649A),
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'Upgrade plan',
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                    fontSize: 20, color: Color(0xff2F649A)),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 650,
            width: 330,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xff2F649A),
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  ListTile(

                    leading: CircleAvatar(
                      radius: 30,
                      child:
                          IconButton(onPressed: () {}, icon: Icon(Icons.person)),
                    ),
                    title:Text(
                      'Edit profile',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w600,
                          fontSize: 16, color: Color(0xff18353F)),
                    ),
                    trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios)),
                  ),
                  SizedBox(
                    height: 20,
                    width: 300,
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  ListTile(

                    leading: CircleAvatar(
                      radius: 30,
                      child:
                      IconButton(onPressed: () {}, icon: Icon(Icons.translate)),
                    ),
                    title:Text(
                      'App language',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 16, color: Color(0xff18353F)),
                    ),
                    trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios)),
                  ),
                  SizedBox(
                    height: 20,
                    width: 300,
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  ListTile(

                    leading: CircleAvatar(
                      radius: 30,
                      child:
                      IconButton(onPressed: () {}, icon: Icon(Icons.bookmark)),
                    ),
                    title:Text(
                      'Your wishlight',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 16, color: Color(0xff18353F)),
                    ),
                    trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios)),
                  ),
                  SizedBox(
                    height: 20,
                    width: 300,
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  ListTile(

                    leading: CircleAvatar(
                      radius: 30,
                      child:
                      IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag)),
                    ),
                    title:Text(
                      'Your orders',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 16, color: Color(0xff18353F)),
                    ),
                    trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios)),
                  ),
                  SizedBox(
                    height: 20,
                    width: 300,
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  ListTile(

                    leading: CircleAvatar(
                      radius: 30,
                      child:
                      IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
                    ),
                    title:Text(
                      'Your cart',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 16, color: Color(0xff18353F)),
                    ),
                    trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios)),
                  ),
                  SizedBox(
                    height: 20,
                    width: 300,
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  ListTile(

                    leading: CircleAvatar(
                      radius: 30,
                      child:
                      IconButton(onPressed: () {}, icon: Icon(Icons.face)),
                    ),
                    title:Text(
                      'Contact support',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                          fontSize: 20, color: Color(0xff18353F)),
                    ),
                    trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios)),
                  ),
                  SizedBox(
                    height: 20,
                    width: 300,
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  ListTile(

                    leading: CircleAvatar(
                      radius: 30,
                      child:
                      IconButton(onPressed: () {}, icon: Icon(Icons.info)),
                    ),
                    title:Text(
                      'About us',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                          fontSize: 20, color: Color(0xff18353F)),
                    ),
                    trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios)),
                  ),
                  SizedBox(
                    height: 20,
                    width: 300,
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  ListTile(

                    leading: CircleAvatar(
                      radius: 30,
                      child:
                      IconButton(onPressed: () {}, icon: Icon(Icons.exit_to_app)),
                    ),
                    title:Text(
                      'Log out',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                          fontSize: 20, color: Color(0xff18353F)),
                    ),
                    trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios)),
                  ),
                ],
              ),

            ),
          ),
          SizedBox(
            height: 20,
          ),


        ]),
      ),
    );
  }
}
