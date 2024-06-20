import 'package:flutter/material.dart';

import '../Constants/colors.dart';

class ElevationButton extends StatefulWidget {
  String name;
  var page;
  ElevationButton(this.name,this.page);

  @override
  State<ElevationButton> createState() => _ElevationButtonState();
}

class _ElevationButtonState extends State<ElevationButton> {
  @override
  Widget build(BuildContext context) {
    return   ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>widget.page));
      },
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(300, 40),
        backgroundColor: primaryColor,
      ),
      child:  Text(
        widget.name,
        style: TextStyle(
          fontSize: 15,
          color: Color(0xffFFFFFF),
        ),
      ),);
  }
}
