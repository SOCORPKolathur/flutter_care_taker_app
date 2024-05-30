import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_care_taker_app/Constants/colors.dart';


class WelcomeBackScreen extends StatefulWidget {
  const WelcomeBackScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeBackScreen> createState() => _WelcomeBackScreenState();
}

class _WelcomeBackScreenState extends State<WelcomeBackScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
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
                              MediaQuery.of(context).size.width, 130.0)),
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
                          padding: const EdgeInsets.only(top: 20),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/Frame.png'),
                          ),
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
                ],
              ),
              SizedBox(height: 20,),
              Text(
                'Welcome back!',
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
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    suffixIcon: Icon(Icons.person),
                    labelText: 'Enter your first name',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    suffixIcon: Icon(Icons.person),
                    labelText: 'Enter your last name',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    suffixIcon: Icon(Icons.phone),
                    labelText: 'Enter your phone number',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      activeColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)), value: true, onChanged: (bool? value) {  },
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
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(340, 50),
                  backgroundColor: primaryColor,
                ),
                child: Text('Sign up',
                    style: GoogleFonts.openSans(
                        color: Color(0xffFFFFFF),
                        fontSize: 15,
                        fontWeight: FontWeight.w700)),
              ),
              SizedBox(
                height: 20,
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
              Text('Sign up with',textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w700)),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Container(
                   height: 100,
                     width: 100,
                     child: Image.asset('assets/facebook.png')),
          
                  Container(
                      height: 100,
                      width: 100,
                      child: Image.asset('assets/google.png')),
                  Container(
                      height: 100,
                      width: 100,
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
                    padding: const EdgeInsets.only(left: 10),
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
            height: 20,
          ),
            ],
          ),
        ),
      )),
    );
  }
}
