import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/views/health_care_screen.dart';
import 'package:flutter_care_taker_app/views/veryfyotp.dart';

import 'package:flutterotpfield/flutterotpfield.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_care_taker_app/Constants/colors.dart';

import '../Widgets/custombutton.dart';



class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
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
                  padding: const EdgeInsets.only(right: 320.0,left: 10,top: 15),
                  child: Container(
                    width: width/7.84,
                    height: height/15.18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: IconButton(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HealthCareScreen()));
                    }, icon: Icon(Icons.arrow_back)),


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
                        padding: const EdgeInsets.only(top: 30),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('assets/Frame.png'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,bottom: 10),
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
              height:height/37.95,
            ),
            Text(
              'Verification code',
              style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: height/75.9,
            ),
            Text(
              'Please enter the verification code sent to\nyour mobile number',
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('+91 9848465745',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700)),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit,
                      color: primaryColor,
                    )),
              ],
            ),
            SizedBox(height: height/37.95),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlutterOtpField(
                  inputFieldLength: 4,
                  spaceBetweenFields: 10,
                  inputDecoration: InputDecoration(
                      constraints: const BoxConstraints(maxHeight: 46),
                      fillColor: Colors.transparent,
                      filled: true,
                      hintText: " ",
                      counterText: "",
                      hintStyle: const TextStyle(
                          color: Color(0xff656565),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xff969696),
                              width: 1.0),
                          borderRadius:
                          BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xff969696),
                              width: 1.0),
                          borderRadius:
                          BorderRadius.circular(30))),
                  onValueChange: (String value) {
                    print("otp changed $value");
                  },
                  onCompleted: (String value) {
                    print("otp  $value");
                  },),


              ],
            ),
            SizedBox(
              height: height/18.97,
            ),
            ElevationButton("Submit OTP",VerifyOtpScreen()),
          ],
        ),
      )),
    );
  }
}
