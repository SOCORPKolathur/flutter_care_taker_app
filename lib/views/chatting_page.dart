import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'navbar.dart';

class ChattingPage extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String option;
  final String otherUid;

  ChattingPage(this.imageUrl, this.name, this.option, this.otherUid);

  @override
  State<ChattingPage> createState() => _ChattingPageState();
}

class _ChattingPageState extends State<ChattingPage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: width / 0.98,
                child: Image.asset('assets/Ellipse.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: width / 7.84,
                    height: height / 15.18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 65),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(widget.imageUrl),
                  ),
                  title: Text(
                    widget.name,
                    style: GoogleFonts.openSans(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text(
                    widget.option,
                    style: GoogleFonts.openSans(
                        fontSize: 13,
                        color: Colors.white.withOpacity(.7),
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: Padding(
                    padding: EdgeInsets.only(right: width / 24),
                    child: Container(
                      width: width / 7.84,
                      height: height / 16.86,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => NavBar()));
                          },
                          icon: Icon(Icons.menu)),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height / 37.95,
          ),
          // Expanded(
          //   child: StreamBuilder<QuerySnapshot>(
          //     stream: FirebaseFirestore.instance
          //         .collection('Chats')
          //         .doc('${FirebaseAuth.instance.currentUser!.uid}${widget.otherUid}')
          //         .collection('Messages')
          //         .orderBy('timestamp', descending: true)
          //         .snapshots(),
          //     builder: (context, snapshot) {
          //       if (!snapshot.hasData) {
          //         return Center(child: CircularProgressIndicator());
          //       }
          //       var messages = snapshot.data!.docs;
          //
          //       return ListView.builder(
          //         reverse: true,
          //         itemCount: messages.length,
          //         itemBuilder: (context, index) {
          //           var message = messages[index];
          //           bool isSender = message['senderId'] == FirebaseAuth.instance.currentUser!.uid;
          //
          //           return Column(
          //             children: [
          //               BubbleSpecialThree(
          //                 text: message['text'],
          //                 textStyle: GoogleFonts.openSans(
          //                     color: Colors.white, fontSize: 16),
          //                 color: Color(0xFF2F649A),
          //                 tail: true,
          //                 isSender: isSender,
          //               ),
          //               SizedBox(
          //                 height: height / 151.8,
          //               ),
          //             ],
          //           );
          //         },
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 65,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: TextField(
                            controller: controller,
                            textCapitalization: TextCapitalization.sentences,
                            onSubmitted: (value) {
                              onSendTap();
                            },
                            textInputAction: TextInputAction.send,
                            showCursor: true,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter text"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      onSendTap();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30)),
                      child: const Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  onSendTap() {
    String messageText = controller.text.trim();
    if (messageText.isNotEmpty) {
      controller.clear();

      var chatId =
          '${FirebaseAuth.instance.currentUser!.uid}${widget.otherUid}';
      var otherChatId =
          '${widget.otherUid}${FirebaseAuth.instance.currentUser!.uid}';
      var timestamp = FieldValue.serverTimestamp();

      FirebaseFirestore.instance
          .collection('Chats')
          .doc(chatId)
          .collection('Messages')
          .add({
        'text': messageText,
        'senderId': FirebaseAuth.instance.currentUser!.uid,
        'receiverId': widget.otherUid,
        'timestamp': timestamp,
      });

      FirebaseFirestore.instance
          .collection('Chats')
          .doc(otherChatId)
          .collection('Messages')
          .add({
        'text': messageText,
        'senderId': FirebaseAuth.instance.currentUser!.uid,
        'receiverId': widget.otherUid,
        'timestamp': timestamp,
      });
    }
  }
}
