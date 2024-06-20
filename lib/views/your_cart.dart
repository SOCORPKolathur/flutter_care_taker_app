import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:empty_widget/empty_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/Constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class YourCart extends StatefulWidget {
  const YourCart({super.key});

  @override
  State<YourCart> createState() => _YourCartState();
}

class _YourCartState extends State<YourCart> {
  String UID = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdocid();
  }

  void _updateItemInFirestore(int newCount, int price, String docId) {
    try {
      int newprice = newCount * price;
      FirebaseFirestore.instance
          .collection('Person')
          .doc(UID) // Replace with your user ID
          .collection("MyCart")
          .doc(docId)
          .update({
        'count': newCount,
        'price': newprice,
      }).then((value) {
        print("Item updated successfully!");
      }).catchError((error) {
        print("Failed to update item: $error");
        // Handle error as needed
      });
    } catch (e) {
      print("Error updating item: $e");
      // Handle error as needed
    }
  }

  // Function to delete a document from Firestore
  Future<void> _deleteItem(String docId) async {
    try {
      await FirebaseFirestore.instance
          .collection("Person")
          .doc(UID) // Replace with your document ID
          .collection("MyCart") // Replace with your sub-collection name
          .doc(docId)
          .delete();
    } catch (e) {
      print("Error deleting item: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: Text(
          "Your Cart",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("Person")
                  .doc(UID)
                  .collection("MyCart")
                  .snapshots(),
              builder: (context, snapshots) {
                if (snapshots.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshots.hasData || snapshots.data!.docs.isEmpty) {
                  return EmptyWidget(
                    image: null,
                    packageImage: PackageImage.Image_2,
                    title: ' No items in \nyour cart',
                    titleTextStyle: TextStyle(
                      fontSize: 18,
                      color: primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                }
                return Container(
                  width: width / 0.97,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: height / 1.57,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshots.data!.docs.length,
                            itemBuilder: (context, index) {
                              var doc = snapshots.data!.docs[index];
                              int newCount = doc["count"];
                              int price = doc["productprice"];
                              int newprice = newCount * price;
                              return Padding(
                                padding: EdgeInsets.only(top: height / 75.4),
                                child: Container(
                                  height: height / 5.02,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(),
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ListTile(
                                          leading: Container(
                                            height: height / 12.65,
                                            width: width / 6.53,
                                            decoration: BoxDecoration(
                                              color: Color(0xffECF5FF),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Image.network(doc["image"]),
                                          ),
                                          title: Text(
                                            doc["name"],
                                            style: GoogleFonts.openSans(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w800,
                                              color: Color(0xff18353F),
                                            ),
                                          ),
                                          subtitle: Text(
                                            "₹${doc["productprice"].toString()}",
                                            style: GoogleFonts.openSans(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w800,
                                              color: Color(0xff2F649A),
                                            ),
                                          ),
                                          trailing: Container(
                                            height: height / 25.3,
                                            width: width / 13.06,
                                            decoration: BoxDecoration(
                                              color: Color(0xffECF5FF),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: IconButton(
                                              onPressed: () {
                                                _deleteItem(doc.id);
                                              },
                                              icon: Icon(
                                                Icons.close,
                                                size: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: width / 18,
                                              top: height / 37.7),
                                          child: Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor:
                                                    Color(0xff2F649A),
                                                radius: 15,
                                                child: IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      if (newCount > 1) {
                                                        newCount--;
                                                        // Update count in Firestore
                                                        _updateItemInFirestore(
                                                            newCount,
                                                            price,
                                                            doc.id);
                                                      }
                                                    });
                                                  },
                                                  icon: Icon(
                                                    Icons.remove,
                                                    size: 15,
                                                    color: Color(0xffFFFFFF),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: width / 36),
                                                child: Text(
                                                  newCount
                                                      .toString(), // Display newCount here
                                                  style: GoogleFonts.openSans(
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 20,
                                                    color: Color(0xff2F649A),
                                                  ),
                                                ),
                                              ),
                                              CircleAvatar(
                                                backgroundColor:
                                                    Color(0xff2F649A),
                                                radius: 15,
                                                child: IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      newCount++;
                                                      // Update count in Firestore
                                                    });
                                                    _updateItemInFirestore(
                                                        newCount,
                                                        price,
                                                        doc.id);
                                                  },
                                                  icon: Icon(
                                                    Icons.add,
                                                    size: 15,
                                                    color: Color(0xffFFFFFF),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: width / 2.4,
                                              ),
                                              Text(
                                                // "₹${newprice}",
                                                "₹${snapshots.data!.docs[index]['price'].toString()}",
                                                style: GoogleFonts.openSans(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 20,
                                                  color: Color(0xff2F649A),
                                                ),
                                                textAlign: TextAlign.right,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: width / 24),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Product Details',
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Color(0xff18353F),
                            ),
                          ),
                        ),
                      ),
                      StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('Person')
                            .doc(UID)
                            .collection('MyCart')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            int totalPrice = 0;
                            print(snapshot.data!.docs.length);

                            snapshot.data!.docs.forEach((doc) {
                              totalPrice += int.parse(doc['price'].toString());
                            });
                            print(totalPrice);
                            int total = totalPrice + 50;
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: width / 24,
                                  right: width / 24,
                                  top: height / 75.4),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Price (${snapshot.data!.docs.length} Items)',
                                        style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          color:
                                              Color(0xff18353F).withOpacity(.5),
                                        ),
                                      ),
                                      SizedBox(width: width / 16.86),
                                      Text(
                                        "₹${totalPrice.toString()}",
                                        style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 14,
                                          color:
                                              Color(0xff2F649A).withOpacity(.8),
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Delivery charges',
                                        style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          color:
                                              Color(0xff18353F).withOpacity(.5),
                                        ),
                                      ),
                                      Text(
                                        '₹ 50',
                                        style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 14,
                                          color:
                                              Color(0xff2F649A).withOpacity(.8),
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: width / 1.05,
                                    child: Divider(
                                      color: Color(0xff2F649A).withOpacity(.4),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Total price',
                                        style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 16,
                                          color: Color(0xff18353F),
                                        ),
                                      ),
                                      SizedBox(width: width / 5.22),
                                      Text(
                                        "₹ ${total.toString()}",
                                        style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 14,
                                          color:
                                              Color(0xff2F649A).withOpacity(.8),
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  getdocid() async {
    var user = await FirebaseFirestore.instance.collection("Person").get();
    for (int i = 0; i < user.docs.length; i++) {
      if (user.docs[i]["userid"] == FirebaseAuth.instance.currentUser!.uid) {
        setState(() {
          UID = user.docs[i].id;
        });
      }
    }
  }
}
