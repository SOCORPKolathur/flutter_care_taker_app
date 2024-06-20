import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_care_taker_app/Constants/colors.dart';
import 'package:flutter_care_taker_app/views/productdetail_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List NameProduct = [];
  List Product = [];
  List Price = [];
  List Ima = [];

  int _selectedIndex = 0;
  String option = "All";
  String searchQuery = "";

  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: _selectedIndex);
    super.initState();
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  List<String> countries = [
    'United States',
    'Canada',
    'India',
    'Australia',
    'United Kingdom',
    'Germany',
    // Add more countries...
  ];
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _key,
      body: PageView(
        controller: _pageController,
        onPageChanged: (val) {
          setState(() {
            _selectedIndex = val;
          });
        },
        children: [
          SingleChildScrollView(
            child: Column(children: [
              Stack(
                children: [
                  Container(
                    width: width / 0.98,
                    child: Image.asset('assets/Ellipse.png'),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: height / 16.39, left: width / 1.2),
                    child: Container(
                      width: width / 7.12,
                      height: height / 15.18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.white,
                      ),
                      child: IconButton(
                          onPressed: () {
                            //  _key.currentState!.openEndDrawer();
                          },
                          icon: Icon(
                            Icons.shopping_cart,
                            color: Color(0xff2F649A),
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50, left: width / 24),
                    child: Text(
                      'Buy your necessary\n things here,',
                      style: GoogleFonts.openSans(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height / 5.8, left: 25),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          // Your onTap logic here
                        });
                      },
                      child: Container(
                        height: height / 16.86,
                        width: width / 1.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade100,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: width / 180),
                          child: TextFormField(
                            autofocus: true,
                            controller: _controller,
                            onChanged: (value) {
                              setState(() {
                                searchQuery = value.toLowerCase();
                              });
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search_rounded),
                              hintText: "Search here...",
                              contentPadding: EdgeInsets.only(top: 10),
                              hintStyle: GoogleFonts.openSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff18353F),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.grey
                                      .shade300, // Adjust border color here
                                  width: 2.0, // Adjust border width here
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.grey
                                      .shade300, // Adjust border color here
                                  width: 2.0, // Adjust border width here
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.grey
                                      .shade300, // Adjust border color here
                                  width: 2.0, // Adjust border width here
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height / 25.3,
              ),
              Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.only(top: height / 30.16),
                      child: Row(
                        children: [
                          SizedBox(
                            width: width / 30.36,
                          ),
                          Container(
                            height: height / 18.97,
                            width: width / 3.01,
                            decoration: BoxDecoration(
                                color: option == "All"
                                    ? primaryColor
                                    : Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: height / 31.62,
                                  width: width / 16.33,
                                  child: Image.asset(
                                    'assets/Basket.png',
                                    color: option == "All"
                                        ? Colors.white
                                        : Color(0xff2F649A),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      option = "All";
                                    });
                                  },
                                  child: Text(
                                    'All',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w600,
                                      color: option == "All"
                                          ? Colors.white
                                          : Color(0xff2F649A).withOpacity(.5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: width / 39.2,
                          ),
                          Container(
                            height: height / 18.97,
                            width: width / 3.01,
                            decoration: BoxDecoration(
                                color: option == "baby"
                                    ? primaryColor
                                    : Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: height / 31.62,
                                  width: width / 16.33,
                                  child: Image.asset(
                                    'assets/Sleeping Baby.png',
                                    color: option == "baby"
                                        ? Colors.white
                                        : Color(0xff2F649A),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      option = "baby";
                                    });
                                  },
                                  child: Text(
                                    'Baby',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.openSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: option == "baby"
                                          ? Colors.white
                                          : Color(0xff2F649A).withOpacity(.5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: width / 39.2,
                          ),
                          Container(
                            height: height / 18.97,
                            width: width / 3.01,
                            decoration: BoxDecoration(
                                color: option == "senior"
                                    ? primaryColor
                                    : Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: height / 31.62,
                                  width: width / 16.33,
                                  child: Image.asset(
                                    'assets/Elderly Person.png',
                                    color: option == "senior"
                                        ? Colors.white
                                        : Color(0xff2F649A),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      option = "senior";
                                    });
                                  },
                                  child: Text(
                                    'Senior',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: option == "senior"
                                          ? Colors.white
                                          : Color(0xff2F649A).withOpacity(.5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: width / 39.2,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 25.3,
                  ),
                  StreamBuilder(
                      stream: option == 'All'
                          ? (searchQuery.isEmpty
                              ? FirebaseFirestore.instance
                                  .collection("Product")
                                  .snapshots()
                              : FirebaseFirestore.instance
                                  .collection("Product")
                                  .where('name',
                                      isGreaterThanOrEqualTo:
                                          searchQuery.toLowerCase())
                                  .where('name',
                                      isLessThanOrEqualTo:
                                          searchQuery.toLowerCase() + '\uf8ff')
                                  .snapshots())
                          : (searchQuery.isEmpty
                              ? FirebaseFirestore.instance
                                  .collection("Product")
                                  .where('for', isEqualTo: option)
                                  .snapshots()
                              : FirebaseFirestore.instance
                                  .collection("Product")
                                  .where('for', isEqualTo: option)
                                  .where('name',
                                      isGreaterThanOrEqualTo:
                                          searchQuery.toLowerCase())
                                  .where('name',
                                      isLessThanOrEqualTo:
                                          searchQuery.toLowerCase() + '\uf8ff')
                                  .snapshots()),
                      builder: (context, snapshots) {
                        if (!snapshots.hasData)
                          return CircularProgressIndicator();
                        return GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 4 / 5),
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: snapshots.data!.docs.length,
                            itemBuilder: (context, index) {
                              var product = snapshots.data!.docs[index];
                              return Padding(
                                padding: EdgeInsets.only(
                                    right: width / 24, left: width / 18),
                                child: Container(
                                  width: width / 1.26,
                                  height: height / 4.46,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProductDetailScreen(
                                                          product['image'],
                                                          product.id,
                                                          product['name'],
                                                          product['price'],
                                                          product[
                                                              'description'])));
                                        },
                                        child: Stack(
                                          alignment: Alignment.topRight,
                                          children: [
                                            Container(
                                                width: width / 1.86,
                                                height: height / 6.2,
                                                decoration: BoxDecoration(
                                                  color: Color(0xffECF5FF),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      top: height / 37.7,
                                                      right: width / 18),
                                                  child: Image.network(
                                                      product['image']),
                                                )),
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Container(
                                                  height: height / 25.97,
                                                  width: width / 13.8,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Color(0xff2F649A),
                                                  ),
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.bookmark,
                                                      color: Colors.white,
                                                      size: 17,
                                                    ),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: width / 36,
                                            top: height / 188.5),
                                        child: Text(
                                          product['name'],
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.openSans(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xff18353F),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: width / 36,
                                        ),
                                        child: Text(
                                          "₹ ${product['price'].toString()}",
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.openSans(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800,
                                            color: Color(0xff2F649A),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      })
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
