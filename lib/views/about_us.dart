import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/Constants/colors.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back_ios,color: Colors.white)),
        title: Text("About Us",
          style: TextStyle(fontSize: 20,color: Colors.white),),
        centerTitle: true,
      ),
    );
  }
}
