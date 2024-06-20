import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/views/LanguageScreen.dart';
import 'package:flutter_care_taker_app/views/about_us.dart';
import 'package:flutter_care_taker_app/views/edit_profile.dart';
import 'package:flutter_care_taker_app/views/role_page.dart';
import 'package:flutter_care_taker_app/views/welcome_homepage.dart';
import 'package:flutter_care_taker_app/views/your_cart.dart';
import 'package:flutter_care_taker_app/views/your_oder.dart';
import 'package:flutter_care_taker_app/views/your_wishlight.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

import 'contact_suport.dart';
import 'navbar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdocid();
    updateuser();
  }

  File? _image;
  final picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      await _uploadImageToFirebase();
    }
  }

  Future<void> _uploadImageToFirebase() async {
    if (_image == null) return;

    try {
      // Upload to Firebase Storage
      String fileName = 'profile_images/${DateTime.now()}.png';
      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child(fileName);
      UploadTask uploadTask = firebaseStorageRef.putFile(_image!);
      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      // Update Firestore with the download URL
      await FirebaseFirestore.instance
          .collection('JobSeeking')
          .doc(docid)
          .update({
        'imageUrl': downloadUrl,
      });
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(children: [
            Container(
              width: width / 0.98,
              child: Image.asset('assets/Ellipse.png'),
            ),
            Padding(
              padding: EdgeInsets.only(top: height / 15.08, left: width / 1.24),
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => NavBar()));
                },
                child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.menu,
                      color: Color(0xff2F649A),
                      size: 30,
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height / 16.75, left: width / 24),
              child: Icon(
                Icons.arrow_circle_left,
                color: Colors.white,
                size: 60,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height / 13.70, left: width / 2.48),
              child: Text(
                'Profile ',
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 26,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height / 5.8, left: width / 3.13),
              child: CircleAvatar(
                radius: 70,
                backgroundColor: Color(0xffFFFFFF),
                child: ClipOval(
                  child: _image == null
                      ? Image.network(
                          image,
                          fit: BoxFit.cover,
                          width: 140, // diameter of CircleAvatar (radius * 2)
                          height: 140,
                        )
                      : Image.file(
                          _image!,
                          fit: BoxFit.cover,
                          width: 140, // diameter of CircleAvatar (radius * 2)
                          height: 140,
                        ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height / 9.42, left: width / 2.11),
              child: InkWell(
                onTap: () {
                  _pickImage();
                },
                child: Container(
                  height: height / 6.28,
                  width: width / 3,
                  child: Image.asset('assets/edit profile icon.png'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 220,
              ),
              child: Container(
                height: height / 6.28,
                width: width / 3,
                child: Image.asset('assets/image 21.png'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height / 3.77, left: width / 1.33),
              child: Container(
                height: height / 5.38,
                width: width / 2.4,
                child: Image.asset('assets/image 22.png'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height / 2.74, left: width / 36),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  name,
                  style: GoogleFonts.openSans(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height / 2.43, left: width / 3),
              child: Text(
                phone,
                style: GoogleFonts.openSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff18353F).withOpacity(.6)),
              ),
            ),
          ]),
          SizedBox(height: height / 37.7),
          Container(
            height: 420,
            width: width / 1.05,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xff000000).withOpacity(.3),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: height / 75.4),
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EditProfile(docid)));
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xffECF5FF),
                          child: Icon(
                            Icons.person,
                            color: Color(0xff2F649A),
                          ),
                        ),
                        title: Text(
                          'Edit profile',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xff18353F)),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xff2F649A),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height / 25.13,
                      width: width / 1.2,
                      child: Divider(
                        color: Color(0xff000000).withOpacity(.3),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LanguageScreen()));
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xffECF5FF),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.translate,
                                  color: Color(0xff2F649A))),
                        ),
                        title: Text(
                          'App language',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xff18353F)),
                        ),
                        trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xff2F649A),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: height / 25.13,
                      width: width / 1.2,
                      child: Divider(
                        color: Color(0xff000000).withOpacity(.3),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ContactSupport()));
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xffECF5FF),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.face, color: Color(0xff2F649A))),
                        ),
                        title: Text(
                          'Contact support',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xff18353F)),
                        ),
                        trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xff2F649A),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: height / 25.13,
                      width: width / 1.2,
                      child: Divider(
                        color: Color(0xff000000).withOpacity(.3),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => AboutUs()));
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xffECF5FF),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.info, color: Color(0xff2F649A))),
                        ),
                        title: Text(
                          'About us',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xff18353F)),
                        ),
                        trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xff2F649A),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: height / 25.13,
                      width: width / 1.2,
                      child: Divider(
                        color: Color(0xff000000).withOpacity(.3),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.info,
                          borderSide: const BorderSide(
                            color: Colors.green,
                            width: 2,
                          ),
                          width: 600,
                          buttonsBorderRadius: const BorderRadius.all(
                            Radius.circular(2),
                          ),
                          dismissOnTouchOutside: true,
                          dismissOnBackKeyPress: false,
                          headerAnimationLoop: false,
                          animType: AnimType.bottomSlide,
                          title: 'Logout',
                          desc: 'Are you sure do you want Logout',
                          showCloseIcon: true,
                          btnCancelOnPress: () {
                            Navigator.of(context).pop();
                          },
                          btnOkOnPress: () {
                            signOut();
                          },
                        ).show();
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xffECF5FF),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.exit_to_app,
                                  color: Color(0xff2F649A))),
                        ),
                        title: Text(
                          'Log out',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xff18353F)),
                        ),
                        trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xff2F649A),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: height / 75.4,
          ),
        ]),
      ),
    );
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => RolePageScreen()),
      (Route<dynamic> route) => false,
    );
  }

  String docid = "  ";
  String name = "  ";
  String phone = "  ";
  String image = "  ";
  getdocid() async {
    var user = await FirebaseFirestore.instance.collection("JobSeeking").get();
    for (int i = 0; i < user.docs.length; i++) {
      if (user.docs[i]["userid"] == FirebaseAuth.instance.currentUser!.uid) {
        setState(() {
          docid = user.docs[i].id;
          name = user.docs[i]["name"];
          phone = (user.docs[i]["phone"]);
          image = (user.docs[i]["imageUrl"]);
        });
      }
    }
  }

  Future<String> _uploadImageToFirebaseStorage(File imageFile) async {
    final firebase_storage.Reference ref = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('images/${DateTime.now().toString()}');
    final firebase_storage.UploadTask uploadTask = ref.putFile(imageFile);
    final firebase_storage.TaskSnapshot downloadTask = await uploadTask;
    final String imageUrl = await downloadTask.ref.getDownloadURL();
    print('Image uploaded to Firebase Storage: $imageUrl');
    return imageUrl; // Return the download URL of the uploaded image
  }

  updateuser() async {
    String imageUrl = await _uploadImageToFirebaseStorage(_image!);
    FirebaseFirestore.instance.collection("JobSeeking").doc(docid).update({
      "imageUrl": imageUrl,
    });
    Successdialog();
  }

  Successdialog() {
    double width = MediaQuery.of(context).size.width;
    return AwesomeDialog(
      width: width / 3.035555555555556,
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      title: 'Commity Member Updated Successfully',
      btnOkOnPress: () {
        Navigator.of(context).pop();
      },
    )..show();
  }
}
