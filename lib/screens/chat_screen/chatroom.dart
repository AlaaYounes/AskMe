import 'package:askme/shared/component/Constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ChatRoom extends StatelessWidget {
  final Map<String, dynamic> receiver;
  final String chatRoomId;

  ChatRoom(this.receiver, this.chatRoomId);

  final TextEditingController messageController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void onSendMessage() async {
    if (messageController.text.isNotEmpty) {
      Map<String, dynamic> messages = {
        "username": data['username'],
        "sendby": _auth.currentUser!.email,
        "message": messageController.text,
        "time": FieldValue.serverTimestamp(),
      };

      messageController.clear();
      await _firestore
          .collection('chatroom')
          .doc(chatRoomId)
          .collection('chats')
          .add(messages);
    } else {
      print("Enter Some Text");
    }
  }

  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('FE8235'),
        title: Text('${receiver['username']}'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
            children: [
              SizedBox(height: 10,),
              Container(
                height: size.height / 1.25,
                width: size.width,
                child: StreamBuilder<QuerySnapshot>(
                  stream: _firestore
                      .collection('chatroom')
                      .doc(chatRoomId)
                      .collection('chats')
                      .orderBy("time", descending: false)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.data != null) {
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> map = snapshot.data!.docs[index]
                              .data() as Map<String, dynamic>;
                          return messages(size, map, context);
                        },
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
              Container(
                height: size.height / 10,
                width: size.width,
                alignment: Alignment.center,
                child: Container(
                  height: size.height / 12,
                  width: size.width / 1.1,
                  decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                          color: Colors.orange,
                          width: 2,
                        )),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: messageController,
                          style: TextStyle(
                            fontSize: 18
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 20,
                            ),
                            border: InputBorder.none,
                            hintText: 'write your message here...',
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // messageController.clear();
                          onSendMessage();
                        },
                        child: Text(
                          'send',
                          style: TextStyle(
                            color: Colors.blue[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // child: Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Container(
                  //       height: size.height / 17,
                  //       width: size.width / 1.3,
                  //       child: TextField(
                  //         controller: _message,
                  //         decoration: InputDecoration(
                  //           // suffixIcon: IconButton(
                  //           //   onPressed: () {},
                  //           //   icon: Icon(Icons.photo),
                  //           // ),
                  //             hintText: "Send Message",
                  //             border: OutlineInputBorder(
                  //               borderRadius: BorderRadius.circular(8),
                  //             )),
                  //       ),
                  //     ),
                  //     SizedBox(width: 2),
                  //     IconButton(
                  //         icon: Icon(Icons.send),
                  //         onPressed: () {
                  //
                  //           onSendMessage();
                  //         }
                  //     ),
                  //   ],
                  // ),
                ),
              ),
            ],
          ),
      ],
        ),
      ),
    );
  }


  Widget messages(Size size, Map<String, dynamic> map, BuildContext context) {
    return Container(
      width: size.width,
      alignment: map['sendby'] == _auth.currentUser!.email
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.blue,
        ),
        child: Text(
          map['message'],
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
