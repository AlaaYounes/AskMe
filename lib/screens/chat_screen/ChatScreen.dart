import 'package:askme/screens/chat_screen/chatroom.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:path/path.dart';

import '../../shared/component/Constants.dart';

class ChatScreen extends StatelessWidget {
  @override
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  String? chatRoomId(String sender, String receiver){
    if(sender[0].toLowerCase().codeUnits[0] > receiver[0].toLowerCase().codeUnits[0]){
      return "$sender & $receiver";
    } else {
      return "$receiver & $sender";
    }
  }
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey,
                    ),
                    // child: Container(
                    //   height: 40.0,
                    //   child: Row(
                    //     children: [
                    //       Icon(Icons.search),
                    //       Text('Search'),
                    //     ],
                    //   ),
                    // ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                FutureBuilder<QuerySnapshot>(
                  future: usersCollection.get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error retrieving users: ${snapshot.error}');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    List<DocumentSnapshot> documents = snapshot.data!.docs;

                    return ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: documents.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic>? userData =
                            documents[index].data() as Map<String, dynamic>?;
                        return buildChatItem(user: userData, context: context);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 10.0,
                        );
                      },
                    );
                  },
                ),
                // ListView.separated(
                //   physics: NeverScrollableScrollPhysics(),
                //   shrinkWrap: true,
                //   scrollDirection: Axis.vertical,
                //   itemBuilder: (context, index){
                //     return buildChatItem();
                //   },
                //   separatorBuilder: (context, index){
                //     return SizedBox(
                //       height: 10.0,
                //     );
                //   },
                //   itemCount: 15,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 1. build item
  // 2. build list
  // 3. add item to list

  Widget buildChatItem({
    required Map<String, dynamic>? user,
    required context,
  }) {
    return GestureDetector(
      onTap: (){
        String? roomchatId = chatRoomId(data!['username'], user['username']);
        Navigator.push(context , MaterialPageRoute(builder: (context)=> ChatRoom(user, roomchatId!)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          margin: EdgeInsets.all(5),
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: HexColor('E3F4F4'),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 10.0,
              ),
              CircleAvatar(
                radius: 27.0,
                backgroundImage: AssetImage('images/avatar.png'),
              ),
              SizedBox(
                width: 10.0,
              ),
              SizedBox(
                width: 20.0,
              ),
              Text(
                '${user!['username']}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
