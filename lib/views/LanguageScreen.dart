import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/Constants/colors.dart';
import 'package:flutter_care_taker_app/views/role_page.dart';
import 'package:flutter_care_taker_app/views/welcomeback_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: height / 3.99,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(
                              MediaQuery.of(context).size.width, 160.0)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            print(width);
                            print(height);
                          },
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/Frame.png'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text('Happy CareTakers',
                              style: GoogleFonts.openSans(
                                  color: Color(0xffFFFFFF),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  'Choose your language',
                  style: GoogleFonts.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'Pick the language you understand best',
                  style: GoogleFonts.openSans(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 30),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RolePageScreen()));
                      },
                      child: Container(
                        width: width/2.61,
                        height: height / 5.06,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff18353F),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage('assets/tamil.png'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text('தமிழ்',
                                  style: GoogleFonts.notoSansTamil(
                                      color: primaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700)),
                            ),
                            Text('Tamil',
                                style: GoogleFonts.openSans(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width/19.6,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RolePageScreen()));
                      },
                      child: Container(
                        width: width/2.61,
                        height: height/5.06,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff18353F),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage('assets/english.png'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text('English',
                                  style: GoogleFonts.openSans(
                                      color: primaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700)),
                            ),
                            Text('USK/UK',
                                style: GoogleFonts.openSans(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 30),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RolePageScreen()));
                      },
                      child: Container(
                        width: width/2.61,
                        height: height/5.06,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff18353F),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage('assets/hindi.png'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Text('Hindi',
                                  style: GoogleFonts.openSans(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width/19.6,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RolePageScreen()));
                      },
                      child: Container(
                        width: width/2.61,
                        height: height/5.06,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff18353F),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: CircleAvatar(
                                backgroundColor: Color(0xffFFFFFF),
                                radius: 30,
                                backgroundImage:
                                    AssetImage('assets/malayalam.png'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text('മലയാളം',
                                  style: GoogleFonts.notoSansMalayalam(
                                      color: primaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700)),
                            ),
                            Text('Malayalam',
                                style: GoogleFonts.openSans(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 30),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RolePageScreen()));
                      },
                      child: Container(
                        width: width/2.61,
                        height: height/5.06,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff18353F),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(30),
                                  child: Image(
                                    image: AssetImage('assets/kannada.png'),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text('ಕನ್ನಡ',
                                  style: GoogleFonts.notoSansKannada(
                                      color: primaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700)),
                            ),
                            Text('Kannada',
                                style: GoogleFonts.openSans(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width/19.6,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RolePageScreen()));
                      },
                      child: Container(
                        width: width/2.61,
                        height: height/5.06,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff18353F),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage('assets/telungu.png'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text('తెలుంగు',
                                  style: GoogleFonts.notoSansTelugu(
                                      color: primaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700)),
                            ),
                            Text('Telungu',
                                style: GoogleFonts.openSans(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 30),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RolePageScreen()));
                      },
                      child: Container(
                        width: width/2.61,
                        height: height/5.06,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff18353F),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage('assets/gujarath.png'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text('ગુજરાત்',
                                  style: GoogleFonts.notoSansGujarati(
                                      color: primaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700)),
                            ),
                            Text('Gujarati',
                                style: GoogleFonts.openSans(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width/19.6
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RolePageScreen()));
                      },
                      child: Container(
                        width: width/2.61,
                        height: height/5.06,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff18353F),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(30),
                                  child: Image(
                                    image: AssetImage('assets/urdu.png'),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text('اردو',
                                  style: GoogleFonts.notoSansUgaritic(
                                      color: primaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700)),
                            ),
                            Text('Urdu',
                                style: GoogleFonts.openSans(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height/25.3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
