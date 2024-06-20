import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/Constants/colors.dart';

class YourWishlight extends StatefulWidget {
  const YourWishlight({super.key});

  @override
  State<YourWishlight> createState() => _YourWishlightState();
}

class _YourWishlightState extends State<YourWishlight> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.white)),
        title: Text(
          "Your Wishlight",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
      ),
    );
  }
}
