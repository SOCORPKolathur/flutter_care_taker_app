import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_care_taker_app/views/profile_setup_screen.dart';
import 'package:flutter_care_taker_app/views/verification_code_screen.dart';
import 'package:flutter_care_taker_app/views/verify.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_care_taker_app/Constants/colors.dart';

class WelcomeBackScreen extends StatefulWidget {
  const WelcomeBackScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeBackScreen> createState() => _WelcomeBackScreenState();
}

class _WelcomeBackScreenState extends State<WelcomeBackScreen> {
  String phonenumber = " ";
  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController aadharno = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formGlobalKey,
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      height: height / 3.99,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.elliptical(
                                MediaQuery.of(context).size.width,
                                width / 2.76)),
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
                            padding: EdgeInsets.only(top: height / 37.7),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('assets/Frame.png'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: height / 75.4),
                          child: Text('Happy CareTakers',
                              style: GoogleFonts.openSans(
                                  color: Color(0xffFFFFFF),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700)),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 37.7,
                ),
                Text(
                  'Welcome!',
                  style: GoogleFonts.openSans(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'Sign up to continue our app',
                  style: GoogleFonts.openSans(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: height / 37.7,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      suffixIcon: Icon(Icons.person),
                      labelText: 'Enter your name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Your Name";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller: aadharno,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(12),
                    ],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      suffixIcon: Icon(Icons.person),
                      labelText: 'Enter your Aadhar Number',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Aadhar Number is required";
                      } else if (value.length != 12) {
                        return "Aadhar Number must be exactly 12 digits";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      suffixIcon: Icon(Icons.phone),
                      labelText: 'Enter your phone number',
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter
                          .digitsOnly, // Allows only digits
                      LengthLimitingTextInputFormatter(
                          10), // Limits input to 10 digits
                    ],
                    onChanged: (phone) {
                      print(phone);
                      setState(() {
                        phonenumber = phone;
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Re-Enter phone number";
                      } else if (value.length < 10) {
                        return "phone numbe must be 10 numbers ";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: width / 24),
                  child: Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        activeColor: primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        value: true,
                        onChanged: (bool? value) {},
                      ),
                      // ),
                      Text(
                        'Remember me?',
                        style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (formGlobalKey.currentState!.validate()) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => VerifyOtp(
                                name.text,
                                aadharno.text,
                                phonenumber,
                              )));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(width / 1.05, height / 15.08),
                    backgroundColor: primaryColor,
                  ),
                  child: Text('Sign up',
                      style: GoogleFonts.openSans(
                          color: Color(0xffFFFFFF),
                          fontSize: 15,
                          fontWeight: FontWeight.w700)),
                ),
                SizedBox(
                  height: height / 37.7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Expanded(
                      child: Divider(
                        indent: 20.0,
                        endIndent: 10.0,
                        thickness: 1,
                      ),
                    ),
                    Text(
                      "OR",
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                    Expanded(
                      child: Divider(
                        indent: 10.0,
                        endIndent: 20.0,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                Text('Sign up with',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w700)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: height / 7.54,
                        width: width / 3.6,
                        child: Image.asset('assets/facebook.png')),
                    Container(
                        height: height / 7.54,
                        width: width / 3.6,
                        child: Image.asset('assets/google.png')),
                    Container(
                        height: height / 7.54,
                        width: width / 3.6,
                        child: Image.asset('assets/apple.png')),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w700)),
                    Padding(
                      padding: EdgeInsets.only(left: width / 36),
                      child: Text('Sign in',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                              color: primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w700)),
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 37.7,
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
