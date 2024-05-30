import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/views/prefferance_screen.dart';
import 'package:flutter_care_taker_app/views/profile_details.dart';
import 'package:flutter_care_taker_app/views/searchscreen.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD5EDF2),
    drawer: Drawer(child: Column(
      children: [
        UserAccountsDrawerHeader(
          accountName: Text(
            'CareTaker',
            style: GoogleFonts.openSans(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          accountEmail: Text('Version 0.1'),
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage('assets/Frame.png'),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage('assets/background_images.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        ListTile(
          title: Text('Prefference Screen'),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PrefferenceScreen()));
          },
        ),
        ListTile(
          title: Text('Search Screen'),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SearchScreen()));
          },
        ),
        ListTile(
          title: Text('Profile Screen'),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ProfileDetails()));
          },
        )
      ],
    ),),
    );
  }
}
