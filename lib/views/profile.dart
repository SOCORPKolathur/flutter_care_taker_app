import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/views/LanguageScreen.dart';
import 'package:flutter_care_taker_app/views/about_us.dart';
import 'package:flutter_care_taker_app/views/edit_profile.dart';
import 'package:flutter_care_taker_app/views/phone_page.dart';
import 'package:flutter_care_taker_app/views/profile_setup_screen.dart';
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

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
      File? editedImage = await _editImage(File(pickedFile.path));

      if (editedImage != null) {
        setState(() {
          _image = editedImage;
        });
        await _uploadImageToFirebase();
      }
    }
  }

  Future<File?> _editImage(File image) async {
    // Implement your image editing logic here
    // For example, using the image_editor package to add filters, crop, etc.
    // Return the edited image file
    return image; // This is a placeholder. Replace with actual editing logic.
  }

  Future<void> _uploadImageToFirebase() async {
    if (_image == null || docid == null) return;

    try {
      // Upload the new image to Firebase Storage
      String newFileName =
          'profile_images/${DateTime.now().millisecondsSinceEpoch}.png';
      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child(newFileName);
      UploadTask uploadTask = firebaseStorageRef.putFile(_image!);
      TaskSnapshot taskSnapshot = await uploadTask;
      String newDownloadUrl = await taskSnapshot.ref.getDownloadURL();

      // Fetch the current document from Firestore
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('JobSeeking')
          .doc(docid)
          .get();

      if (doc.exists && doc['imageUrl'] != null) {
        String oldDownloadUrl = doc['imageUrl'];

        // Extract the file path from the old download URL
        RegExp regex = RegExp(r'\/o\/(.*?)\?alt');
        Match? match = regex.firstMatch(oldDownloadUrl);
        if (match != null) {
          String oldFilePath = match.group(1)!.replaceAll('%2F', '/');

          // Delete the old image from Firebase Storage
          Reference oldImageRef =
              FirebaseStorage.instance.ref().child(oldFilePath);
          await oldImageRef.delete();
        }
      }

      // Update Firestore with the new download URL
      await FirebaseFirestore.instance
          .collection('JobSeeking')
          .doc(docid)
          .update({
        'imageUrl': newDownloadUrl,
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
                  child: FirebaseAuth.instance.currentUser != null
                      ? _image == null
                          ? Icon(
                              Icons.add_a_photo,
                              size: 80,
                              color: Color(0xff2F649A),
                            )
                          : Image.file(
                              _image!,
                              fit: BoxFit.cover,
                              width: 140,
                              height: 140,
                            )
                      : Icon(
                          Icons.add_a_photo,
                          size: 80,
                          color: Color(0xff2F649A),
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
                  FirebaseAuth.instance.currentUser != null
                      ? name
                      : "User is not loged in,",
                  style: GoogleFonts.openSans(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height / 2.43, left: width / 36),
              child: Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Phonepage()));
                  },
                  child: Text(
                    FirebaseAuth.instance.currentUser != null
                        ? phonenumber
                        : "Kindly Login",
                    style: GoogleFonts.openSans(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff18353F).withOpacity(.6)),
                  ),
                ),
              ),
            ),
          ]),
          SizedBox(height: height / 37.7),
          Row(
            children: [
              SizedBox(
                width: width / 24,
              ),
              Container(
                height: height / 7.54,
                width: width / 2.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xffECF5FF),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: height / 50.26,
                        ),
                        Text(
                          '18',
                          style: GoogleFonts.openSans(
                              fontSize: 20,
                              color: Color(0xff2F649A),
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Connections',
                          style: GoogleFonts.openSans(
                              fontSize: 14,
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'made',
                          style: GoogleFonts.openSans(
                              fontSize: 14,
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width / 4, bottom: height / 15.08),
                      child: Container(
                          width: width / 9,
                          child: Image.asset('assets/Login.png')),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: width / 36,
              ),
              Container(
                height: height / 7.54,
                width: width / 2.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xffECF5FF),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: height / 50.26,
                        ),
                        Text(
                          '26',
                          style: GoogleFonts.openSans(
                              fontSize: 20,
                              color: Color(0xff2F649A),
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Connections',
                          style: GoogleFonts.openSans(
                              fontSize: 14,
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'left',
                          style: GoogleFonts.openSans(
                              fontSize: 14,
                              color: Color(0xff000000),
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width / 4, bottom: height / 15.08),
                      child: Container(
                          width: width / 9,
                          child: Image.asset('assets/Login.png')),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: height / 25.13,
          ),
          Container(
            height: height / 15.08,
            width: width / 1.09,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xff2F649A),
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: height / 75.4),
              child: Text(
                'Upgrade plan',
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                    fontSize: 16,
                    color: Color(0xff2F649A),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: height / 37.7),
          Container(
            height: height / 1.10,
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfile(
                              docid),
                          ),
                        );
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
                            color: Color(0xff18353F),
                          ),
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
                            builder: (context) => YourWishlight()));
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xffECF5FF),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.bookmark,
                                  color: Color(0xff2F649A))),
                        ),
                        title: Text(
                          'Your wishlight',
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
                            builder: (context) => YourOders()));
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xffECF5FF),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.shopping_bag,
                                  color: Color(0xff2F649A))),
                        ),
                        title: Text(
                          'Your orders',
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
                            builder: (context) => YourCart()));
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xffECF5FF),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.shopping_cart,
                                  color: Color(0xff2F649A))),
                        ),
                        title: Text(
                          'Your cart',
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
                        FirebaseAuth.instance.currentUser != null
                            ? AwesomeDialog(
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
                                // onDismissCallback: (type) {},
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
                              ).show()
                            : Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => Phonepage()));
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
                        title: FirebaseAuth.instance.currentUser != null
                            ? Text(
                                'Logout',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Color(0xff18353F)),
                              )
                            : Text(
                                'Login',
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
  String phonenumber = "  ";
  String image = "  ";
  String aadhar = "  ";
  getdocid() async {
    var user = await FirebaseFirestore.instance.collection("Person").get();
    for (int i = 0; i < user.docs.length; i++) {
      if (user.docs[i]["userid"] == FirebaseAuth.instance.currentUser!.uid) {
        setState(() {
          docid = user.docs[i].id;
          name = user.docs[i]["name"];
          phonenumber = (user.docs[i]["phone"]);
          image = (user.docs[i]["imageUrl"]);
          aadhar= user.docs[i]["aadharno"];
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
