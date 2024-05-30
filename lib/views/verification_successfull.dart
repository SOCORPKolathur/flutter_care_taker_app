import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/views/success_page.dart';

import '../Widgets/custombutton.dart';
import 'health_care_screen.dart';

class VerificationSuccessfully extends StatefulWidget {
  const VerificationSuccessfully({Key? key}) : super(key: key);

  @override
  State<VerificationSuccessfully> createState() =>
      _VerificationSuccessfullyState();
}

class _VerificationSuccessfullyState extends State<VerificationSuccessfully> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                child: Image.asset('assets/Verified.png'),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Verification Successful',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff18353F)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '"Thank you for verifying your identity.\n Your account is now secure.."',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 70,
              ),
              ElevationButton("Continue", SuccessfullPage()),
            ],
          ),
        ),
      ),
    );
  }
}
