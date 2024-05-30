import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/views/success_page.dart';
import 'package:flutter_care_taker_app/views/verification_code_screen.dart';
import 'package:flutter_care_taker_app/views/verification_successfull.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_care_taker_app/Constants/colors.dart';


class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({Key? key}) : super(key: key);

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
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
                        child:IconButton(onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>VerificationScreen()));
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
                  height: height/37.95,
                ),
                Text(
                  'Enter your mobile number',
                  style: GoogleFonts.openSans(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: height/75.9,
                ),
                Text(
                  'We will send you a confirmation coder',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                SizedBox(
                  height: height/37.95,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: height/37.95,
                        width: width/19.6,
                        child: Image.asset('assets/flag.png')),
                    IconButton(onPressed: (){}, icon: Icon(Icons.arrow_drop_down)),
                    Text('+91 9848465745',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700)),
                  ],
                ),
                SizedBox(
                  height: height/18.97,
                ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>VerificationSuccessfully()));
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(340, 50),
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
