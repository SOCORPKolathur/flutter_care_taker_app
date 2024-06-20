import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/Constants/colors.dart';

class ContactSupport extends StatefulWidget {
  const ContactSupport({super.key});

  @override
  State<ContactSupport> createState() => _ContactSupportState();
}

class _ContactSupportState extends State<ContactSupport> {
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
        title: Text("Contact Support",
          style: TextStyle(fontSize: 20,color: Colors.white),),
        centerTitle: true,
      ),
    );
  }
}
