import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/views/success_page.dart';
import 'package:flutter_care_taker_app/views/verification_code_screen.dart';
import 'package:flutter_care_taker_app/views/verification_successfull.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_care_taker_app/Constants/colors.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Phonepage extends StatefulWidget {
  const Phonepage({Key? key}) : super(key: key);

  @override
  State<Phonepage> createState() => _PhonepageState();
}

class _PhonepageState extends State<Phonepage> {
  String phonenumber = "";


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: height / 2.37,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(
                            MediaQuery.of(context).size.width, 180.0)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: width / 1.28,
                      left: width / 36,
                      top: height / 50.26),
                  child: Container(
                    width: width / 7.2,
                    height: height / 15.08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: IconButton(
                        onPressed: () {
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => VerificationScreen()));
                        },
                        icon: Icon(Icons.arrow_back)),
                  ),
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print(width);
                        print(height);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: height/25.13),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('assets/Frame.png'),
                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top: height/75.4, bottom: height/75.4),
                      child: Text('Happy CareTakers',
                          style: GoogleFonts.openSans(
                              color: Color(0xffFFFFFF),
                              fontSize: 20,
                              fontWeight: FontWeight.w700)),
                    ),
                    Container(
                        width: width / 0.78,
                        height: height / 4.21,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Image.asset('assets/verification.png'),
                          ],
                        )),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: height / 37.95,
            ),
            Text(
              'Enter your mobile number',
              style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: height / 75.9,
            ),
            Text(
              'We will send you a confirmation coder',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
              ),
            ),
            SizedBox(
              height: height / 37.95,
            ),
            Container(
                height: height/8.37,
                width: width/1.2,
                child: Column(
                  children: [
                    IntlPhoneField(

                      decoration: InputDecoration(
                        //decoration for Input Field
                        labelText: 'Phone',
                      ),
                      //default contry code, NP for Nepal
                      onChanged: (phone) {
                        print(phone.completeNumber); //get complete number
                        setState(() {
                          phonenumber = phone.completeNumber;
                        }); // only phone number
                      },
                      initialCountryCode:
                      'IN',
                    ),
                  ],
                )),
            SizedBox(
              height: height / 18.97,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => VerificationScreen(phonenumber
                    )));
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(width/1.05, height/15.08),
                backgroundColor: primaryColor,
              ),
              child: Text('Verify OTP',
                  style: GoogleFonts.openSans(
                      color: Color(0xffFFFFFF),
                      fontSize: 15,
                      fontWeight: FontWeight.w700)),
            ),
          ],
        ),
      )),
    );
  }
}
